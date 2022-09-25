import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/model.dart';
import '../domain/controller.dart';
import '../resource/resource.dart';

class OneChange extends StatelessWidget {
  OneChange({Key? key}) : super(key: key);
  final controller = Get.find<LotteryController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '၀မ်းချိန်း',
          style: TextStyle(color: ColorManager.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.18, left: 15, right: 15),
        child: controller.obx(
          (state) {
            ApiResponse response = state;
            String numbers = response.numbers!;
            List<String> oneChange = numbers.split(',');
            String str = '${oneChange[0]}\n';
            for (int i = 1; i < oneChange.length - 1; i++) {
              str += oneChange[i];

              if (str.length % 2 == 0) {
                str += '\n';
              } else {
                str += '.';
              }
            }
            str = oneChange[oneChange.length - 1];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.3,
                  width: double.infinity,
                  child: Scrollbar(
                    radius: const Radius.circular(10),
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenHeight * 0.17),
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
                ),
                SizedBox(height: screenHeight * 0.1),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: FontSize.body2),
                    children: [
                      const TextSpan(
                        text: '၀မ်းချိန်း',
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
