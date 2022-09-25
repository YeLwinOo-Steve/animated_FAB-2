import 'package:get/get.dart';

import 'data/api/api_client.dart';
import 'domain/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => LotteryController(client:Get.find<ApiClient>()));
  }
}
