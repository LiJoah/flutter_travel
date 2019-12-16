import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/models/home_info_config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToolMenuWidget extends StatelessWidget {
  final List<ToolMenuItem> _data;
  ToolMenuWidget(List<ToolMenuItem> _data) : _data = _data ?? [] {
    _data = _data;
  }

  _handTap(String type, text) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: "$type: $text: 暂未开发", gravity: ToastGravity.CENTER);
  }

  Widget _renderRowItem(ToolMenuItem item) {
    String title = item?.title ?? "";
    String type = item?.naType ?? "";
    String src = item?.newIcon ?? item?.icon ?? "";
    return GestureDetector(
      onTap: () {
        _handTap(type, title);
      },
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
              imageUrl: src,
              fit: BoxFit.cover,
              width: ScreenUtil().setWidth(64).toDouble()),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  List<Widget> _renderRow() {
    return _data.where((item) {
      return item != null;
    }).map((item) {
      return _renderRowItem((item));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _renderRow(),
        ));
  }
}
