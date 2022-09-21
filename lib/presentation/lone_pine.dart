import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/model.dart';
import '../domain/controller.dart';
import '../resource/resource.dart';

class LonePine extends StatelessWidget {
  LonePine({Key? key}) : super(key: key);
  final controller = Get.find<LotteryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('လုံးပိုင်',
            style: TextStyle(color: ColorManager.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: controller.obx(
          (state) {
            ApiResponse response = state;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(
                      '${response.numbers}',
                      style: const TextStyle(
                        fontSize: 67,
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 65),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: FontSize.body2),
                    children: [
                      const TextSpan(
                        text: 'တစ်ကွက်ကောင်း',
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
