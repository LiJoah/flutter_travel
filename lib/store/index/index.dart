import 'package:flutter_travel/base/api.dart';
import 'package:flutter_travel/base/global_data.dart';
import 'package:flutter_travel/base/logger_format.dart';
import 'package:flutter_travel/models/home_info_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

part 'index.g.dart';

class IndexStore = _IndexStore with _$IndexStore;

abstract class _IndexStore with Store {
  @observable
  HomeInfoModel homeInfo;

  @observable
  int value = 0;

  @observable
  int currentTabIndex = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void setCurrentTabIndex(int index) {
    currentTabIndex = index;
  }

  @action
  initHomeInfo(HomeInfoModel info) {
    homeInfo = info;
  }

  @action
  Future reloadHomeInfo() async {
    Fluttertoast.cancel();
    logger.info("reload home info");
    try {
      var info = await Api.getHomeInfo();
      if (info.ret) {
        GlobalData.setHomeInfo(info.data);
        homeInfo = HomeInfoModel.fromMap(info.data as Map<String, dynamic>);
      } else {
        Fluttertoast.showToast(msg: "首页信息获取失败");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "首页信息获取失败");
    }
  }
}