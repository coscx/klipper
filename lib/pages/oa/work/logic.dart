import 'package:get/get.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart' as fluwx;
import '../../../common/apis/common.dart';
import '../../../common/services/storage.dart';
import 'state.dart';
class WorkLogic extends GetxController {
  final WorkState state = WorkState();
  var name ="MSTAR";
  String bind="微信绑定";
  var memberId="0";
  var userHead =
      'https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg';
  String lost="0";
  String join="0";
  String connect="0";
  @override
  void onInit() {
    init();
    super.onInit();
  }
  void init()async{
    memberId = StorageService.to.getString("memberId");
    userHead = StorageService.to.getString("avatar");
    name = StorageService.to.getString("name");

    Future.delayed(const Duration(milliseconds: 1)).then((e) async {
      name =   StorageService.to.getString("name");
      var openid=  StorageService.to.getString("openid");
      memberId = StorageService.to.getString("memberId");
      userHead = StorageService.to.getString("avatar");
      if(openid == ""){

      }else{
        bind="已绑定微信";
      }
      var result = await CommonAPI.getDashBord();
      if (result.code == 200) {
        var d = result.data.top;

        lost = d.yesterdayLost.toString();
        join = d.yesterdayCreate.toString();
        connect = d.yesterdayConnect.toString();


      } else {

      }
      update();
    });
  }
  void bindWxOnTap(){
    fluwx
        .sendWeChatAuth(
        scope: "snsapi_userinfo", state: "wechat_sdk_demo_bind")
        .then((data) {});
  }

}
