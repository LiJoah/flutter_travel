import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/models/home_info_config.dart';
import 'package:flutter_travel/router.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TopMenuPanelWidget extends StatefulWidget {
  final HomeTopMenuPanelInfo data;

  TopMenuPanelWidget(this.data);

  @override
  _TopMenuPanelState createState() {
    return _TopMenuPanelState();
  }
}

class _TopMenuPanelState extends State<TopMenuPanelWidget> with RouteHelper {
  HomeTopMenuPanelInfo _data;
  @override
  void initState() {
    _data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Wrap(
          runSpacing: 10,
          spacing: 5,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: _renderWrap(),
        ),
      ),
    );
  }

  _handTap(String type, text) {
    Fluttertoast.cancel();
    switch (type) {
      case "flight":
        routePush(context, RoutePathAlias.airTicketPage);
        break;
      default:
        Fluttertoast.showToast(
            msg: "$type: $text: 暂未开发", gravity: ToastGravity.CENTER);
    }
  }

  Widget _renderWrapItem(HomeMenuItemModel item) {
    return GestureDetector(
      onTap: () {
        _handTap(item?.bizType, item?.bizTitle);
      },
      child: Container(
        width: ScreenUtil().setWidth(226).toDouble(),
        height: ScreenUtil().setHeight(176).toDouble(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: item.logoSrc ?? "",
              ),
            ),
            Positioned(
              top: 5,
              child: Text(
                item.bizTitle,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _renderWrap() {
    if (_data == null) {
      return [];
    }
    return _data.getPropsList().map((item) {
      return _renderWrapItem((item));
    }).toList();
  }
}
