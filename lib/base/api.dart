import 'package:flutter_travel/configs/scret_config.dart';

import 'http_proxy.dart';

const servicePath = {};

/// api map
class Api {
  static Future<HttpBaseResult> get(
      String path, Map<String, Object> urlArgs) async {
    var p = HttpProxy.get(path, urlArgs);
    var res = await p.send();
    return res;
  }

  static HttpBaseResult<D> convertModel<D>(HttpBaseResult result) {
    HttpBaseResult<D> res = HttpBaseResult();
    res.code = result.code;
    res.message = result.message;
    res.ret = result.ret;
    return res;
  }

  static Future<HttpBaseResult> post(String path, Map<String, Object> urlArgs,
      Map<String, Object> bodyArgs) async {
    var p = HttpProxy.post(path, urlArgs, bodyArgs);
    var res = await p.send();
    return res;
  }

  static Future<HttpBaseResult> checkBind() async {
    HttpBaseResult httpResult = await Api.post(
        '/oauth-client/wechatSmall/checkBind',
        {},
        {"token": token, "platform": weChatPlatform});
    return httpResult;
  }

  /// 获取首页的所有的配置信息
  static Future<HttpBaseResult> getHomeInfo() async {
    /// 拿到放回的结果之后, 需要进行 Model 的转换;
    HttpBaseResult result = await Api.get("/mpx/getQconfig", {
      "name": "qunar_miniprogram_config4.json",
    });
    return result;
  }

  /// 获取行程列表
  static Future<HttpBaseResult> getJoureyList(
      {int count = 20, int lastSortTime = 0}) async {
    /// 拿到放回的结果之后, 需要进行 Model 的转换;
    HttpBaseResult result = await Api.post("/trip/wechat/list.do", {},
        {"num": count, "lastSortTime": lastSortTime});
    return result;
  }

  /// 获取一日游初始化数据
  static Future<HttpBaseResult> getAroundAndHotSightData(
      {double lat, double lng}) async {
    /// 拿到放回的结果之后, 需要进行 Model 的转换;
    HttpBaseResult result = await Api.post(
        "/ticket/pw/getAroundAndHotSight.json",
        {"apiVerson": "1.1"},
        {"lat": lat, "lng": lng});
    return result;
  }
}
