import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/yi_ri_you/yi_ri_you.dart';

class Route {
  Route({@required this.path, @required this.page, this.title});

  final Widget page;
  final String path;
  final String title;
}

final Map<String, Route> routers = {
  "/yiriyou": Route(
    path: RoutePathAlias.yiriyou,
    page: YiRiYouPage(),
    title: '一日游',
  )
};

class RoutePathAlias {
  static final String index = "/index";
  static final String yiriyou = "/yiriyou";
}

/// NOTE: 抽象出来的 routeHelper 主要是为了在路由的中间层做一个处理, 并统一管理路由,
/// 这里是支持了 RouteHelper 对 StatefulWidget 直接 mixin;
/// 对 StatelessWidget 采用直接调用的方式
/// 仅支持对 state 的 widget 进行扩展
/// 命名路由: 当调用 Navigator.pushNamed 等命名路由的方法来进行路由的跳转的时候,
/// 如果指定的路由名在路由中已经注册, 那么就会调用路由表中的 builder 函数来生成一个路由组件,
/// 如果路由表中没有注册, 才会调用 onGenerateRoute 来生成路由
mixin RouteHelper {
  routePush<T>(BuildContext context, String path, {T query}) {
    Navigator.pushNamed(context, path, arguments: query);
  }

  routeReplace<T>(BuildContext context, String path, {T query}) {
    Navigator.pushReplacementNamed(context, path, arguments: query);
  }
}
