import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_klipper/common/entities/loan/loan.dart';
import 'package:flutter_klipper/common/entities/loan/saleman.dart';
import 'package:flutter_klipper/pages/my_user/widget/my_user_filter_page.dart';
import 'package:flutter_klipper/pages/total_user/logic.dart';
import 'package:flutter_klipper/pages/user_detail/widget/common_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_bottom_sheet/drag_zone_position.dart';
import 'package:just_bottom_sheet/just_bottom_sheet.dart';
import 'package:just_bottom_sheet/just_bottom_sheet_configuration.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../common/apis/common.dart';
import '../../common/entities/home/common.dart';
import '../../common/services/storage.dart';
import '../select_result/widget/select_result_page.dart';
import 'state.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
class MyUserLogic extends GetxController {
  final MyUserState state = MyUserState();
  List<SaleManDataData> loanData = <SaleManDataData>[];
  final List<SelectItem> selectItems = <SelectItem>[];
  final Map<String, bool> items = Map();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();
  TextEditingController appointController = TextEditingController();
  FocusNode remarkFieldNode = FocusNode();
  TextEditingController appointController1 = TextEditingController();
  FocusNode remarkFieldNode1 = FocusNode();
  bool showAddButton =false;
  String serveType = "1";
  String totalCount = "";
  String title = "客户管理";
  int curPage = 1;
  int pageSize = 20;
  int total = 20;
  int roleId = 0;
  int currentPhotoMode = 0;
  int sex = 1;
  double topDistance = 0;
  bool ff = true;
  bool allSelect = false;
  int groupValue = -1;

  @override
  void onInit() {
    String roleKey = StorageService.to.getString("roleKey");
    if (roleKey == "director") {
      showAddButton =true;
    }
    _loadData();
    super.onInit();
  }
  showAddButtons(){
    String roleKey = StorageService.to.getString("roleKey");
    if (roleKey == "director") {
      showAddButton =true;
    }

  }
  hideAddButtons(){
    showAddButton =false;
  }
  addUser() async {
    var d = await CommonAPI.manageAddUser({"csName":appointController.text,"csPhone":appointController1.text});
    if(d.code ==200){
      showToast(Get.context!, d.msg!, false);
      appointController.text="";
      appointController1.text="";
      SmartDialog.dismiss();
      onRefresh();
    }else{
      showToastRed(Get.context!, d.msg!, false);
    }

  }

  // 下拉刷新
  void _loadData() async {
    curPage = 1;
    String roleKey = StorageService.to.getString("roleKey");
    if (roleKey == "super") {
      var d = await CommonAPI.getSuperMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    } else if (roleKey == "director") {
      var d = await CommonAPI.getManageMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    }else if (roleKey == "salesman") {
      var d = await CommonAPI.getSaleManMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    } else if (roleKey == "administration") {
      var d = await CommonAPI.getAdministrativeMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    }else {
      var d = await CommonAPI.getSuperMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    }
    loanData.map((e) {
      setSelectItem(e);
    }).toList();
    update();
  }

  // 下拉刷新
  void onRefresh() async {
    curPage = 1;
    String roleKey = StorageService.to.getString("roleKey");
    if (roleKey == "super") {
      var d = await CommonAPI.getSuperMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    } else if (roleKey == "director") {
      var d = await CommonAPI.getManageMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    }else if (roleKey == "salesman") {
      var d = await CommonAPI.getSaleManMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    } else if (roleKey == "administration") {
      var d = await CommonAPI.getAdministrativeMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    }else {
      var d = await CommonAPI.getSuperMyUserList({});
      if (d.data != null && d.data?.data != null) {
        loanData = d.data!.data!;
      }
    }
    loanData.map((e) {
      setSelectItem(e);
    }).toList();
    refreshController.refreshCompleted();
    update();
  }

  // 下拉刷新
  void onSexChange() async {
    update();
  }

