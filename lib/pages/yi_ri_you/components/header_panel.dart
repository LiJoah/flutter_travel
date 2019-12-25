import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/base/event_emitter.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/components/input_text_field.dart';
import 'package:flutter_travel/configs/app_config.dart';

class HeaderPanel extends StatelessWidget {
  final EventEmitter _eventEmitter;

  HeaderPanel(this._eventEmitter);

  Widget _renderInput() {
    return Expanded(
      flex: 1,
      child: InputTextField("输入城市或景点", _eventEmitter),
    );
  }

  Widget _renderCloseIcon() {
    return InkWell(
        onTap: () {
          _eventEmitter.emit("clearValue", null);
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
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        children: <Widget>[_renderInput(), _renderCloseIcon()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
}
