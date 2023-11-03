import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ckt/common/apis/common.dart';
import 'package:flutter_ckt/common/entities/loan/loan.dart';
import 'package:flutter_ckt/common/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../common/routers/names.dart';
import '../../../../common/utils/log_util.dart';
import '../../../../common/utils/logger.dart';
import '../../../../common/widgets/dy_behavior_null.dart';
import '../../../../common/widgets/empty_page.dart';
import '../../../../common/widgets/my_scroll_physics.dart';
import '../../../../common/widgets/refresh.dart';
import 'custom_dialog.dart';

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

class FinPages extends StatefulWidget {
  const FinPages({Key? key}) : super(key: key);

  @override
  _FinPageState createState() => _FinPageState();
}

class _FinPageState extends State<FinPages> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController _scrollControl = ScrollController();
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
  List<Data> loanData = <Data>[];
  int page =1;
  String userId = StorageService.to.getString("memberId");
  var ff =Get.arguments;
  int cnId =0 ;
  String titles ="我的客户";
  String remark ="";
  @override
  void initState() {
    if  (ff!=null) {
      cnId = ff["cn_id"];
      titles = ff["title"];
      remark = ff["remark"];
    }
    _df();
    super.initState();
  }

  _df() async {
    Map<String,dynamic> data = {};
    // var f = await CommonAPI.getSaleManMyUserList(data);
    // var g = await CommonAPI.getSaleManChannel(data);
    // var h = await CommonAPI.getStep(data);
    // var i = await CommonAPI.getStaff(data);
    // var j = await CommonAPI.changeSaleManStepStatus(data);
    // var k = await CommonAPI.changeSaleBaseInfo(data);
    // var l = await CommonAPI.getSaleManDetail(189);
    // var m = await CommonAPI.getSaleManGrid();

    var d = await CommonAPI.getLoanList(page,groupValue,userId,cnId);
    if (d.data != null && d.data?.data != null) {
      loanData = d.data!.data!;
      if (mounted)
      setState((){});
    }
  }

  MyItem getStatus(Data data) {
    String status = "";
    Color color = const Color(0xffFF6666);
    String icon = "";

    if (data.status == 9) {
      status = "放款失败";
      color = const Color(0xff4CD070);
      icon = "assets/images/default/fine_fail.png";

    }
    if (data.status == 11) {
      status = "资质不符";
      color = const Color(0xff4CD070);
      icon = "assets/images/default/fine_no.png";
    }
    if (data.status == 10) {
      status = "客户放弃";
      color = const Color(0xff6360CA);
      icon = "assets/images/default/fine_lost.png";
    }
    if (data.status == 1) {
      status = "联系中";
      color = const Color(0xff4DA1EE);
      icon = "assets/images/default/fine_call.png";
    }
    if (data.status == 8) {
      status = "已放款";
      color = const Color(0xffD8AA0F);
      icon = "assets/images/default/fine_success.png";
    }
    return MyItem(
      icon: icon,
      name: data.csName,
      status: status,
      money: data.loanAmount.toString(),
      time: data.submitTime,
      count: data.loanCycle.toString(),
      color: color,
    );
  }

  List<GestureDetector> _buildMyItem() {
    if (loanData.isEmpty){
      return [GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.FineDetail);
        },
        child: EmptyPage(),
      )];
    }
    return loanData
        .map((e) => GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.FineDetail,arguments: e.loanId);
              },
              child: MyContent(
                icon: getStatus(e).icon,
                name: getStatus(e).name,
                money: getStatus(e).money,
                count: getStatus(e).count,
                status: getStatus(e).status,
                time: getStatus(e).time,
                color: getStatus(e).color,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          appBarTheme: AppBarTheme.of(context).copyWith(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light, // Status bar
            ),
          ),
        ),
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0, 0.5, 1],
                  colors: [
                    Color(0xffE2F1FF),
                    Color(0xffF9FBEB),
                    Color(0xffFFF4FA)
                  ],
                  begin: Alignment(2, 1),
                  end: Alignment(-2, -1),
                )),
            child: Scaffold(
            backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
            //endDrawer: CategoryEndDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              titleSpacing: 170.w,
              title: Text(titles,
                  style: TextStyle(
                    fontSize: 38.sp,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  )),
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return QrCodeDialog(remark+"?code="+cnId.toString());
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 40.w),
                    child: Image.asset(
                      'assets/images/default/qrcode.png',
                      color: Colors.blue,
                      width: 40.w,
                      height: 40.h,
                    ),
                  ),
                ),
              ],
            ),
            body: SizedBox(
                  height: ScreenUtil().screenHeight,
                  child: Container(
                    margin: EdgeInsets.only(top: 30.h),
                    child: Stack(
                      children: [
                        _buildContent(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            const MyCard(),
                            const MyCard1(),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                        _buildHeader(context, groupValue,
                            (int index, bool value, String name) {
                          // print(index);
                          // print(value);
                          // print(name);
                          title = name;
                          setState(() {
                            myName = name;
                            myValue = value;
                            groupValue = index;
                            if (!value) {
                              title = "请选择当前状态";
                              groupValue = -1;
                            }
                          });
                        }, title),
                      ],
                    ),
                  ),
                ))));
  }

  Future<bool> _whenPop(BuildContext context) async {
    return true;
  }
