import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/base/global_data.dart';
import 'package:flutter_travel/models/home_info_config.dart';
import 'package:flutter_travel/pages/index/components/low_price_panel.dart';
import 'package:flutter_travel/pages/index/components/nav_menu.dart';
import 'package:flutter_travel/pages/index/components/tool_menu.dart';
import 'package:flutter_travel/pages/index/components/top_menu_panel.dart';
import 'package:flutter_travel/store/global/global.dart';
import 'package:flutter_travel/store/index/index.dart';
import 'package:provider/provider.dart';

import 'components/activity_banner.dart';

/// 首页
class HomePage extends StatelessWidget {
  final GlobalStore globalStore = GlobalStore();

  @override
  Widget build(BuildContext context) {
    final IndexStore indexStore = Provider.of<IndexStore>(context);
    return Container(
      height: ScreenUtil().setHeight(ScreenUtil.screenHeight).toDouble(),
      child: Observer(
        builder: (_) {
          HomeInfoModel info = indexStore.homeInfo ?? GlobalData.homeInfo;
          return EasyRefresh(
              header: MaterialHeader(),
              onRefresh: indexStore.reloadHomeInfo,

              /// listView 需要一个可计算的高,
              child:
                  ListView(scrollDirection: Axis.vertical, children: <Widget>[
                // NOTE: 这里需要做空的处理, 如果为就不显示
                NavMenu(info.navMenu),
                TopMenuPanelWidget(info.topMenuPanelInfo),
                ToolMenuWidget(info.toolMenuList),
                LowPricePanel(info.specialPanelList),
                ActivityBanner(info.banners),
              ]));
        },
      ),
    );
  }
}

/* */