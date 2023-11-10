import '../widgets/moonraker/flutter_klipper_base.dart';

class KlipperPlugin {
  late  Klipper _klipper;
  static  KlipperPlugin? _instance;
  factory KlipperPlugin() {
    if (_instance == null) {
      _instance =  KlipperPlugin._internal();
    }
    return _instance!;
  }
  Klipper get getKlipper {
    return _klipper;
  }
  KlipperPlugin._internal(){

  }
  /// 初始化
  Klipper init({required String host, required String token,required Function(Klipper klipper,int num) callBack,required Function(dynamic error, dynamic stackTrace) onUnhandledErrorCallBack}) {
    _klipper = Klipper(host, port: 80,token: token,completeCallback: callBack,onUnhandledErrorCallBack: onUnhandledErrorCallBack);
    return _klipper;
  }



}
