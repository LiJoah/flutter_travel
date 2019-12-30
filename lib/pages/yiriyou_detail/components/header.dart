import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/models/yiriyou_detail.dart';

class HeaderPanel extends StatelessWidget {
  final SpuInfo info;
  HeaderPanel(this.info);

  Widget _renderText(String text, {double left, double right}) {
    return Positioned(
      bottom: 10,
      left: left,
      right: right,
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }

  Widget _renderContent() {
    return SizedBox(
      width: ScreenUtilHelper.setWidth(750),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              info.productName,
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: "￥",
                      style: TextStyle(fontSize: 10, color: colorOrigin)),
                  TextSpan(
                      text: "${info.qunarPrice}",
                      style: TextStyle(fontSize: 18, color: colorOrigin)),
                  TextSpan(
                      text: "起",
                      style: TextStyle(fontSize: 12, color: Colors.black26))
                ]),
              ),
              Text(
                info.supplierName,
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _renderLable("assets/images/clock.png", "可订明日"),
              _renderLable("assets/images/clock.png", "条件退"),
              _renderLable("assets/images/clock.png", "汽车往返"),
            ],
          )
        ],
      ),
    );
  }

  Widget _renderLable(String iconSrc, String text) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(top: 10, right: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            iconSrc,
            alignment: Alignment.bottomLeft,
            height: ScreenUtilHelper.setHeight(22),
            width: ScreenUtilHelper.setWidth(22),
            fit: BoxFit.contain,
          ),
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Image.network(
              info.imgUrls[0].toString(),
              fit: BoxFit.fill,
              width: ScreenUtilHelper.setWidth(750),
            ),
            _renderText("出发地: ${info.fromCity}", left: 10),
            _renderText("已售: ${info.alreadySellCount}", right: 10),
          ],
        ),
        Align(
          // 必须定义 Factor
          // (Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
          widthFactor: 1.01,
          heightFactor: 1.01,
          alignment: FractionalOffset(0, -4),
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // border: Border.all(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  color: Colors.white),
              child: _renderContent()),
        )
      ],
    );
  }
}
