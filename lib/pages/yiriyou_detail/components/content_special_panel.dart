import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/configs/app_config.dart';

class ContentSpecialPanel extends StatelessWidget {
  ContentSpecialPanel();

  Widget _renderTitle() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("一", style: TextStyle(fontSize: 10, color: colorOrigin)),
      Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Text("行程亮点",
            style: TextStyle(
              fontSize: 18,
              color: colorOrigin,
            )),
      ),
      Text("一", style: TextStyle(fontSize: 12, color: colorOrigin))
    ]);
  }

  Widget _renderLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[],
    );
  }

  Widget _renderLabelItem(String iconSrc, String text) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Container(
          width: ScreenUtilHelper.setWidth(120),
          height: ScreenUtilHelper.setHeight(40),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black45,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(20)),
          child:
              Text(text, style: TextStyle(fontSize: 12, color: Colors.black45)),
        ),
        Image.asset(
          iconSrc,
          width: ScreenUtilHelper.setWidth(22),
          height: ScreenUtilHelper.setHeight(22),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          // border: Border.all(),
          color: Colors.white),
      child: SizedBox(
        child: Column(
          children: <Widget>[
            _renderTitle(),
            _renderLabel(),
          ],
        ),
      ),
    );
  }
}
