import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_travel/pages/air_ticket/air_ticket_page.dart';
import 'package:flutter_travel/pages/sight_detail/sight_detail.dart';
import 'package:flutter_travel/pages/travel_strategy/page.dart';
import 'package:flutter_travel/pages/yi_ri_you/yi_ri_you.dart';
import 'package:flutter_travel/pages/yiriyou_detail/yiriyou_detail.dart';
import 'package:flutter_travel/widgets/webview.dart';

import 'fishStore/fishGlobalStore/state.dart';
import 'fishStore/fishGlobalStore/store.dart';
// ';

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
  // NOTE: 由闲鱼接管
  // "/travel_strategy": Route(
  //   path: RoutePathAlias.travelStrategy,
  //   page: (_) => TravelStrategyPage(),
  //   title: '旅游攻略',
  // ),
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

/// NOTE: 闲鱼的 fish-redux 采用了新的一套风格的设计, 如下是采用闲鱼的 fish-redux 创建的 routes
/// NOTE: material 中的 Action 会和 fish_redux 中的 Action 出现冲突, import 的时候需要 hide
createRouteByFishRedux() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      /// NOTE: 旅游攻略页面由 fish_redux 接管
      RoutePathAlias.travelStrategy: TravelStrategyPage(),
      //TODO: 注册其他的页面
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
      /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
      if (page.isTypeof<FishGlobalBaseState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<FishGlobalState>(FishGlobalStore.store,
            (Object pagestate, FishGlobalState appState) {
          final FishGlobalBaseState p = pagestate as FishGlobalBaseState;
          if (p.themeColor != appState.themeColor) {
            if (pagestate is Cloneable) {
              final Object copy = pagestate.clone();
              final FishGlobalBaseState newState = copy as FishGlobalBaseState;
              newState.themeColor = appState.themeColor;
              return newState;
            }
          }
          return pagestate;
        });
      }

      /// AOP
      /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
      /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
      page.enhancer.append(

          /// View AOP
          // viewMiddleware: <ViewMiddleware<dynamic>>[
          //   safetyView<dynamic>(),
          // ],

          /// Adapter AOP
          // adapterMiddleware: <AdapterMiddleware<dynamic>>[
          //   safetyAdapter<dynamic>()
          // ],

          /// Effect AOP
          // effectMiddleware: <EffectMiddleware<dynamic>>[
          //   _pageAnalyticsMiddleware<dynamic>(),
          // ],

          /// Store AOP
          // middleware: <Middleware<dynamic>>[
          //   logMiddleware<dynamic>(tag: page.runtimeType.toString()),
          // ],
          );
    },
  );
  return routes;
}
