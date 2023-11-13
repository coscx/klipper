import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_klipper/common/apis/common.dart';
import 'package:flutter_klipper/common/entities/loan/loan.dart';
import 'package:flutter_klipper/common/widgets/moonraker/commands/commands.dart';
import 'package:flutter_klipper/pages/channel/view.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../common/routers/names.dart';
import '../../../../common/widgets/empty_page.dart';
import '../../../common/entities/loan/channel.dart';
import '../../../common/services/storage.dart';

import '../../common/entities/klipper/cache_temperature_data.dart';
import '../../common/entities/klipper/host_info.dart';
import '../../common/entities/klipper/notify_proc_stat_update.dart';
import '../../common/entities/klipper/notify_status_update.dart';
import '../../common/entities/klipper/objec_subcribe.dart';
import '../../common/entities/klipper/printer.dart';
import '../../common/entities/klipper/server_info.dart';
import '../../common/utils/time_util.dart';
import '../../common/widgets/moonraker/commands/sensor/list.dart';
import '../../common/widgets/moonraker/commands/sensor/measure.dart';
import '../../common/widgets/moonraker/services/status_notifiers.dart';
import '../oa/user_detail/widget/common_dialog.dart';
import 'state.dart';
import '../../common/widgets/klipper.dart';
import '../../common/widgets/moonraker/commands/status/printer_objects_subscription.dart';
import '../../common/widgets/moonraker/commands/status/status_objects.dart';
import '../../common/widgets/moonraker/flutter_klipper_base.dart';
class ChannelLogic extends GetxController  with WidgetsBindingObserver{
  final ChannelState state = ChannelState();
  final RefreshController refreshController =
  RefreshController(initialRefresh: false);
  final ScrollController scrollControl = ScrollController();
  TextEditingController appointController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController keyController = TextEditingController();

  KlipperPlugin klipperPlugin = KlipperPlugin();

  FocusNode remarkFieldNode = FocusNode();
  FocusNode urlFieldNode = FocusNode();
  FocusNode keyFieldNode = FocusNode();
  List<Printer> Printers = [];
  Printer? printer;

  RxString extruderTemperature ="".obs;
  RxDouble extruderTarget=0.0.obs;
  RxDouble extruderPower=0.0.obs;
  RxString heaterBedTemperature ="".obs;
  RxDouble heaterBedTarget =0.0.obs;
  RxDouble heaterBedPower=0.0.obs;

  RxString progress ="0".obs;
  NotifyProcStatUpdate? ns;
  late StreamSubscription<bool> keyboardSubscription;
  HostInfo? ho ;
  Timer? timer;
  RxBool showErr = false.obs;
  bool show = false;
  double heights = 80.h;
  double closeHeights = 80.h;
  Color cc = Colors.transparent;
  double opacity = 1.0;
  int groupValue = -1;
  String title = "请选择当前状态";
  var dm = <MyItem>[];
  var dm1 = <MyItem>[];
  String myName = "";
  bool myValue = false;
  String cnType ="2";
  List<ChannelDataData> loanData = <ChannelDataData>[];
  int page =1;
  bool showAdd =true;
  List dropdownItemList = [
    {'label': '渠道公司', 'value': '2'},
    {'label': '装修公司', 'value': '3'}, // label is required and unique
  ];

  List<QuickAction> directActions = [
    QuickAction(
      title: ('pages.dashboard.general.move_card.home_all_btn').tr,
      description: ('pages.dashboard.general.move_card.home_all_tooltip').tr,
      icon: Icons.home,
      callback: (){}
    ),

      QuickAction(
          title: ('pages.dashboard.general.move_card.qgl_btn').tr,
          description: ('pages.dashboard.general.move_card.qgl_tooltip').tr,
          icon: FlutterIcons.quadcopter_mco,
          callback: (){}),

      QuickAction(
          title: ('pages.dashboard.general.move_card.mesh_btn').tr,
          description: ('pages.dashboard.general.move_card.mesh_tooltip').tr,
          icon: FlutterIcons.map_marker_path_mco,
          callback: (){}),

      QuickAction(
        title: ('pages.dashboard.general.move_card.stc_btn').tr,
        description: ('pages.dashboard.general.move_card.stc_tooltip').tr,
        icon: FlutterIcons.screw_machine_flat_top_mco,
        callback: (){},
      ),

      QuickAction(
        title: ('pages.dashboard.general.move_card.ztilt_btn').tr,
        description: ('pages.dashboard.general.move_card.ztilt_tooltip').tr,
        icon: Icons.architecture,
        callback: (){},
      ),
  ];

