import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../data/model/model.dart';
import '../resource/resource.dart';

class LotteryController extends GetxController with StateMixin<dynamic> {
  final token = '2345235';
  final ApiClient _apiClient;
  LotteryController({required ApiClient client}) : _apiClient = client;

  void lotteryByType({
    required BuildContext context,
    required String type,
  }) {
    String route = '';
    switch (type) {
      case 'numbers':
        route = AppRoutes.htoeKwat;
        break;
      case 'one_number':
        route = AppRoutes.taKwatKaung;
        break;
      case 'one_change':
        route = AppRoutes.oneChange;
        break;
      case 'lone_paing':
        route = AppRoutes.lonePine;
        break;
      case 'own_number':
        route = AppRoutes.mwalKwat;
        break;
      /* case 'ch_key':
        route = AppRoutes.chPlusKey;
        break; */
    }
    change(null, status: RxStatus.loading());
    Navigator.pushNamed(context, route);
    _apiClient.lotteryByType(type: type, token: token).then(
      (value) {
        ApiResponse response = value;
        change(response, status: RxStatus.success());
      },
    ).onError(
      (error, stackTrace) {
        change(
          error,
          status: RxStatus.error(error.toString()),
        );
      },
    );
  }

  void getPointsByDeviceID({
    //required BuildContext context,
    required String deviceID,
  }) {
    change(null, status: RxStatus.loading());
    _apiClient.getPointsByDeviceID(deviceID: deviceID, token: token).then(
      (value) {
        ApiResponse response = value;
        change(response, status: RxStatus.success());
      },
    ).onError(
      (error, stackTrace) {
        change(
          error,
          status: RxStatus.error(error.toString()),
        );
      },
    );
  }

  void increasePointsByDeviceID({
    //required BuildContext context,
    required String deviceID,
  }) {
    change(null, status: RxStatus.loading());
    _apiClient.increasePointsByDeviceID(deviceID: deviceID, token: token).then(
      (value) {
        ApiResponse response = value;
        change(response, status: RxStatus.success());
      },
    ).onError(
      (error, stackTrace) {
        change(
          error,
          status: RxStatus.error(error.toString()),
        );
      },
    );
  }
}
