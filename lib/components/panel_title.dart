import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/configs/app_config.dart';

class PanelTitle extends StatelessWidget {
  final String _title;
  final bool noFontWeight;
  PanelTitle(this._title, {this.noFontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Color(0xffedebe8), width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: ScreenUtilHelper.setWidth(4),
            height: ScreenUtilHelper.setHeight(30),
            decoration: BoxDecoration(
                color: sectionColor, borderRadius: BorderRadius.circular(2)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              _title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: noFontWeight == null ? FontWeight.w500 : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
