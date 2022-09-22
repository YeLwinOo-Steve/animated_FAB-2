import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/model.dart';
import '../domain/controller.dart';
import '../resource/resource.dart';

class ChPlusKey extends StatelessWidget {
  ChPlusKey({Key? key}) : super(key: key);
  final controller = Get.find<LotteryController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ch + Key',
          style: TextStyle(color: ColorManager.black, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.18, left: 15, right: 15),
        child: controller.obx(
          (state) {
            ApiResponse response = state;
            String numbers = response.numbers!;
            List<String> chPlusKey = numbers.split(',');
            String str = '${chPlusKey[0]}+';
            for (int i = 1; i < chPlusKey.length - 1; i++) {
              str += chPlusKey[i];

              if (str.length % 2 == 0) {
                str += '\n';
              } else {
                str += '+';
              }
            }
            str += chPlusKey[chPlusKey.length - 1];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.3,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenHeight * 0.15),
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      str,
                      style: const TextStyle(
                        color: ColorManager.primary,
                        fontSize: 24,
                        fontWeight: FontWeightManager.semibold,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: FontSize.body2),
                    children: [
                      const TextSpan(
                        text: 'Ch+Key',
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
