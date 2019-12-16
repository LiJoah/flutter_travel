import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/models/home_info_config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LowPricePanel extends StatelessWidget {
  final List<SpecialItemModel> _data;
  LowPricePanel(List<SpecialItemModel> _data) : _data = _data ?? [] {
    _data = _data;
  }

  _handTap(String type, text) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: "$type: $text: 暂未开发", gravity: ToastGravity.CENTER);
  }

  Widget _renderRowItem(SpecialItemModel item) {
    String src = item?.imageUrl ?? "";
    String text = item?.title ?? "";
    String type = item?.type ?? "";
    return GestureDetector(
      onTap: () {
        _handTap(type, text);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 10.0), //阴影xy轴偏移量
                  blurRadius: 15.0, //阴影模糊程度
                  spreadRadius: 0.2 //阴影扩散程度
                  )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: CachedNetworkImage(
                imageUrl: src,
                fit: BoxFit.cover,
                width: ScreenUtil().setWidth(220).toDouble(),
                height: ScreenUtil().setHeight(120).toDouble(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "# ",
                    style: TextStyle(fontSize: 12, color: Color(0xff23f6e1)),
                  ),
                  TextSpan(
                    text: text,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _renderRow() {
    return _data.map((item) {
      return _renderRowItem((item));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "低价专区",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _renderRow(),
            )
          ],
        ));
  }
}
