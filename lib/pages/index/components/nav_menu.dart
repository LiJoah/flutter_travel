import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/models/home_info_config.dart';
import 'package:flutter_travel/router.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavMenu extends StatefulWidget {
  final NavMenuModel _navMenuData;
  NavMenu(this._navMenuData);

  @override
  _NavMenuState createState() {
    return _NavMenuState();
  }
}

/// 首页的导航菜单
class _NavMenuState extends State<NavMenu> with RouteHelper {
  final ScrollController _controller = ScrollController();
  NavMenuModel _navMenuData;
  double left = 0;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        left = (_controller.offset / 150) * 60;
      });
    });
    _navMenuData = widget._navMenuData;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _renderNavMenu() {
    if (_navMenuData == null) {
      return [];
    }
    return _navMenuData.getPropsList().map((item) {
      return _renderNavItem((item));
    }).toList();
  }

  _handTap(String title, String type) {
    Fluttertoast.cancel();
    switch (type) {
      case "一日游":
        routePush(context, RoutePathAlias.yiriyou);
        break;
      case "travel":
        routePush(context, RoutePathAlias.travelStrategy);
        break;
      default:
        Fluttertoast.showToast(
            msg: "$title: $type: 暂未开发", gravity: ToastGravity.CENTER);
    }
  }

  Widget _renderCircleImage(String src) {
    return ClipOval(
      child: CachedNetworkImage(
        width: ScreenUtil().setWidth(120.0).toDouble(),
        height: ScreenUtil().setHeight(120.0).toDouble(),
        fit: BoxFit.cover,
        imageUrl: src ?? "",
      ),
    );
  }

  Widget _renderNavItem(HomeMenuItemModel item) {
    return GestureDetector(
      onTap: () {
        _handTap(item.bizTitle, item.bizType);
      },
      child: Container(
        width: ScreenUtil().setWidth(150.0).toDouble(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _renderCircleImage(item.logoSrc),
            Text(
              item.bizTitle ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0, color: Color(0xff000000)),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderIndicator() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Center(
        child: Stack(
          // ltr => left to right
          // textDirection: TextDirection.ltr,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(120.0).toDouble(),
              height: ScreenUtil().setHeight(10.0).toDouble(),
              decoration: BoxDecoration(
                  color: Color(0xffd9dee3),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Positioned(
              left: left,
              width: ScreenUtil().setWidth(60.0).toDouble(),
              height: ScreenUtil().setHeight(10.0).toDouble(),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff23f6bb),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          // 滑动到边界时，出现弹性（ios）还是微光
          // physics: ClampingScrollPhysics(),
          controller: _controller,
          child: Container(
            height: ScreenUtil().setHeight(200).toDouble(),
            child: Row(
              children: _renderNavMenu(),
            ),
          ),
        ),
        _renderIndicator()
      ],
    );
  }
}
