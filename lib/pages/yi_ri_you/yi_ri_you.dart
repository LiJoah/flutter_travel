import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/base/api.dart';
import 'package:flutter_travel/base/http_proxy.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/components/empty.dart';
import 'package:flutter_travel/components/error.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/models/yi_ri_you.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/search_bar.dart';
import 'package:flutter_travel/router.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  @override
  void initState() {
    super.initState();
    _initAroundAndHotSightData();
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
    return SizedBox(
      height: ScreenUtil().setHeight(200).toDouble(),
      child: CachedNetworkImage(
        imageUrl: banner.image ?? "",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _renderListItem(TravelListItem item) {
    return ListTile(
      leading: CachedNetworkImage(
        height: ScreenUtil().setHeight(120).toDouble(),
        imageUrl: item.img ?? "",
        fit: BoxFit.fill,
      ),
      title: Text(
        item.name ?? "",
        style: TextStyle(fontSize: 14),
      ),
      subtitle: Text(
        "已售:${item.saleCount} | ${item.commentStore} 分",
        style: TextStyle(
          color: Colors.black26,
        ),
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "￥${item.qunarPrice}",
                style: TextStyle(fontSize: 16, color: Color(0xfff7b022))),
            TextSpan(text: "起", style: TextStyle(fontSize: 12))
          ])),
          Text(
            item.area ?? "",
            style: TextStyle(fontSize: 12, color: Colors.black12),
          ),
        ],
      ),
    );
  }

  Widget _renderPanelTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: ScreenUtilHelper.setWidth(2),
          height: ScreenUtilHelper.setHeight(30),
          color: sectionColor,
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  Widget _renderInfoPanel(TravelRecommentData d) {
    if (d.items.isEmpty) {
      return Column(
        children: <Widget>[_renderPanelTitle(d.title), EmptyWidget()],
      );
    }
    return Column(
      children: <Widget>[
        _renderPanelTitle(d.title),
        Flexible(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemExtent: 200,
            itemCount: d.items.length,
            itemBuilder: (context, index) {
              return _renderListItem(d.items[index]);
            },
          ),
        )
      ],
    );
  }

  Widget _renderMainContent() {
    return Column(
      children: <Widget>[
        SearchBar("", "输入城市或景点"),
        _renderBanner(data.banner),
        _renderInfoPanel(data.hotSight),
        _renderInfoPanel(data.dayTripList),
        _renderInfoPanel(data.aroundSight),
      ],
    );
  }

  Widget _render() {
    if (data == null && !error) {
      return CircularProgressIndicator();
    } else if (error) {
      return OurErrorWidget();
    }
    return _renderMainContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sectionColor,
        title: Text(
          "一日游",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      body: Center(child: _render()),
    );
  }
}