  // 上拉加载
  void onLoading() async {
    curPage++;
    int p = 0;
    String roleKey = StorageService.to.getString("roleKey");
    if (roleKey == "super") {
      var d = await CommonAPI.getSuperAllUserList({"pageNum":curPage});
      if (d.data != null && d.data?.data != null) {
        loanData.addAll(d.data!.data!);
        p = d.data!.total;
        d.data!.data!.map((e) {
          setSelectItem(e);
        }).toList();
        if (p > 0) {
           double currentPage = p / 15;
          if (curPage > currentPage.ceil()) {
            refreshController.loadNoData();
            return;
          }
        }
      }
    } else if (roleKey == "director") {
      var d = await CommonAPI.getManageAllUserList({"pageNum":curPage});
      if (d.data != null && d.data?.data != null) {
        loanData.addAll(d.data!.data!);
        d.data!.data!.map((e) {
          setSelectItem(e);
        }).toList();
        p = d.data!.total;
        if (p > 0) {
          double currentPage = p / 15;
          if (curPage > currentPage.ceil()) {
            refreshController.loadNoData();
            return;
          }
        }
      }
    }else if (roleKey == "salesman") {
      var d = await CommonAPI.getSaleManMyUserList({"pageNum":curPage});
      if (d.data != null && d.data?.data != null) {
        loanData.addAll(d.data!.data!);
        d.data!.data!.map((e) {
          setSelectItem(e);
        }).toList();
        p = d.data!.total;
        if (p > 0) {
          double currentPage = p / 15;
          if (curPage > currentPage.ceil()) {
            refreshController.loadNoData();
            return;
          }
        }
      }
    }else if (roleKey == "administration") {
      var d = await CommonAPI.getAdministrativeMyUserList({"pageNum":curPage});
      if (d.data != null && d.data?.data != null) {
        loanData.addAll(d.data!.data!);
        d.data!.data!.map((e) {
          setSelectItem(e);
        }).toList();
        p = d.data!.total;
        if (p > 0) {
          double currentPage = p / 15;
          if (curPage > currentPage.ceil()) {
            refreshController.loadNoData();
            return;
          }
        }
      }
    } else {
      var d = await CommonAPI.getSuperAllUserList({"pageNum":curPage});
      if (d.data != null && d.data?.data != null) {
        loanData.addAll(d.data!.data!);
        d.data!.data!.map((e) {
          setSelectItem(e);
        }).toList();
        p = d.data!.total;
        if (p > 0) {
          double currentPage = p / 15;
          if (curPage > currentPage.ceil()) {
            refreshController.loadNoData();
            return;
          }
        }
      }
    }
    refreshController.loadComplete();
    update();
  }

  getListItemString(List<Data> users) {}
  setSelectItem(SaleManDataData data) {
      if (!items.containsKey(data.loanid.toString())) {
        items[data.loanid.toString()] =false;
      }
  }
  setSelectCheckbox(bool d, int index, int position) {
    if (position == 1) {
      if (items.containsKey(loanData.elementAt(index).loanid.toString())) {
        items[loanData.elementAt(index).loanid.toString()] =
            !items[loanData.elementAt(index).loanid.toString()]!;
      } else {
        items[loanData.elementAt(index).loanid.toString()] = true;
      }
      update();
      bool gg = Get.isRegistered<TotalUserLogic>();
      if (gg) {
        var totalUserLogic = Get.find<TotalUserLogic>();
        totalUserLogic.g.currentState?.setState(() {

        });
      }
      return;
    }
    items[loanData.elementAt(index).loanid.toString()] = d;
    update();
    bool gg = Get.isRegistered<TotalUserLogic>();
    if (gg) {
      var totalUserLogic = Get.find<TotalUserLogic>();
      totalUserLogic.g.currentState?.setState(() {

      });
    }
  }