// 下拉刷新
  void getData(int status) async {
    page =1;
    var d = await CommonAPI.getLoanList(page,groupValue,userId,cnId);
    if (d.data != null && d.data?.data != null) {
      loanData = d.data!.data!;
      _refreshController.resetNoData();

      setState((){});
    }
  }
// 下拉刷新
  void _onRefresh() async {
    // var result = await IssuesApi.getErpUser();
    // dm = dm1.reversed.toList();
    page =1;
    var d = await CommonAPI.getLoanList(page,groupValue,userId,cnId);
    if (d.data != null && d.data?.data != null) {
      loanData = d.data!.data!;
      _refreshController.resetNoData();

      setState((){});
    }
    _refreshController.refreshCompleted();

  }

// 上拉加载
  void _onLoading() async {
    //var result = await IssuesApi.getErpUser();
    page=page+1;
    var d = await CommonAPI.getLoanList(page,groupValue,userId,cnId);
    if (d.data != null && d.data?.data != null) {
      loanData.addAll(d.data!.data!);
      if (d.data!.data!.isEmpty){
        _refreshController.loadNoData();
        return;
      }
      setState((){});
    }
   _refreshController.loadComplete();

  }

  Widget _buildContent(BuildContext context) => WillPopScope(
      onWillPop: () => _whenPop(context),
      child: ScrollConfiguration(
          behavior: DyBehaviorNull(),
          child: Opacity(
            opacity: opacity,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.w),
                      topRight: Radius.circular(40.w))),
              margin: EdgeInsets.only(top: 200.h),
              child: Container(
                margin: EdgeInsets.only(top: 60.h),
                child: SmartRefresher(
                    physics: const MyScrollPhysics(),
                    enablePullDown: true,
                    enablePullUp: true,
                    header: DYrefreshHeader(),
                    footer: DYrefreshFooter(),
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: SingleChildScrollView(
                      controller: _scrollControl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _buildMyItem(),
                      ),
                    )),
              ),
            ),
          )));

  Widget _buildHeader(BuildContext context, int groupValues,
          ChangeCallback callback, titles) =>
      Stack(
        children: [
          Container(
            decoration: show
                ? BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(218, 218, 218, 0.4),
                        //阴影默认颜色,不能与父容器同时设置color
                        offset: Offset(0, 470.h),
                        //延伸的阴影，向右下偏移的距离
                        blurRadius: 0.h, //延伸距离,会有模糊效果
                      )
                    ],
                  )
                : null,
            margin: EdgeInsets.only(top: 200.h),
            child: Container(
              height: heights,
              decoration: BoxDecoration(
                  color: cc,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.w),
                      topRight: Radius.circular(40.w))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 40.h),
                        child: Text(
                          titles,
                          style: TextStyle(
                              fontSize: 30.sp, color: Colors.black),
                        ),
                      ),
                      IconButton(
                        icon: Icon(show
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined),
                        onPressed: () {

                          setState(() {
                            show = !show;
                            if (show) {
                              heights = 500.h;
                              cc = Colors.white;
                              opacity = 1;
                            } else {
                              heights = closeHeights;
                              cc = Colors.transparent;
                              opacity = 1.0;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Visibility(
                    visible: show,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40.h, top: 20.h),
                          child: Column(
                            children: [
                              buildButton(context, groupValues, callback),
                              Container(
                                padding: EdgeInsets.only(top: 60.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 0.w,
                                          top: 6.h,
                                          right: 25.w,
                                          bottom: 16.h),
                                      height: 88.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                show = !show;
                                                if (show) {
                                                  heights = 450.h;
                                                  cc = Colors.white;
                                                  opacity = 0.1;
                                                } else {
                                                  heights = closeHeights;
                                                  cc = Colors.transparent;
                                                  opacity = 1.0;
                                                }
                                                getData(0);
                                                groupValue = -1;
                                                myValue = false;
                                                myName = "";
                                                title = "请选择当前状态";
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 130.w,
                                                  top: 6.h,
                                                  right: 130.w,
                                                  bottom: 6.h),
                                              height: 80.h,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  left: BorderSide(
                                                      color: Colors.grey,
                                                      width: 2.w),
                                                  top: BorderSide(
                                                      color: Colors.grey,
                                                      width: 2.w),
                                                  right: BorderSide(
                                                      color: Colors.grey,
                                                      width: 2.w),
                                                  bottom: BorderSide(
                                                      color: Colors.grey,
                                                      width: 2.w),
                                                ),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(34.w),
                                                  bottomLeft:
                                                      Radius.circular(34.w),
                                                ),
                                              ),
                                              child: Text(
                                                '重置',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30.sp),
                                                textAlign:
                                                    TextAlign.center,
                                              ),
                                              alignment:
                                                  Alignment.centerLeft,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              //var result = await IssuesApi.getErpUser();
                                              setState(() {
                                                show = !show;
                                                if (show) {
                                                  heights = 450.h;
                                                  cc = Colors.white;
                                                  opacity = 0.1;
                                                } else {
                                                  heights = closeHeights;
                                                  cc = Colors.transparent;
                                                  opacity = 1.0;
                                                }

                                                if (groupValue == -1) {
                                                  getData(0);
                                                }else{
                                                  getData(groupValue);
                                                }
                                              });
                                              _scrollControl.jumpTo(0);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 130.w,
                                                  top: 12.h,
                                                  right: 130.w,
                                                  bottom: 12.h),
                                              height: 80.h,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        right:
                                                            Radius.circular(
                                                                34.w)),
                                              ),
                                              child: Text('确定',
                                                  style: TextStyle(
                                                      fontSize: 30.sp,
                                                      color:
                                                          Colors.white)),
                                              alignment:
                                                  Alignment.centerLeft,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
}

