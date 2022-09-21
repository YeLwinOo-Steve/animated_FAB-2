import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/model.dart';
import '../domain/controller.dart';
import '../resource/resource.dart';

class HtoeKwat extends StatelessWidget {
  HtoeKwat({Key? key}) : super(key: key);
  final controller = Get.find<LotteryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('ထိုးကွက်', style: TextStyle(color: ColorManager.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: controller.obx(
          (state) {
            ApiResponse response = state;
            String numbers = response.numbers!;
            List<String> htoeKwat = numbers.split(',');
            String str = '${htoeKwat[0]},';
            for (int i = 1; i < htoeKwat.length - 1; i++) {
              str += htoeKwat[i];

              if (i % 4 == 0) {
                str += '\n';
              } else {
                str += ',';
              }
            }
            str += htoeKwat[htoeKwat.length - 1];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(str),
                const SizedBox(height: 65),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: FontSize.body2),
                    children: [
                      const TextSpan(
                        text: 'ထိုးကွက်',
                        style: TextStyle(color: ColorManager.primary),
                      ),
                      TextSpan(
                        text: '${response.description}',
                        style: const TextStyle(color: ColorManager.black),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
