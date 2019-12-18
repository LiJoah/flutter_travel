import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalListItem extends StatelessWidget {
  final String leftLeble;
  final String rightLeble;
  final Widget leading;
  final GestureTapCallback onTap;
  final Color backgroundColor;
  NormalListItem(
      {this.leftLeble = "",
      this.rightLeble = "",
      this.leading,
      this.backgroundColor = Colors.white,
      this.onTap});

  Widget _renderIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Color(0xffd3dad9),
    );
  }

  Widget _renderRight() {
    if (rightLeble == "") {
      return _renderIcon();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          rightLeble,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xffaeb2b2),
          ),
        ),
        _renderIcon()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap ?? null,
        child: Container(
          color: Colors.white,
          height: ScreenUtil().setHeight(100).toDouble(),
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                leftLeble,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff333333),
                ),
              ),
              _renderRight()
            ],
          ),
        ));
  }
}
