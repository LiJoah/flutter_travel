import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_travel/pages/travel_strategy/effect.dart';
import 'package:flutter_travel/pages/travel_strategy/reducer.dart';
import 'package:flutter_travel/pages/travel_strategy/state.dart';
import 'package:flutter_travel/pages/travel_strategy/view.dart';

///NOTE: 旅游攻略页面会使用闲鱼的 fish-redux 来实现
class TravelStrategyPage extends Page<PageState, Map<String, dynamic>> {
  TravelStrategyPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          // dependencies: Dependencies<PageState>(
          //     adapter: NoneConn<PageState>() + ToDoListAdapter(),
          //     slots: <String, Dependent<PageState>>{
          //       'report': ReportConnector() + ReportComponent()
          //     }),

          /// 页面私有AOP, 如果需要
          // middleware: <Middleware<PageState>>[
          //   logMiddleware(tag: 'ToDoListPage'),
          // ],
        );
}
