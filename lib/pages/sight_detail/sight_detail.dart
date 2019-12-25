import 'package:flutter/widgets.dart';
import 'package:flutter_travel/router.dart';

class SightDetailPage extends StatelessWidget {
  final RouteHelperCls _routeHelper = RouteHelperCls();
  SightDetailPage();

  @override
  Widget build(BuildContext context) {
    String _sightId = _routeHelper.getRouteArgs(context).toString();
    print(_sightId);
    return Container();
  }
}
