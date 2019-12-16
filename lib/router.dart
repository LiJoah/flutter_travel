import 'package:flutter/material.dart';
// import 'package:flutter_travel/pages/splash/splash.dart';
import 'package:flutter_travel/pages/yi_ri_you/yi_ri_you.dart';
// import 'package:provider/provider.dart';

class Route {
  Route(
      {@required this.title,
      @required this.description,
      @required this.path,
      @required this.page});

  final WidgetBuilder page;
  final String path;
  final String title;

  final String description;
}

final List<Route> routers = [
  Route(
    title: '一日游页面',
    description: '我是一日游页面, 我还在实现中...',
    path: '/yiriyou',
    page: (_) => const YiRiYouPage(),
  )
];
