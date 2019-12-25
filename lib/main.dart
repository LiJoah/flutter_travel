import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_travel/system/geolocator_helper.dart';
import 'package:flutter_travel/base/http_proxy.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/pages/index/index.dart';
import 'package:flutter_travel/pages/splash/splash.dart';
import 'package:flutter_travel/router.dart';
import 'package:flutter_travel/store/global/global.dart';
import 'package:flutter_travel/store/index/index.dart';
import 'package:provider/provider.dart';

main() async {
  initDio();
  if (Platform.isIOS) {
    await geo.initAmapCoreForIos();
  }
  return runApp(MyApp());
}

/// 主 app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<IndexStore>(create: (_) => IndexStore()),
          Provider<GlobalStore>(create: (_) => GlobalStore()),
        ],
        child: Consumer2<GlobalStore, IndexStore>(
            builder: (_, globalStore, indexStore, __) {
          return MaterialApp(
            // initialRoute: '/splash',
            onGenerateRoute: (RouteSettings settings) {
              String routeName = settings.name;
              // 使用命名路由钩子拦截路由, 创建路由动画
              return MaterialPageRoute(builder: (_) {
                // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
                // 引导用户登录；其它情况则正常打开路由。
                return routers[routeName].page;
              });
            },
            theme: ThemeData(
              primaryColor: primaryColor,
              hintColor: Colors.white,
              accentColor: Colors.white
            ),
            home: const SplashPage(),
            // 注册路由
            routes: {"/index": (_) => IndexPage()}..addEntries(routers.values
                .map((item) => MapEntry(item.path, (_) => item.page))),
          );
        }));
  }
}
