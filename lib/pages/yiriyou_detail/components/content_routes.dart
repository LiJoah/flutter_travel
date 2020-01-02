import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/models/yiriyou_detail.dart';

class ContentRoutes extends StatelessWidget {
  final RouteListDataModel _d;
  ContentRoutes(this._d);

  Widget _renderItem(DestinationItem item, bool isEnd) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text(
                item.time,
                style:
                    TextStyle(fontSize: 13, color: sectionColor, height: 1.4),
              ),
            ),
            Container(
              width: ScreenUtilHelper.setWidth(80),
              child: Image.network(
                item.iconUrl ?? "",
                height: ScreenUtilHelper.setHeight(22),
                fit: BoxFit.contain,
              ),
            ),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: 0,
              child: Text(
                item.time,
                style:
                    TextStyle(fontSize: 13, color: sectionColor, height: 1.4),
              ),
            ),
            Container(
              width: ScreenUtilHelper.setWidth(40),
              color: Colors.grey,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 3,
                  bottom: 3,
                  left: ScreenUtilHelper.setWidth(isEnd ? 41 : 40),
                ),
                decoration: isEnd
                    ? null
                    : BoxDecoration(
                        border: Border(
                          left: BorderSide(color: Colors.black12),
                        ),
                      ),
                child: Text(
                  item.desc,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.5,
                    color: Colors.black38,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  List<Widget> _renderList() {
    try {
      List<DestinationItem> list =
          _d.route[0].oneDayRouteDTOList[0].destinationList;
      int index = 0;
      return list.map((item) {
        index++;
        if (index == list.length) {
          return _renderItem(item, true);
        }
        return _renderItem(item, false);
      }).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtilHelper.setWidth(750),
      padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 8),
      child: ListView(
        shrinkWrap: true,
        // disabled scroll
        physics: NeverScrollableScrollPhysics(),
        children: _renderList(),
      ),
    );
  }
}