Widget buildButton(
    BuildContext context, int groupValue, ChangeCallback callback) {


  return Container(
    padding: EdgeInsets.only(left: 0.w, right: 0.w),
    alignment: Alignment.centerLeft,
    child: Wrap(runSpacing: 30.w, spacing: 30.w, children: [
      MButton(
        name: "已放款",
        index: 8,
        groupValue: groupValue,
        callback: callback,
      ),
      MButton(
        name: "放款失败",
        index: 9,
        groupValue: groupValue,
        callback: callback,
      ),
      MButton(
        name: "客户放弃",
        index: 10,
        groupValue: groupValue,
        callback: callback,
      ),
      MButton(
        name: "资质不符",
        index: 11,
        groupValue: groupValue,
        callback: callback,
      ),
      MButton(
        name: "联系中",
        index: 1,
        groupValue: groupValue,
        callback: callback,
      ),
    ]),
  );
}

typedef ChangeCallback = void Function(int index, bool value, String name);

class MButton extends StatefulWidget {
  final String name;
  final int index;

  final int groupValue;
  final ChangeCallback callback;

   const MButton(
      {Key? key, required this.name,
      required this.index,
      required this.groupValue,
      required this.callback}) : super(key: key);

  @override
  _MButtonState createState() => _MButtonState();
}

