import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 底部的价格和位置,距离部分
class PanelBottomInfo extends StatelessWidget {
  final String _qunarPrice;
  final String _text;

  PanelBottomInfo(this._qunarPrice, this._text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text.rich(TextSpan(children: [
          TextSpan(
              text: "￥$_qunarPrice ",
              style: TextStyle(fontSize: 16, color: Color(0xfff7b022))),
          TextSpan(
              text: "起", style: TextStyle(fontSize: 12, color: Colors.black26))
        ])),
        Text(
          _text ?? "",
          style: TextStyle(fontSize: 12, color: Colors.black26),
        ),
      ],
    );
  }
}
