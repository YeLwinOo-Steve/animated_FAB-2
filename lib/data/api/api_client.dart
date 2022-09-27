import 'package:get/get.dart';

import '../model/model.dart';

class ApiClient extends GetConnect {
  final String url = 'https://2dshwepattee.com/api/v1';
  late ApiResponse apiResponse;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = url;
  }

  Future<ApiResponse> lotteryByType({
    required String type,
    required String token,
  }) async {
    final response = await get('/lottery/$type', headers: {
      'token': token,
    });
    if (response.status.hasError) {
      return Future.error(response);
    } else {
      return ApiResponse.fromJson(response.body);
    }
  }

  Future<ApiResponse> getPointsByDeviceID({
    required String deviceID,
    required String token,
  }) async {
    final response = await get('/points/$deviceID', headers: {
      'token': token,
    });
    if (response.status.hasError) {
      return Future.error(response);
    } else {
      return ApiResponse.fromJson(response.body);
    }
  }

  Future<ApiResponse> increasePointsByDeviceID({
    required String deviceID,
    required String token,
  }) async {
    final body = {
      "device_id": deviceID,
    };

    final response = await post('/points', body, headers: {'token': token});
    final res = ApiResponse.fromJson(response.body);
    if (response.status.hasError) {
      return Future.error(res.message);
    } else {
      return res;
    }
  }
}
