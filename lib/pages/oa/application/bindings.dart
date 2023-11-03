import 'package:flutter_klipper/pages/conversion/logic.dart';
import 'package:flutter_klipper/pages/conversion/view.dart';
import 'package:flutter_klipper/pages/flow_page/logic.dart';
import 'package:flutter_klipper/pages/frame/login/logic.dart';
import 'package:flutter_klipper/pages/home/logic.dart';
import 'package:flutter_klipper/pages/main/index.dart';
import 'package:flutter_klipper/pages/oa/home_message/logic.dart';
import 'package:flutter_klipper/pages/oa/person/logic.dart';
import 'package:flutter_klipper/pages/oa/work/logic.dart';
import 'package:flutter_klipper/pages/peer_chat/logic.dart';
import 'package:get/get.dart';

import 'controller.dart';

class OAApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OAApplicationController>(() => OAApplicationController());
    Get.lazyPut<HomeMessageLogic>(() => HomeMessageLogic());
    Get.lazyPut<PersonLogic>(() => PersonLogic());
    Get.lazyPut<WorkLogic>(() => WorkLogic());

  }
}
