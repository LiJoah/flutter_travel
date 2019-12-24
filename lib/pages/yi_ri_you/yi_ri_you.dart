import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/base/api.dart';
import 'package:flutter_travel/base/event_emitter.dart';
import 'package:flutter_travel/base/http_proxy.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/components/error.dart';
import 'package:flutter_travel/components/list_skeleton.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/models/yi_ri_you.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/around_and_hot_sight.panel.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/day_trip_panel.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/header_panel.dart';
import 'package:flutter_travel/router.dart';
import 'package:flutter_travel/system/geolocator_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

class YiRiYouPage extends StatefulWidget {
  const YiRiYouPage();

  @override
  _YiRiYouPageState createState() {
    return _YiRiYouPageState();
  }
}

class _YiRiYouPageState extends State<YiRiYouPage> with RouteHelper {
  AroundAndHotSightModel data;
  bool error = false;
  final EventEmitter _eventEmitter = EventEmitter();

  @override
  void initState() {
    super.initState();
    _initAroundAndHotSightData();
    _initEvents();
  }

  void _initEvents() {
    _eventEmitter.on("submit", (data) {
      Fluttertoast.showToast(msg: data["value"].toString());
    });
  }

  Future<LatLng> _getLocation() async {
    Location location = await geo.getLocation();
    return location.latLng;
  }

  _initAroundAndHotSightData() async {
    LatLng r = await _getLocation();
    HttpBaseResult result =
        await Api.getAroundAndHotSightData(lat: r.latitude, lng: r.longitude);
    if (result.ret) {
      setState(() {
        data = AroundAndHotSightModel.fromMap(result.data);
      });
    } else {
      Fluttertoast.showToast(msg: "网络卡顿了");
      error = true;
    }
  }

  Widget _renderBanner(YiRiYouBanner banner) {
    return CachedNetworkImage(
      width: ScreenUtilHelper.setScreenWidth(),
      imageUrl: banner.image ?? "",
      fit: BoxFit.fill,
    );
  }

  Widget _renderHeader() {
    return HeaderPanel(_eventEmitter);
  }

  Widget _renderMainContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          _renderHeader(),
          _renderBanner(data.banner),
          DayTripPanel(data.dayTripList),
          AroundAndHotSightPanel(data.aroundSight),
          AroundAndHotSightPanel(data.hotSight),
        ],
      ),
    );
  }

  Widget _renderInitSkeleton() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          _renderHeader(),
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              color: Colors.grey,
              height: ScreenUtilHelper.setHeight(192),
            ),
          ),
          NormalListSkeleton(
            count: 5,
          ),
        ],
      ),
    );
  }

  Widget _render() {
    if (data == null && !error) {
      return _renderInitSkeleton();
    } else if (error) {
      return OurErrorWidget();
    }
    return _renderMainContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: sectionColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "一日游",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: GestureDetector(
        // NOTE: 轻触屏幕失去焦点
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _eventEmitter.emit("blur", null);
        },
        child: Center(
            child: Container(
          height: ScreenUtilHelper.setHeight(ScreenUtil.screenHeight),
          child: _render(),
        )),
      ),
    );
  }
}
