//封装 通用局部刷新工具类
//定义函数别名
import 'package:flutter/cupertino.dart';

typedef BuildWidget = Widget Function();

class PartRefreshWidget extends StatefulWidget {

  PartRefreshWidget(Key key, this._child): super(key: key);
  BuildWidget _child;

  @override
  State<StatefulWidget> createState() {
    return PartRefreshWidgetState(_child);
  }

}

class PartRefreshWidgetState extends State<PartRefreshWidget> {

  BuildWidget child;

  PartRefreshWidgetState(this.child);

  @override
  Widget build(BuildContext context) {
    return child.call();
  }

  void update() {

    setState(() {

    });
  }

}