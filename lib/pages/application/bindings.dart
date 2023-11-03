import 'package:flutter_klipper/common/entities/loan/saleman.dart';
import 'package:flutter_klipper/pages/calcucation/logic.dart';
import 'package:flutter_klipper/pages/channel/logic.dart';
import 'package:flutter_klipper/pages/conversion/logic.dart';
import 'package:flutter_klipper/pages/flow_page/logic.dart';
import 'package:flutter_klipper/pages/home/logic.dart';
import 'package:flutter_klipper/pages/main/index.dart';
import 'package:flutter_klipper/pages/my_user/logic.dart';
import 'package:flutter_klipper/pages/other/fine/logic.dart';
import 'package:flutter_klipper/pages/total_user/logic.dart';
import 'package:get/get.dart';
import '../audit_user/logic.dart';
import '../lost_user/logic.dart';
import '../mine/logic.dart';
import '../sms_page/logic.dart';
import 'controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<TotalUserLogic>(() => TotalUserLogic());
    Get.lazyPut<FineLogic>(() => FineLogic());
    Get.lazyPut<MyUserLogic>(() => MyUserLogic());
    Get.lazyPut<AuditUserLogic>(() => AuditUserLogic());
    Get.lazyPut(() => LostLogic());
    Get.lazyPut<ChannelLogic>(() => ChannelLogic());
    Get.lazyPut<CalcucationLogic>(() => CalcucationLogic());
    Get.lazyPut<HomeLogic>(() => HomeLogic());
    Get.lazyPut<MineLogic>(() => MineLogic());
    Get.lazyPut<ConversionLogic>(() => ConversionLogic());
    Get.lazyPut<SmsPageLogic>(() => SmsPageLogic());
  }
}
