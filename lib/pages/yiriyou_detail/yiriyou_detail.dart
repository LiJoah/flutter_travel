import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/router.dart';
import 'package:flutter_travel/widgets/normal_app_bar.dart';

class YiRiYouDetailPage extends StatefulWidget {
  @override
  _YiRiYouDetailPageState createState() {
    return _YiRiYouDetailPageState();
  }
}

class _YiRiYouDetailPageState extends State<YiRiYouDetailPage>
    with RouteHelper {
  String spuId;

  @override
  void initState() {
    super.initState();
    Map args = getRouteArgs(context) as Map;
    spuId = args["spuId"].toString();
    print("get spuId $spuId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: NormalAppBar(
        title: "一日游详情",
        bgColor: sectionColor,
        fontColor: Colors.white,
      ),
      body: Center(
        child: Container(
          height: ScreenUtilHelper.setScreenHeight(),
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
