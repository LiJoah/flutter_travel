import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/base/api.dart';
import 'package:flutter_travel/base/event_emitter.dart';
import 'package:flutter_travel/base/http_proxy.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/components/empty.dart';
import 'package:flutter_travel/components/error.dart';
import 'package:flutter_travel/components/input_text_field.dart';
import 'package:flutter_travel/components/list_skeleton.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/models/yi_ri_you.dart';
import 'package:flutter_travel/router.dart';
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
  final EventEmitter _eventEmiter = EventEmitter();

  @override
  void initState() {
    super.initState();
    _initAroundAndHotSightData();
    _initEvents();
  }

  void _initEvents() {
    _eventEmiter.on("submit", (data) {});
  }

  _initAroundAndHotSightData() async {
    HttpBaseResult result = await Api.getAroundAndHotSightData();
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

  Widget _renderLeftImage(String img) {
    return CachedNetworkImage(
      height: ScreenUtilHelper.setHeight(220),
      width: ScreenUtilHelper.setWidth(220),
      imageUrl: img ?? "",
      fit: BoxFit.cover,
    );
  }

  Widget _renderDayTripItemRightInfo(TravelListItem item) {
    return Container(
      height: ScreenUtilHelper.setHeight(220),
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.name ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: 14),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "已售:${item.saleCount} | ${item.commentScore} 分",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black26,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "￥${item.qunarPrice} ",
                    style: TextStyle(fontSize: 16, color: Color(0xfff7b022))),
                TextSpan(
                    text: "起",
                    style: TextStyle(fontSize: 12, color: Colors.black26))
              ])),
              Text(
                item.area ?? "",
                style: TextStyle(fontSize: 12, color: Colors.black26),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _renderDayTripListItem(TravelListItem item) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffedebe8), width: 0.5))),
      child: Row(
        children: <Widget>[
          _renderLeftImage(item.img),
          Expanded(
            flex: 1,
            child: _renderDayTripItemRightInfo(item),
          ),
        ],
      ),
    );
  }

  Widget _renderPanelTitle(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffedebe8), width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: ScreenUtilHelper.setWidth(4),
            height: ScreenUtilHelper.setHeight(30),
            color: sectionColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderInfoPanel(TravelRecommentData d) {
    // debugDumpRenderTree();
    if (d.items.isEmpty) {
      return Column(
        children: <Widget>[_renderPanelTitle(d.title), EmptyWidget()],
      );
    }
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _renderPanelTitle(d.title),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: d.items.length,
              itemBuilder: (context, index) {
                return _renderDayTripListItem(d.items[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _renderInput() {
    return Expanded(
      flex: 1,
      child: InputTextField("输入城市或景点", _eventEmiter),
    );
  }

  Widget _renderCloseIcon() {
    return InkWell(
        onTap: () {
          _eventEmiter.emit("clear", null);
          Fluttertoast.showToast(msg: "close");
        },
        child: Container(
          height: ScreenUtilHelper.setHeight(60),
          width: ScreenUtilHelper.setHeight(60),
          decoration: BoxDecoration(
              color: Color(0xffedebe8),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Icon(
            Icons.close,
            size: 26,
            color: Colors.white,
          ),
        ));
  }

  Widget _renderSearchBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(left: 10, right: 8),
      height: ScreenUtilHelper.setHeight(80),
      width: ScreenUtilHelper.setWidth(680),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        children: <Widget>[_renderInput(), _renderCloseIcon()],
      ),
    );
  }

  Widget _renderHeader() {
    // NOTE: Container 在计算宽和高时,
    // 除了要考虑 width 和 height 属性外, 还要遵循父组件设置的尺寸约束
    // 这里使用 Column 进行包裹
    return Container(
        height: ScreenUtilHelper.setHeight(160),
        width: ScreenUtilHelper.setWidth(ScreenUtil.screenWidth),
        color: sectionColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[_renderSearchBar()],
        ));
  }

  Widget _renderMainContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          _renderHeader(),
          _renderBanner(data.banner),
          _renderInfoPanel(data.dayTripList),
          // _renderInfoPanel(data.dayTripList),
          // _renderInfoPanel(data.aroundSight),
        ],
      ),
    );
  }

  Widget _renderInitStatus() {
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
      return _renderInitStatus();
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
          _eventEmiter.emit("blur", null);
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
