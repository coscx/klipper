import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dy_behavior_null.dart';
import 'common_webview.dart';
import 'log_utils.dart';
import 'navigator_utils.dart';


class ProtocolModel {
   TapGestureRecognizer? _registProtocolRecognizer;
   TapGestureRecognizer? _privacyProtocolRecognizer;

  ///用来显示 用户协议对话框
  Future<bool> showProtocolFunction(BuildContext context) async {
    //注册协议的手势
    _registProtocolRecognizer = TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer = TapGestureRecognizer();

    //苹果风格弹框
    bool isShow = await showCupertinoDialog(
      //上下文对象
      context: context,
      //对话框内容
      builder: (BuildContext context) {
        return cupertinoAlertDialog(context);
      },
    );

    ///销毁
    _registProtocolRecognizer?.dispose();
    _privacyProtocolRecognizer?.dispose();

    return Future.value(isShow);
  }

  CupertinoAlertDialog cupertinoAlertDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("温馨提示"),
      content: Container(
        height: 240,
        padding: EdgeInsets.all(12),
        //可滑动布局
        child: ScrollConfiguration(
          behavior: DyBehaviorNull(),
          child: SingleChildScrollView(
            child: buildContent(context),
          ),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text("不同意"),
          onPressed: () {
            Fluttertoast.showToast(
                msg: "请同意用户服务协议和隐私政策后我们才能继续为您提供服务",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.black.withAlpha(100),
                textColor: Colors.white,
                fontSize: 14.0);
           // exit(0);
           // Navigator.of(context).pop(false);
          },
        ),
        CupertinoDialogAction(
          child: Text("同意"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  //协议说明文案
  String userPrivateProtocol =
      "我们一向尊重并会严格保护用户在使用本产品时的合法权益（包括用户隐私、用户数据等）不受到任何侵犯。本协议（包括本文最后部分的隐私政策）是用户（包括通过各种合法途径获取到本产品的自然人、法人或其他组织机构，以下简称“用户”或“您”）与我们之间针对本产品相关事项最终的、完整的且排他的协议，并取代、合并之前的当事人之间关于上述事项的讨论和协议。本协议将对用户使用本产品的行为产生法律约束力，您已承诺和保证有权利和能力订立本协议。用户开始使用本产品将视为已经接受本协议，请认真阅读并理解本协议中各种条款，包括免除和限制我们的免责条款和对用户的权利限制（未成年人审阅时应由法定监护人陪同），如果您不能接受本协议中的全部条款，请勿开始使用本产品";

  buildContent(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "请您在使用本产品之前仔细阅读",
          style: TextStyle(color: Colors.grey[600]),
          children: [
            TextSpan(
              text: "《用户协议》",
              style: TextStyle(color: Colors.blue),
              //点击事件
              recognizer: _registProtocolRecognizer!
                ..onTap = () {
                  //打开用户协议
                  openUserProtocol(context);
                },
            ),
            TextSpan(
              text: "与",
              style: TextStyle(color: Colors.grey[600]),
            ),
            TextSpan(
              text: "《隐私协议》",
              style: TextStyle(color: Colors.blue),
              //点击事件
              recognizer: _privacyProtocolRecognizer!
                ..onTap = () {
                  //打开隐私协议
                  openPrivateProtocol(context);
                },
            ),
            TextSpan(
              text: userPrivateProtocol,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ]),
    );
  }

  //查看用户协议
  void openUserProtocol(BuildContext context) {
    LogUtils.e("查看用户协议");
    NavigatorUtils.pushPage(
      context: context,
      targPage: CommonWebViewPage(
        pageTitle: "用户协议",
        htmlUrl: "http://link.queqiaochina.com/agree.html",
      ),
    );
  }

  //查看隐私协议
  void openPrivateProtocol(BuildContext context) {
    LogUtils.e("查看隐私协议");
    NavigatorUtils.pushPage(
      context: context,
      targPage: CommonWebViewPage(
        pageTitle: "隐私协议",
        htmlUrl: "http://link.queqiaochina.com/privacy.html",
      ),
    );
  }
}
