import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/api.dart';
import 'package:flutter_travel/base/http_proxy.dart';
import 'package:flutter_travel/base/logger_format.dart';
import 'package:flutter_travel/base/storage.dart';
import 'package:flutter_travel/base/utils.dart';
import 'package:flutter_travel/components/detail_skeleton.dart';
import 'package:flutter_travel/components/error.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/configs/normal_config.dart';
import 'package:flutter_travel/models/yiriyou_detail.dart';
import 'package:flutter_travel/pages/yiriyou_detail/components/content_price_explain.dart';
import 'package:flutter_travel/pages/yiriyou_detail/components/content_routes.dart';
import 'package:flutter_travel/pages/yiriyou_detail/components/content_special_panel.dart';
import 'package:flutter_travel/pages/yiriyou_detail/components/content_use_explain.dart';
import 'package:flutter_travel/pages/yiriyou_detail/components/content_user_comment.dart';
import 'package:flutter_travel/pages/yiriyou_detail/components/content_wrap.dart';
import 'package:flutter_travel/pages/yiriyou_detail/components/header.dart';
import 'package:flutter_travel/router.dart';
import 'package:flutter_travel/widgets/normal_app_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class YiRiYouDetailPage extends StatefulWidget {
  @override
  _YiRiYouDetailPageState createState() {
    return _YiRiYouDetailPageState();
  }
}

class _YiRiYouDetailPageState extends State<YiRiYouDetailPage>
    with RouteHelper {
  String spuId;

  YiRiYouDetailModel detailData;

  bool isError = false;

  bool noData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map args = getRouteArgs(context) as Map;
    spuId = args["spuId"].toString();
    logger.debug("get spuId $spuId");
    // storage.delete(StorageKeyAlias.yiriyouDetail);
    _setupData().then((_data) async {
      if (_data == null) {
        await _getDetailData();
      } else {
        _setDetailData(_data);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _setupData() async {
    var _d = storage.getItem(StorageKeyAlias.getYiriyouDetailKey(spuId)) as String;
    if (_d != null && _d.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(_d) as Map<String, dynamic>;
      int expireAt = int.parse(map["expireAt"] as String);
      int now = Utils.currentTimeMillis();
      // 数据过期
      if (now > expireAt) {
        return null;
      } else {
        return map["data"];
      }
    }
    return null;
  }

  _setDetailData(d) {
    var data = YiRiYouDetailModel.fromMap(d);
    if (mounted) {
      setState(() {
        detailData = data;
      });
    }
  }

  Future _getDetailData() async {
    if (spuId == null) {
      return null;
    }
    HttpBaseResult res = await Api.getYiRiYouDetail(spuId);
    isError = res.ret;
    if (res.ret) {
      int expireAt =
          Utils.currentTimeMillis() + yiriyouDetailDataExpireAtInterval;
      storage.setItem(StorageKeyAlias.getYiriyouDetailKey(spuId),
          {"data": res.data, "expireAt": expireAt.toString()});
      return _setDetailData(res.data);
    }
    Fluttertoast.showToast(msg: "网络错误");
  }

  Widget _renderBoby() {
    if (detailData == null || spuId == null) {
      return DetailSkeleton();
    }
    if (isError && detailData == null) {
      return OurErrorWidget();
    }
    return _renderMain();
  }

  Widget _renderHeader() {
    SpuInfo info = detailData.spuInfo;
    List<TagData> tagList = detailData.tagList;
    return HeaderPanel(info, tagList);
  }

  Widget _renderMain() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_renderHeader(), _renderContent()],
    );
  }

  Widget _renderContent() {
    return Column(
      children: <Widget>[
        ContentSpecialPanel(detailData.feature),
        ContentWrap(ContentRoutes(detailData.routes), "行程介绍"),
        ContentWrap(ContentPriceExplain(detailData.structureInfo), "费用及退款说明"),
        ContentWrap(ContentUseExplain(detailData.structureInfo), "使用说明"),
        ContentWrap(ContentUserComment(detailData.commentList), "用户评论"),
      ],
    );
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: _renderBoby(),
        ),
      ),
    );
  }
}
