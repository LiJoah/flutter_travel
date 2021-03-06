import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/base/api.dart';
import 'package:flutter_travel/base/global_data.dart';
// import 'package:flutter_travel/base/geolocator_helper.dart';
// import 'package:flutter_travel/base/global_data.dart';
import 'package:flutter_travel/base/http_proxy.dart';
import 'package:flutter_travel/base/storage.dart';
import 'package:flutter_travel/base/utils.dart';
import 'package:flutter_travel/models/account_info.dart';
import 'package:flutter_travel/router.dart';
import 'package:flutter_travel/store/global/global.dart';
import 'package:flutter_travel/store/index/index.dart';

/// 实例化 IndexStore
/// NOTE: 在 splash 中处理 登录, cookie 的校验
final IndexStore indexStore = IndexStore();

class SplashPage extends StatefulWidget {
  const SplashPage();

  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> with RouteHelper {
  final String title = "去哪儿玩呀";

  final IndexStore indexStore = IndexStore();
  final GlobalStore globalStore = GlobalStore();

  String imageUrl;

  @override
  void initState() {
    /// 这里做一些初始化的工作
    storage.loaded.then((_) async {
      GlobalData.fetchHomeInfo().then((_) {
        indexStore.initHomeInfo(GlobalData.homeInfo);
        routeReplace(context, RoutePathAlias.index);
      });
    });
    imageUrl = _genImageUrl();
    super.initState();
  }

  String _genImageUrl() {
    int index = Utils.randomInt(1, 3);
    return "assets/images/splash_$index.gif";
  }

  // NOTE: _getAccountInfo : 暂时没有找到绕过 qunar 的服务器的限制, 一直报内部错误
  Future<AccountInfo> getAccountInfo() async {
    HttpBaseResult res = await Api.checkBind();
    if (res.ret) {
      return AccountInfo.fromMap(res.data);
    }
    return AccountInfo("", "", "", false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            imageUrl,
            fit: BoxFit.fill,
            width: ScreenUtil().setHeight(ScreenUtil.screenWidth).toDouble(),
            height: ScreenUtil().setHeight(ScreenUtil.screenHeight).toDouble(),
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 28,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
