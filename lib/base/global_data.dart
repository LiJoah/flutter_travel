import 'dart:convert';

import 'package:flutter_travel/base/storage.dart';
import 'package:flutter_travel/base/utils.dart';
import 'package:flutter_travel/models/home_info_config.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'api.dart';

// 在 GlobalData 中不能抛出错误, 必须将错误处理掉;
class GlobalData {
  static HomeInfoModel homeInfo;

  GlobalData.init() {}

  /// 获取首页的所有的数据, 这里应该是初始化首页的数据,
  static Future fetchHomeInfo() async {
    Fluttertoast.cancel();
    // 获取缓存 for shared_preferences
    var _homeInfo = _getHomeInfo();
    try {
      if (_homeInfo != null) {
        homeInfo = _homeInfo;
        return;
      }
      var info = await Api.getHomeInfo();
      if (info.ret) {
        // 数据缓存 to shared_preferences
        setHomeInfo(info.data);
        homeInfo = HomeInfoModel.fromMap(info.data as Map<String, dynamic>);
      } else {
        Fluttertoast.showToast(msg: "网络出错");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "当前没有网络");
    }
  }

  static HomeInfoModel _getHomeInfo() {
    var data = storage.getItem("homeInfo") as String;
    if (data != null) {
      Map<String, dynamic> map =
          JsonCodec().decode(data) as Map<String, dynamic>;
      int expireAt = int.parse(map["expireAt"].toString());
      Map<String, dynamic> info = map["data"] as Map<String, dynamic>;
      int now = Utils.currentTimeMillis();

      /// 过期, 需要重新请求数据
      if (expireAt - now < 0) {
        return null;
      }
      homeInfo = HomeInfoModel.fromMap(info);
    }
    return homeInfo;
  }

  static setHomeInfo(dynamic map) {
    int expireAt = 2000 + Utils.currentTimeMillis();
    String json =
        JsonCodec().encode({"data": map, "expireAt": expireAt.toString()});
    storage.setItem("homeInfo", json);
  }
}
