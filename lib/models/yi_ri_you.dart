class AroundAndHotSightModel {
  final AroundAndHotSightPanelData hotSight;
  final DayTripListPanelData dayTripList;
  final AroundAndHotSightPanelData aroundSight;
  final bool isShowAround;
  final YiRiYouBanner banner;

  AroundAndHotSightModel(this.hotSight, this.dayTripList, this.aroundSight,
      this.isShowAround, this.banner);


  factory AroundAndHotSightModel.fromMap(data) {
    DayTripListPanelData dayTripList =
        DayTripListPanelData.fromMap(data["dayTripList"]);

    AroundAndHotSightPanelData hotSight =
        AroundAndHotSightPanelData.fromMap(data["hotSight"]);

    AroundAndHotSightPanelData aroundSight =
        AroundAndHotSightPanelData.fromMap(data["aroundSight"]);

    bool isShowAround = data["isShowAround"] as bool;

    YiRiYouBanner banner = YiRiYouBanner.fromMap(data["banner"]);

    return AroundAndHotSightModel(
        hotSight, dayTripList, aroundSight, isShowAround, banner);
  }
}

class YiRiYouBanner {
  final String image;
  final String url;
  YiRiYouBanner(this.image, this.url);
  factory YiRiYouBanner.fromMap(json) {
    String image = json["image"] as String;
    String url = json["url"] as String;
    return YiRiYouBanner(image, url);
  }
}

class DayTripListPanelData {
  final String title;
  final List<DayTripListItem> items;
  DayTripListPanelData(this.title, this.items);

  factory DayTripListPanelData.fromMap(json) {
    String title = json["title"] as String;
    List _items = json["items"] as List;
    List<DayTripListItem> items = _genList(_items);
    return DayTripListPanelData(title, items);
  }

  static List<DayTripListItem> _genList(List items) {
    return items.map((item) {
      return DayTripListItem.fromMap(item);
    }).toList();
  }
}

class AroundAndHotSightPanelData {
  final String title;
  final List<AroundAndHotSightListItem> items;
  AroundAndHotSightPanelData(this.title, this.items);

  factory AroundAndHotSightPanelData.fromMap(json) {
    String title = json["title"] as String;
    List _items = json["items"] as List;
    List<AroundAndHotSightListItem> items = _genList(_items);
    return AroundAndHotSightPanelData(title, items);
  }

  static List<AroundAndHotSightListItem> _genList(List items) {
    return items.map((item) {
      return AroundAndHotSightListItem.fromMap(item);
    }).toList();
  }
}

class AroundAndHotSightListItem {
  final String id;
  final String name;
  final String desc;
  final String img;
  final int commentCount;
  final double commentScore;
  final String qunarPrice;
  final double starWidth;
  final bool canCashBack;
  final List activityTagList;
  final double distance;

  AroundAndHotSightListItem(
      this.id,
      this.name,
      this.desc,
      this.img,
      this.commentCount,
      this.commentScore,
      this.qunarPrice,
      this.starWidth,
      this.distance,
      this.canCashBack,
      this.activityTagList);

  factory AroundAndHotSightListItem.fromMap(json) {
    String img = json["img"] as String;
    String id = json["id"] as String;
    String name = json["name"] as String;
    String desc = json["desc"] as String;
    int commentCount = json["commentCount"] as int;
    double commentScore = json["commentScore"] as double;
    double distance = json["distance"] as double;
    double starWidth = json["starWidth"] as double;
    String qunarPrice = json["qunarPrice"] as String;
    bool canCashBack = json["canCashBack"] as bool;
    List activityTagList = json["activityTagList"] as List;
    return AroundAndHotSightListItem(
      id,
      name,
      desc,
      img,
      commentCount,
      commentScore,
      qunarPrice,
      starWidth,
      distance,
      canCashBack,
      activityTagList,
    );
  }
}

class DayTripListItem {
  final String id;
  final String name;
  final String img;
  final int commentCount;
  final double commentScore;
  final String productType;
  final String qunarPrice;
  final String area;
  final String saleCount;
  final bool canCashBack;
  final List activityTagList;

  DayTripListItem(
      this.id,
      this.name,
      this.img,
      this.commentCount,
      this.commentScore,
      this.productType,
      this.qunarPrice,
      this.area,
      this.saleCount,
      this.canCashBack,
      this.activityTagList);

  factory DayTripListItem.fromMap(json) {
    String img = json["img"] as String;
    String id = json["id"] as String;
    String name = json["name"] as String;
    int commentCount = json["commentCount"] as int;
    double commentScore = json["commentScore"] as double;
    String productType = json["productType"] as String;
    String qunarPrice = json["qunarPrice"] as String;
    String area = json["area"] as String;
    String saleCount = json["saleCount"].toString();
    bool canCashBack = json["canCashBack"] as bool;
    List activityTagList = json["activityTagList"] as List;
    return DayTripListItem(id, name, img, commentCount, commentScore,
        productType, qunarPrice, area, saleCount, canCashBack, activityTagList);
  }
}

