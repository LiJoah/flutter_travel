import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';

class HeaderWidget extends StatelessWidget {
  final String city;
  final String src;
  final String alreadySellCount;
  HeaderWidget(this.city, this.alreadySellCount, this.src);

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
          src,
          fit: BoxFit.fill,
          height: ScreenUtilHelper.setHeight(440),
        ),
        _renderText("出发地: $city", left: 10),
        _renderText("已售: $alreadySellCount", right: 10)
      ],
    );
  }
}