  List<QuickAction> calibrationActions = [

      QuickAction(
        title: 'pages.dashboard.general.move_card.poff_btn'.tr,
        description: 'pages.dashboard.general.move_card.poff_tooltip'.tr,
        icon: FlutterIcons.grease_pencil_mco,
        callback: (){},
      ),

      QuickAction(
        title: ('pages.dashboard.general.move_card.bsa_btn').tr,
        description: ('pages.dashboard.general.move_card.bsa_tooltip').tr,
        icon: FlutterIcons.axis_z_rotate_clockwise_mco,
        callback: (){},
      ),

      QuickAction(
        title: 'pages.dashboard.general.move_card.zoff_btn'.tr,
        description: 'pages.dashboard.general.move_card.zoff_tooltip'.tr,
        icon: Icons.vertical_align_bottom,
        callback: (){},
      ),
    QuickAction(
      title: 'pages.dashboard.general.move_card.save_btn'.tr,
      description: 'pages.dashboard.general.move_card.save_tooltip'.tr,
      icon: Icons.save_alt,
      callback: (){},
    ),
  ];

  var m84 = QuickAction(
    title: ('pages.dashboard.general.move_card.m84_btn').tr,
    description: ('pages.dashboard.general.move_card.m84_tooltip').tr,
    icon: Icons.near_me_disabled,
    callback: (){},
  );


  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible){
        remarkFieldNode.unfocus();
      }
    });
    _init();

    super.onInit();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print("页面状态前台${state}");
        _init();
        break;
      case AppLifecycleState.paused:
        print("页面状态后台${state}");
        klipperPlugin.getKlipper?.close();
        break;
      case AppLifecycleState.detached:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.inactive:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
        break;
    }
  }

  Future<void> sendSunCriCommand(Klipper klipper) async {
    List<ObjectStatusQuery> objects = [];


    // WebhookStatusQuery wq = WebhookStatusQuery();
    // objects.add(wq);

    GCodeMoveStatusQuery gmsq = GCodeMoveStatusQuery();
    objects.add(gmsq);

    ToolheadStatusQuery thsq = ToolheadStatusQuery();
    objects.add(thsq);

    ConfigFileStatusQuery cfsq = ConfigFileStatusQuery();
    objects.add(cfsq);

    ExtruderStatusQuery esq = ExtruderStatusQuery();
    objects.add(esq);

    HeaterBedStatusQuery hbsq = HeaterBedStatusQuery();
    objects.add(hbsq);

    FanStatusQuery fsq = FanStatusQuery();
    objects.add(fsq);

    IdleTimeoutStatusQuery itsq = IdleTimeoutStatusQuery();
    objects.add(itsq);

    VirtualSDCardStatusQuery vssq = VirtualSDCardStatusQuery();
    objects.add(vssq);

    PrintStatsStatusQuery pssq = PrintStatsStatusQuery();
    objects.add(pssq);

    DisplayStatusStatusQuery dssq = DisplayStatusStatusQuery();
    objects.add(dssq);

    TemperatureSensorStatusQuery tssq = TemperatureSensorStatusQuery("怪兽8温度");
    objects.add(tssq);

    TemperatureSensorStatusQuery tssq1 = TemperatureSensorStatusQuery("A6-1450温度");
    objects.add(tssq1);
    // TemperatureFanStatusQuery tfsq = TemperatureFanStatusQuery("fan");
    // objects.add(tfsq);

    // FilamentSwitchSensorStatusQuery fssq = FilamentSwitchSensorStatusQuery();
    // objects.add(fssq);
    //
    // OutputPinStatusQuery opsq = OutputPinStatusQuery();
    // objects.add(opsq);

    BedMeshStatusQuery bmsq = BedMeshStatusQuery();
    objects.add(bmsq);

    // GCodeMacroStatusQuery gmasq = GCodeMacroStatusQuery();
    // objects.add(gmasq);
    //
    // CustomStatusQuery cq = CustomStatusQuery();
    // objects.add(cq);

    var hostInfo1String = await  klipper.sendCommand(KlippyHostInfoCommand());
    var hostInfo1Json= json.encode(hostInfo1String);
    HostInfo hostInfo1 = HostInfo.fromJson(hostInfo1String);
    print(hostInfo1);
    if(hostInfo1.state !="ready"){
     ho= hostInfo1;
     showErr.value = true;
    }
    var re = await  klipper.sendCommand(PrinterObjectsSubscribeCommand(objects: objects));
    var t= json.encode(re);
    ObjectSubcribe886333 ob = ObjectSubcribe886333.fromJson(re);
    print(t);

    var re1 = await  klipper.sendCommand(CachedTemperatureDataCommand());
    var t1= json.encode(re1);
    CachedTemperatureData ob1 = CachedTemperatureData.fromJson(re1);
    print(t1);

  }
  _init() async {
    Channels? d = await _getChannels({"pageNum":page});
    if (d!=null && d.data != null && d.data?.data != null) {
      loanData = d.data!.data!;
    }
    update();

    Future<void> callBack(Klipper klipper,int num) async {
      print("connect call back");
      sendSunCriCommand(klipper);
    }

    void  onUnhandledErrorCallBack(dynamic error, dynamic stackTrace){
      print(error);
      print(stackTrace);
    }
    String  printerList = StorageService.to.getString("printerList");
    print(printerList);
    if (printerList.contains("{") && printerList.contains("}") ){
      List<dynamic> h =json.decode(printerList);

      Printers = h.map((e){
        Printer pr = Printer.fromJson(e);
        return pr;
      }).toList();
    }


    int  selectPrinter = StorageService.to.getInt("select_printer");
    if(selectPrinter != 0){
      for (var item in Printers) {
          if (item.id == selectPrinter){
            printer = item;
          }
      }
    }else{
      for (var item in Printers) {
          printer = item;
          break;
      }
    }
    if(printer != null){
      if(klipperPlugin.getKlipper!= null){
        if(!klipperPlugin.getKlipper!.closed){
          klipperPlugin.getKlipper!.close();
        }
      }
      Klipper? klipper = klipperPlugin.init(host: printer!.url, token: printer!.key, callBack: callBack, onUnhandledErrorCallBack: onUnhandledErrorCallBack);
      Future.delayed(const Duration(seconds: 1)).then((e) async {


      });
      klipper?.onMoonrakerStatsEvent.listen((event) {
        Parameters p = event as Parameters;
       // print(p.method);
        var ff = json.encode(p.value);
        ns = (NotifyProcStatUpdate.fromJson(p.value[0]));
       // print(ns);
      });
      klipper?.onBroadcastEvent.listen((event) {
        Parameters p = event as Parameters;
       // print(p.method);
        var ff = json.encode(p.value);
        NotifyStatusUpdate   ns = (NotifyStatusUpdate.fromJson(p.value[0]));
        if(ns.extruder !=null){
          extruderTemperature.value = ns.extruder!.temperature.toStringAsFixed(1);
          if(ns.extruder!.target != -1){
            extruderTarget.value = ns.extruder!.target;
          }
          if(ns.extruder!.power != -1){
            extruderPower.value = ns.extruder!.power;
          }
        }
        if(ns.heater_bed !=null){
          heaterBedTemperature.value = ns.heater_bed!.temperature.toStringAsFixed(1);
          if(ns.heater_bed!.target != -1){
            heaterBedTarget.value = ns.heater_bed!.target;
          }
          if(ns.heater_bed!.power != -1){
            heaterBedPower.value = ns.heater_bed!.power;
          }
        }
       // if(ns.webhooks !=null){
          print(ns);
       // }

      });
      klipper?.onKlippyReadyEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
        if(timer !=null){
          timer!.cancel();
          timer = null;
        }
        _init();
        showErr.value = false;
      });
      klipper?.onKlippyDisconnectedEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onKlippyShutdownEvent.listen((event) async {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);

        var re = await  klipper.sendCommand(KlippyHostInfoCommand());
        var t= json.encode(re);
        HostInfo ob = HostInfo.fromJson(re);
        ho= ob;
        print(t);

        timer = Timer.periodic(Duration(milliseconds: 1000), (t) async {

            Map<String, dynamic> status =  await klipper.getCurrentStatus();
            ServerInfo yy = ServerInfo.fromJson(status);
            print(status);
            if(yy.klippyState == "ready"){
              if(timer != null){
                timer!.cancel();
                timer = null;

              }
              showErr.value =false;
            }
            showErr.value =true;
        });
      });

      klipper?.onAgentEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onSensorEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onAnnouncementDismissedEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onAnnouncementUpdatedEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onAnnouncementWakeEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onButtonEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onFileChangedEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onGCodeResponseEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
        if(p.value[0] == "// Klipper state: Shutdown"){
          print("Klipper state: Shutdown");
        }
      });
      klipper?.onHistoryEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onJobQueueEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });

      klipper?.onServiceStateChangedEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });

      klipper?.onSudoAlertEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });
      klipper?.onThrottlingEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });


      klipper?.onUpdateManagerRefreshedEvent.listen((event) {
        Parameters p = event as Parameters;
        print(p.method);
        print(p.value);
      });

    }

  }
  int generateRandom(int min, int max) {
    int res = min + Random().nextInt(max - min);
    return res;
  }
  Future<Channels?> _getChannels( Map<String,dynamic> data) async {
    String  roleKey = StorageService.to.getString("roleKey");
    if(roleKey =="super"){
      var d = await CommonAPI.getSuperChannel(data);
      return d;
    }
    if(roleKey =="salesman"){
      showAdd =true;
      var d = await CommonAPI.getSaleManChannel(data);
      return d;
    }
    if(roleKey =="director"){
      showAdd =true;
      var d = await CommonAPI.getManageChannel(data);
      return d;
    }
    return null;
  }
   addChannels() async {
    // String  roleKey = StorageService.to.getString("roleKey");
    // if(roleKey =="salesman"){
    //   var d = await CommonAPI.createSaleManChannel({"cnName":appointController.text,"cnType":cnType});
    //   if(d.code ==200){
    //     showToast(Get.context!, d.msg!, false);
    //     appointController.text="";
    //     SmartDialog.dismiss();
    //     onRefresh();
    //   }else{
    //     showToastRed(Get.context!, d.msg!, false);
    //   }
    // }
    // if(roleKey =="director"){
    //   var d = await CommonAPI.createManageChannel({"cnName":appointController.text,"cnType":cnType});
    //   if(d.code ==200){
    //     showToast(Get.context!, d.msg!, false);
    //     appointController.text="";
    //     SmartDialog.dismiss();
    //     onRefresh();
    //   }else{
    //     showToastRed(Get.context!, d.msg!, false);
    //   }
    // }
     var name ="";
     if(appointController.text != ""){
       name  =appointController.text;
     }
     var url ="";
     if(appointController.text != ""){
       url  =urlController.text;
     }
     var key ="";
     if(appointController.text != ""){
       key  =keyController.text;
     }
     Map<String,dynamic > mm = {};
     int id =generateRandom(100000000,999999999);
     mm["id"]=id;
     mm["name"] = name;
     mm["url"] = url;
     mm["key"] = key;
     List l = [];
     l.add(mm);
     StorageService.to.setInt("select_printer", id);
     StorageService.to.setString("printerList", json.encode(l));
     String  printerList = StorageService.to.getString("printerList");
     print(printerList);
     SmartDialog.dismiss();
     _init();
  }
  onDropdownChange(data){
    remarkFieldNode.unfocus();
    cnType = data["value"];
  }
  // 下拉刷新
  void getData(int status) async {
    page =1;
    Channels? d = await _getChannels({"pageNum":page});
    if ( d!=null &&d.data != null && d.data?.data != null) {
      loanData = d.data!.data!;
      refreshController.resetNoData();
    }
    update();
  }
