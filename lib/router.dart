import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/yi_ri_you/yi_ri_you.dart';

class Route {
  Route({@required this.title, @required this.path, @required this.page});

  final WidgetBuilder page;
  final String path;
  final String title;
}

final List<Route> routers = [
  Route(
    title: '一日游',
    path: RoutePath.yiriyou,
    page: (_) => const YiRiYouPage(),
  )
];

class RoutePath {
  static final String index = "/index";
  static final String yiriyou = "/yiriyou";
}

/// 仅支持对 state 的 widget 进行扩展
mixin RouteHelper<T extends StatefulWidget> on State<T> {
  routePushNamed(String path) {
    Navigator.pushNamed(context, path);
  }
}
