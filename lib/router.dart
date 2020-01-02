import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/air_ticket/air_ticket_page.dart';
import 'package:flutter_travel/pages/sight_detail/sight_detail.dart';
import 'package:flutter_travel/pages/travel_strategy/travel_strategy_page.dart';
import 'package:flutter_travel/pages/yi_ri_you/yi_ri_you.dart';
import 'package:flutter_travel/pages/yiriyou_detail/yiriyou_detail.dart';
import 'package:flutter_travel/widgets/webview.dart';

class Route {
  Route({@required this.path, @required this.page, this.title});

  final WidgetBuilder page;
  final String path;
  final String title;
}

final Map<String, Route> routers = {
  "/yiriyou": Route(
    path: RoutePathAlias.yiriyou,
    page: (_) => YiRiYouPage(),
    title: '一日游',
  ),
  "/sight_detail": Route(
    path: RoutePathAlias.sightDetail,
    page: (_) => SightDetailPage(),
    title: '景点详情',
  ),
  "/yiriyou_detail": Route(
    path: RoutePathAlias.yiriyouDetail,
    page: (_) => YiRiYouDetailPage(),
    title: '景点详情',
  ),
  "/travel_strategy": Route(
    path: RoutePathAlias.travelStrategy,
    page: (_) => TravelStrategyPage(),
    title: '旅游攻略',
  ),
  "/air_ticket": Route(
    path: RoutePathAlias.airTicketPage,
    page: (_) => AirTicketPage(),
    title: '机票',
  ),
  "/webview": Route(
    path: RoutePathAlias.webview,
    page: (_) => WebViewPage(),
    title: '去哪儿呀',
  )
};

class RoutePathAlias {
  /// NOTE: 首页
  static final String index = "/index";

  /// NOTE: 一日游
  static final String yiriyou = "/yiriyou";

  /// NOTE: 景点详情
  static final String sightDetail = "/sight_detail";

  /// NOTE: 一日游详情
  static final String yiriyouDetail = "/yiriyou_detail";

  /// NOTE: 旅游攻略
  static final String travelStrategy = "/travel_strategy";

  /// NOTE: 机票
  static final String airTicketPage = "/air_ticket";

  static final String webview = "/webview";
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

  Object getRouteArgs(BuildContext context) {
    return ModalRoute.of(context).settings.arguments;
  }
}

/// NOTE: 如果是 StatelessWidget 那么需要使用下面一个类来操作路由
class RouteHelperCls with RouteHelper {}
