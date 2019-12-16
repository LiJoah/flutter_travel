import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/base/global_data.dart';
import 'package:flutter_travel/base/storage.dart';
import 'package:flutter_travel/store/index/index.dart';

/// 实例化 IndexStore
final IndexStore indexStore = IndexStore();

class SplashPage extends StatefulWidget {
  const SplashPage();

  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  final String title = "去哪儿玩呀";

  final IndexStore indexStore = IndexStore();

  // final Duration time = Duration(seconds: 1);

  final String imageUrl = "assets/images/splash.jpg";

  // Timer _timer;

  // int start = 0;

  @override
  void initState() {
    /// 这里做一些初始化的工作
    storage.loaded.then((_) {
      GlobalData.fetchHomeInfo().then((_) {
        indexStore.initHomeInfo(GlobalData.homeInfo);
        Navigator.pushReplacementNamed(context, "/index");
      });
    });
    super.initState();
    // _timer = Timer.periodic(time, (_) {
    //   if (start >= 3) {
    //     _timer?.cancel();
    //     _timer = null;

    //   }
    //   start += 1;
    // });
  }

  @override
  void dispose() {
    // _timer?.cancel();
    // _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
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
