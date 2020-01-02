import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/models/yiriyou_detail.dart';

class ContentSpecialPanel extends StatelessWidget {
  final FeatureData d;
  ContentSpecialPanel(this.d);

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
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _renderLabelList(),
      ),
    );
  }

  List<Widget> _renderLabelList() {
    List<Widget> list = [];
    if (d.definite) {
      list.add(_renderLabelItem("assets/images/definite.png", "铁定成团"));
    }
    if (d.noSelfExpense) {
      list.add(_renderLabelItem("assets/images/no_self_expense.png", "无自费"));
    }
    if (d.noShopping) {
      list.add(_renderLabelItem("assets/images/no_shopping.png", "无购物"));
    }
    return list;
  }

  Widget _renderLabelItem(String iconSrc, String text) {
    return Stack(
      alignment: Alignment.bottomLeft,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 1),
          width: ScreenUtilHelper.setWidth(130),
          height: ScreenUtilHelper.setHeight(52),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.black45),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: -2,
          bottom: -2,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(1),
            child: Image.asset(
              iconSrc,
              fit: BoxFit.cover,
              width: ScreenUtilHelper.setWidth(22),
              height: ScreenUtilHelper.setHeight(22),
            ),
          ),
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
            Padding(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Text(
                d.recommendReason,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.8,
                  // letterSpacing: 4,
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