// 下拉刷新
  void onRefresh() async {
    // var result = await IssuesApi.getErpUser();
    // dm = dm1.reversed.toList();
    page =1;
    Channels? d = await _getChannels({"pageNum":page});
    if (d!=null && d.data != null && d.data?.data != null) {
      loanData = d.data!.data!;
      refreshController.resetNoData();
    }
    refreshController.refreshCompleted();
    update();
  }

// 上拉加载
  void onLoading() async {
    //var result = await IssuesApi.getErpUser();

    page=page+1;
    Channels? d = await _getChannels({"pageNum":page});
    if (d!=null && d.data != null && d.data?.data != null) {
      if (page > d.data!.lastPage){
        refreshController.loadNoData();
        return;
      }
      loanData.addAll(d.data!.data!);
      if (d.data!.data!.isEmpty){
        refreshController.loadNoData();
        return;
      }

    }
    refreshController.loadComplete();
    update();
  }
  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }
}
class MyItem {
  final String icon;
  final String name;
  final String money;
  final String count;
  final String status;
  final String time;
  final Color color;

  const MyItem(
      {required this.icon,
        required this.name,
        required this.money,
        required this.count,
        required this.status,
        required this.time,
        required this.color});
}

class QuickAction {

  final String title;
  final String description;
  final IconData icon;
  final FutureOr<void>? Function()? callback;
  const QuickAction({
    required  this.title,
    required  this.description,
    required  this.icon,
    required  this.callback,
  });
}