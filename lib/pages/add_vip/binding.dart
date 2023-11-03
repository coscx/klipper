import 'package:get/get.dart';

import 'logic.dart';

class AddVipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddVipLogic());
  }
}