class _MButtonState extends State<MButton> {
  @override
  Widget build(BuildContext context) {
    bool selected = widget.groupValue == widget.index;
    return ChoiceChip(
      backgroundColor: selected ? Colors.white : const Color(0xffF5F6F9),
      selectedColor: selected ? Colors.transparent : const Color(0xffF5F6F9),
      side: BorderSide(
          width: 2.w, color: selected ? Colors.blue : Colors.transparent),
      padding:
          EdgeInsets.only(left: 40.w, right: 40.w, top: 15.h, bottom: 15.h),
      labelPadding: EdgeInsets.only(left: 0.w, right: 0.w),
      selectedShadowColor: Colors.transparent,
      shadowColor: Colors.transparent,
      pressElevation: 0,
      elevation: 0,
      label: Text(
        widget.name,
        style: TextStyle(
            color: selected ? Colors.blue : Colors.black,
            fontSize: 30.sp,
            fontWeight: FontWeight.normal),
        overflow: TextOverflow.ellipsis,
      ),
      selected: selected,
      onSelected: (bool value) {
        setState(() {
          widget.callback(widget.index, !selected, widget.name);
        });
      },
    );
  }
}

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            stops: [0, 1],
            colors: [Color(0xffA4D3FF), Color(0xff1890FF)],
            begin: Alignment(1, -1),
            end: Alignment(-1, -1),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.w))),
      width: 320.w,
      height: 120.h,
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Text("共获取客户",
                            style: TextStyle(
                                color: Colors.white, fontSize: 30.sp))),
                    Text("4人",
                        style: TextStyle(
                            color: Colors.white, fontSize: 30.sp)),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(),
                ],
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              right: 10.w,
              child: SizedBox(
                  width: 110.w,
                  height: 110.h,
                  child: Image.asset("assets/images/default/customer.png")))
        ],
      ),
    );
  }
}

class MyCard1 extends StatefulWidget {
  const MyCard1({Key? key}) : super(key: key);

  @override
  _MyCard1State createState() => _MyCard1State();
}

class _MyCard1State extends State<MyCard1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            stops: [0, 1],
            colors: [Color(0xffFFB83A), Color(0xffFFD58A)],
            begin: Alignment(-1, -1),
            end: Alignment(1, -1),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.w))),
      width: 320.w,
      height: 120.h,
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Text("已放款",
                            style: TextStyle(
                                color: Colors.white, fontSize: 30.sp))),
                    Text("8人",
                        style: TextStyle(
                            color: Colors.white, fontSize: 30.sp)),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(),
                ],
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              right: 10.w,
              child: SizedBox(
                  width: 110.w,
                  height: 110.h,
                  child: Image.asset("assets/images/default/money.png")))
        ],
      ),
    );
  }
}

class MyContent extends StatefulWidget {
  final String icon;
  final String name;
  final String money;
  final String count;
  final String status;
  final String time;
  final Color color;

   const MyContent(
      {Key? key, required this.icon,
      required this.name,
      required this.money,
      required this.count,
      required this.status,
      required this.time,
      required this.color}) : super(key: key);

  @override
  _MyContentState createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 40.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                      width: 90.w,
                      height: 90.h,
                      child: Image.asset(widget.icon))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 0.h, left: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 0.h),
                        child: Text(widget.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600))),
                    Text(
                        "贷款金额:  " +
                            widget.money +
                            "万 期数:  " +
                            widget.count +
                            "期",
                        style: TextStyle(
                            color: Colors.black, fontSize: 30.sp)),
                    Text(widget.time,
                        style: TextStyle(
                            color: Colors.grey, fontSize: 25.sp)),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                    right: 40.w,
                  ),
                  child: Text(widget.status,
                      style: TextStyle(color: widget.color, fontSize: 26.sp))),
            ],
          ),
        ],
      ),
    );
  }
}
