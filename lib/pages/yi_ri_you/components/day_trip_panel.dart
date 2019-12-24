import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/models/yi_ri_you.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/panel_bottom_info.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/panel_left_image.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/panel_title.dart';

class DayTripPanel extends StatelessWidget {
  final DayTripListPanelData _d;

  DayTripPanel(this._d);

  Widget _renderLeftImage(String img) {
    return PanelLeftImage(img);
  }

  Widget _renderDayTripItemRightInfo(DayTripListItem item) {
    return Container(
      height: ScreenUtilHelper.setHeight(220),
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.name ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: 14),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "已售:${item.saleCount} | ${item.commentScore} 分",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black26,
              ),
            ),
          ),
          PanelBottomInfo(item.qunarPrice, item.area)
        ],
      ),
    );
  }

  Widget _renderDayTripListItem(DayTripListItem item) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffedebe8), width: 0.5))),
      child: Row(
        children: <Widget>[
          _renderLeftImage(item.img),
          Expanded(
            flex: 1,
            child: _renderDayTripItemRightInfo(item),
          ),
        ],
      ),
    );
  }

  Widget _renderPanelTitle(String title) {
    return PanelTitle(title);
  }

  Widget _renderInfoPanel() {
    if (_d.items.isEmpty) {
      return Container();
    }
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _renderPanelTitle(_d.title),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _d.items.length,
              itemBuilder: (context, index) {
                return _renderDayTripListItem(_d.items[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderInfoPanel();
  }
}
