import 'package:flutter/material.dart';
import 'package:flutter_travel/base/http_proxy.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/pages/index/index.dart';
import 'package:flutter_travel/pages/splash/splash.dart';
import 'package:flutter_travel/router.dart';
import 'package:flutter_travel/store/global/global.dart';
import 'package:flutter_travel/store/index/index.dart';
import 'package:provider/provider.dart';

void main() {
  initDio();
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
            theme: ThemeData(
              primaryColor: primaryColor,
            ),
            home: const SplashPage(),
            // 注册路由
            routes: {"/index": (_) => IndexPage()}..addEntries(
                routers.map((item) => MapEntry(item.path, item.page))),
          );
        }));
  }
}
