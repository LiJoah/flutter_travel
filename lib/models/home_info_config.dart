import 'package:flutter/foundation.dart' show required;

class HomeInfoModel {
  ///热门活动
  List<BannerModel> banners;

  /// 广告弹窗
  FloatBanner float;

  /// 6宫格菜单
  HomeTopMenuPanelInfo topMenuPanelInfo;

  /// 最顶部的菜单
  NavMenuModel navMenu;

  /// 工具区
  List<ToolMenuItem> toolMenuList;

  /// 低价专区
  List<SpecialItemModel> specialPanelList;

  HomeInfoModel(this.banners, this.float, this.topMenuPanelInfo, this.navMenu,
      this.toolMenuList, this.specialPanelList);

  factory HomeInfoModel.fromMap(Map<String, dynamic> json) {
    json = json["wx"] as Map<String, dynamic>;
    var _banners = (json["bannerNew"]["recList"] ?? json["banner"]["recList"])
        as List<dynamic>;
    var banners = _genBanners(_banners);
    var _float = json["toast"]["default"] as Map<String, dynamic>;
    var float = FloatBanner.fromMap(_float);
    var topMenuPanelInfo =
        HomeTopMenuPanelInfo.fromMap(json["indexMain"] as Map<String, dynamic>);
    var navMenu =
        NavMenuModel.fromMap(json["indexTop"] as Map<String, dynamic>);
    var toolMenuList = _genToolMenuList(json["tools"] as List<dynamic>);
    var specialList = _genSpecialPanelList(json["special"] as List<dynamic>);
    return HomeInfoModel(
        banners, float, topMenuPanelInfo, navMenu, toolMenuList, specialList);
  }

  static List<SpecialItemModel> _genSpecialPanelList(List<dynamic> list) {
    return list.map((item) {
      return SpecialItemModel.fromMap(item);
    }).toList();
  }

  static List<BannerModel> _genBanners(List<dynamic> list) {
    return list.map((item) {
      return BannerModel.fromMap(item);
    }).toList();
  }

  static List<ToolMenuItem> _genToolMenuList(List<dynamic> list) {
    return list.map((item) {
      if (item["newIcon"] != null) {
        return ToolMenuItem.fromMap(item.cast());
      }
      return null;
    }).toList();
  }
}

class ToolMenuItem {
  String appId;
  String icon;
  String naType;
  String newIcon;
  String title;
  String type;
  String url;
  ToolMenuItem(this.appId, this.icon, this.naType, this.newIcon, this.title,
      this.type, this.url);

  factory ToolMenuItem.fromMap(json) {
    String appId = json["appId"] as String ?? "";
    String icon = json["icon"] as String ?? "";
    String naType = json["naType"] as String ?? "";
    String newIcon = json["newIcon"] as String ?? "";
    String title = json["title"] as String ?? "";
    String type = json["type"] as String ?? "";
    String url = json["url"] as String ?? "";
    return ToolMenuItem(appId, icon, naType, newIcon, title, type, url);
  }
}

class NavMenuModel {
  HomeMenuItemModel car;
  HomeMenuItemModel childe;
  HomeMenuItemModel ship;
  HomeMenuItemModel travel;
  HomeMenuItemModel tujia;
  HomeMenuItemModel yiriyou;

  NavMenuModel(
      this.car, this.childe, this.ship, this.travel, this.tujia, this.yiriyou);

  factory NavMenuModel.fromMap(Map<String, dynamic> json) {
    var car = HomeMenuItemModel.fromMap(json["car"]);
    var tujia = HomeMenuItemModel.fromMap(json["tujia"]);
    var childe = HomeMenuItemModel.fromMap(json["childe"]);
    var ship = HomeMenuItemModel.fromMap(json["ship"]);
    var travel = HomeMenuItemModel.fromMap(json["travel"]);
    var yiriyou = HomeMenuItemModel.fromMap(json["yiriyou"]);
    return NavMenuModel(car, childe, ship, travel, tujia, yiriyou);
  }

  List<HomeMenuItemModel> getPropsList() {
    return [travel, tujia, yiriyou, childe, car, ship];
  }
}

/// indexMain
class HomeTopMenuPanelInfo {
  HomeMenuItemModel bus;
  HomeMenuItemModel flight;
  HomeMenuItemModel hotel;
  HomeMenuItemModel ticket;
  HomeMenuItemModel train;
  HomeMenuItemModel vacation;

  HomeTopMenuPanelInfo(this.bus, this.flight, this.hotel, this.ticket,
      this.train, this.vacation);

  factory HomeTopMenuPanelInfo.fromMap(Map<String, dynamic> json) {
    var bus = HomeMenuItemModel.fromMap(json["bus"]);
    var ticket = HomeMenuItemModel.fromMap(json["ticket"]);
    var flight = HomeMenuItemModel.fromMap(json["flight"]);
    var hotel = HomeMenuItemModel.fromMap(json["hotel"]);
    var train = HomeMenuItemModel.fromMap(json["train"]);
    var vacation = HomeMenuItemModel.fromMap(json["vacation"]);
    return HomeTopMenuPanelInfo(bus, flight, hotel, ticket, train, vacation);
  }

  List<HomeMenuItemModel> getPropsList() {
    return [hotel, flight, train, vacation, ticket, bus];
  }
}

/// 汽车票
class HomeMenuItemModel {
  int bizIndex;
  String bizTitle;
  String bizType;
  String logoSrc;
  String url;
  HomeMenuItemModel(
      this.bizIndex, this.bizTitle, this.bizType, this.logoSrc, this.url);

  factory HomeMenuItemModel.fromMap(dynamic json) {
    return HomeMenuItemModel(
      json["bizIndex"] as int ?? 0,
      json["bizTitle"] as String ?? "",
      json["bizType"] as String ?? "",
      json["logoSrc"] as String ?? "",
      json["url"] as String ?? "",
    );
  }
}

class FloatBanner {
  String toastImg;
  String mark;
  String url;
  FloatBanner(this.toastImg, this.mark, this.url);

  factory FloatBanner.fromMap(Map<String, dynamic> json) {
    return FloatBanner(
      json["toastImg"] as String ?? "",
      json["mark"] as String ?? "",
      json["url"] as String ?? "",
    );
  }
}

class BannerModel {
  String endTime;
  int id;
  String imgUrl;
  String name;
  String newImg;
  int position;
  String toUrl;
  BannerModel(
      {@required this.endTime,
      @required this.id,
      @required this.imgUrl,
      @required this.name,
      @required this.newImg,
      @required this.position,
      @required this.toUrl});
  factory BannerModel.fromMap(json) {
    return BannerModel(
      endTime: json["endTime"] as String ?? "",
      id: json["id"] as int ?? 0,
      imgUrl: json["imgUrl"] as String ?? "",
      name: json["name"] as String ?? "",
      newImg: json["newImg"] as String ?? "",
      toUrl: json["toUrl"] as String ?? "",
      position: json["position"] as int,
    );
  }
}

/// 低价专区
class SpecialItemModel {
  String imageUrl;
  String title;
  String type;
  String url;

  SpecialItemModel({this.title, this.imageUrl, this.type, this.url});

  factory SpecialItemModel.fromMap(json) {
    return SpecialItemModel(
      title: json["title"] as String ?? "",
      imageUrl: json["imageUrl"] as String ?? "",
      type: json["type"] as String ?? "",
      url: json["url"] as String ?? "",
    );
  }
}
