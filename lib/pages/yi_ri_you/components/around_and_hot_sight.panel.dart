import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:flutter_travel/components/panel_title.dart';
import 'package:flutter_travel/models/yi_ri_you.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/panel_bottom_info.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/panel_left_image.dart';
import 'package:flutter_travel/pages/yi_ri_you/components/star_score.dart';
import 'package:flutter_travel/router.dart';

/// 附近和热销景点
class AroundAndHotSightPanel extends StatelessWidget {
  final AroundAndHotSightPanelData _d;
  final RouteHelperCls _routeHelper = RouteHelperCls();

  AroundAndHotSightPanel(AroundAndHotSightPanelData this._d);

  Widget _renderPanelTitle(String title) {
    return PanelTitle(title);
  }

  Widget _renderLeftImage(String img) {
    return PanelLeftImage(img);
  }

  Widget _renderDayTripItemRightInfo(AroundAndHotSightListItem item) {
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
          Text(
            item.desc ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontSize: 12),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  StarScore(item.starWidth),
                  Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      "${item.commentCount}条评论" ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              )),
          PanelBottomInfo(item.qunarPrice, "${item.distance}km")
        ],
      ),
    );
  }

  Widget _renderDayTripListItem(
      BuildContext context, AroundAndHotSightListItem item) {
    return InkWell(
      onTap: () {
        _routeHelper.routePush(context, RoutePathAlias.sightDetail,
            query: {"sightId": item.id});
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xffedebe8), width: 0.5))),
        child: Row(
          children: <Widget>[
            _renderLeftImage(item.img),
            Expanded(
              flex: 1,
              child: _renderDayTripItemRightInfo(item),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderList(BuildContext context) {
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
                return _renderDayTripListItem(context, _d.items[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderList(context);
  }
}
