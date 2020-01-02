import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/logger_format.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final RouteHelperCls _routeHelper = RouteHelperCls();
  WebViewPage();

  Widget _renderWebView(String url) {
    return Container(
      height: ScreenUtilHelper.setHeight(700),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }

  Widget _render(BuildContext context) {
    var args = _routeHelper.getRouteArgs(context) as Map;
    String title = args["title"].toString();
    String url = args["url"].toString();
    logger.debug("[get url $url]");
    if (title == null) {
      return Scaffold(
        body: _renderWebView(url),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _renderWebView(url),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _render(context);
  }
}
