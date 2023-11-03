import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../common/apis/common.dart';
import '../../common/entities/home/search_erp.dart';
import 'state.dart';

class SearchAppointLogic extends GetxController {
  final SearchAppointState state = SearchAppointState();

  final RefreshController refreshController =
  RefreshController(initialRefresh: false);
  String serveType = "1";
  String totalCount = "";
  String title = "客户管理";
  int curPage = 1;
  int pageSize = 20;
  int total = 20;
  String keyWord = "";
  RxList<Data> homeUser = <Data>[].obs;
  int isAppoint=1;
  @override
  void onInit() {
    super.onInit();
  }
  // 下拉刷新
  void searchUser( String keyWords) async {
    keyWord = keyWords;
    curPage=1;
    var result =
    await CommonAPI.searchCustomer(curPage.toString(), keyWord);
    homeUser.clear();
    homeUser .addAll(result.data.data);
    totalCount = "0";
    update();

  }

  // 上拉加载
  void  onLoading() async {
    curPage++;
    var result =
    await CommonAPI.searchCustomer(curPage.toString(), keyWord);
    homeUser.addAll(result.data.data);
    if (result.data.data.isEmpty){
      refreshController.loadNoData();
    }else{
      update();
      refreshController.loadComplete();
    }

  }

}
