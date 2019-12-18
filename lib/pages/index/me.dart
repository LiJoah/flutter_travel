import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/widgets/normal_list_item.dart';
import 'package:fluttertoast/fluttertoast.dart';

const _menuMap = [
  {"leftLable": "全部订单", "rightLable": "查看全部订单", "path": ""},
  {"leftLable": "优惠券", "rightLable": "", "path": ""},
  {"leftLable": "常用旅客", "rightLable": "", "path": ""},
  {"leftLable": "联系客服", "rightLable": "", "path": ""},
  {"leftLable": "我要反馈", "rightLable": "", "path": ""},
];

class MePage extends StatelessWidget {
  const MePage();

  Widget _renderUserInfo(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300).toDouble(),
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "assets/images/avatar.jpeg",
                  height: ScreenUtil().setHeight(120).toDouble(),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "iogp9838",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    "assets/images/bell.png",
                    height: ScreenUtil().setHeight(36).toDouble(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      "实名认证保障您的账户及资金安全",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff333333),
                      ),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Fluttertoast.cancel();
                  Fluttertoast.showToast(
                      msg: "实名认证页面暂未开发", gravity: ToastGravity.TOP);
                  // Navigator.pushNamed(context, "/auth/verify");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "去实名",
                      style: TextStyle(color: Color(0xff34f4d9), fontSize: 16),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _renderList(BuildContext context) {
    return _menuMap.map((item) {
      return _renderItem(context, item);
    }).toList();
  }

  Widget _renderItem(BuildContext context, Map<String, String> item) {
    return NormalListItem(
      rightLeble: item["rightLable"],
      leftLeble: item["leftLable"],
      onTap: () {
        _handleTap(context, item["path"]);
      },
    );
  }

  _handleTap(BuildContext context, String path) {
    Fluttertoast.cancel().then((_) {
      Fluttertoast.showToast(msg: "$path 暂未开发", gravity: ToastGravity.TOP);
    });

    // Navigator.pushNamed(context, path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffafafa),
      // decoration: BoxDecoration(color: Color(0xfffafafa)),
      height: ScreenUtil().setHeight(ScreenUtil.screenHeight).toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _renderUserInfo(context),
          Column(
            children: _renderList(context),
          ),
        ],
      ),
    );
  }
}