  bool getSelectCheckbox(int index) {
    bool data = false;
    if (items.containsKey(loanData.elementAt(index).loanid.toString())) {
      data = items[loanData.elementAt(index).loanid.toString()]!;
    }
    return data;
  }

  setDistance(double d) {
    topDistance += d;
    print(topDistance);
  }

  setAllSelect(bool d) {
    allSelect = d;
    update();
  }
  setAllSelectAll(bool d) {
    if (d){
      loanData.map((e) {
        items[e.loanid.toString()] = true;
      }).toList();
    }else{
      loanData.map((e) {
        items[e.loanid.toString()] = false;
      }).toList();
    }

    update();
  }
  int getSelectCount(){
    int i=0;
    items.forEach((key, value) {
     if(value ==true){
       i++;
     }
    });
    return i;
  }
  String getSelectItemString(){
    List<String> ff = <String>[];
    items.forEach((key, value) {
      if(value ==true){
        ff.add(key);
      }
    });
    return ff.join(",");
  }
  openSelect(int data) {
    if (data == 1) {
      channelWindow();
    }
    if (data == 2) {
      originWindow();
    }
    if (data == 3) {
      majorWindow();
    }
  }

  majorWindow() {
    showJustBottomSheet(
      context: Get.context!,
      dragZoneConfiguration: JustBottomSheetDragZoneConfiguration(
        dragZonePosition: DragZonePosition.inside,
        child: Container(
          color: Colors.white,
          //borderRadius: BorderRadius.circular(6.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: 4,
              width: 30,
              color: Theme.of(Get.context!).brightness == Brightness.light
                  ? Colors.grey[300]
                  : Colors.white,
            ),
          ),
        ),
      ),
      configuration: JustBottomSheetPageConfiguration(
          height: ScreenUtil().screenHeight / 1.2,
          builder: (context) {
            return StatefulBuilder(builder: (context1, setBottomSheetState) {
              return MyUserFilterPage(
                selectItems: selectItems,
                onFresh: () {
                  setBottomSheetState(() {
                    selectItems.clear();
                  });
                }
              );
            });
          },
          scrollController: scrollController,
          closeOnScroll: true,
          cornerRadius: 60.w,
          backgroundColor: Colors.white,
          backgroundImageFilter: null),
    );
  }

  channelWindow() {
    showCupertinoModalBottomSheet(
      expand: false,
      bounce: false,
      context: Get.context!,
      duration: const Duration(milliseconds: 200),
      backgroundColor: Colors.white,
      builder: (context) => SelectPage(
        type: 3,
        onResendClick: (data) {
          print(data);
          int j = 0;
          for (int i = 0; i < selectItems.length; i++) {
            if (selectItems[i].type == 11) {
              j = 1;
              selectItems[i].id = data['id'].toString();
              selectItems[i].name = data['name'];
              break;
            }
          }

          if (j == 0) {
            SelectItem s = SelectItem();
            s.type = 11;
            s.name = data['name'];
            s.id = data['id'].toString();
            selectItems.add(s);
          }
          update();
        }, onHide: (data) {

      },
      ),
    );
  }

  originWindow() {
    showCupertinoModalBottomSheet(
      expand: false,
      bounce: false,
      context: Get.context!,
      duration: const Duration(milliseconds: 200),
      backgroundColor: Colors.white,
      builder: (context) => SelectPage(
        type: 1,
        onResendClick: (data) {
          print(data);
          int j = 0;
          for (int i = 0; i < selectItems.length; i++) {
            if (selectItems[i].type == 9) {
              j = 1;
              selectItems[i].id = data['id'].toString();
              selectItems[i].name = data['name'];
              break;
            }
          }

          if (j == 0) {
            SelectItem s = SelectItem();
            s.type = 9;
            s.name = data['name'];
            s.id = data['id'].toString();
            selectItems.add(s);
          }
          update();
        }, onHide: (data) {

      },
      ),
    );
  }


}
