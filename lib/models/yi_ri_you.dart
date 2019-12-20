class AroundAndHotSightModel {
  final TravelRecommentData hotSight;
  final TravelRecommentData dayTripList;
  final TravelRecommentData aroundSight;
  final bool isShowAround;
  final YiRiYouBanner banner;

  AroundAndHotSightModel(this.hotSight, this.dayTripList, this.aroundSight,
      this.isShowAround, this.banner);

  factory AroundAndHotSightModel.fromMap(data) {
    TravelRecommentData hotSight =
        TravelRecommentData.fromMap(data["hotSight"]);
    TravelRecommentData dayTripList =
        TravelRecommentData.fromMap(data["dayTripList"]);
    TravelRecommentData aroundSight =
        TravelRecommentData.fromMap(data["aroundSight"]);
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

class TravelRecommentData {
  final String title;
  final List<TravelListItem> items;
  TravelRecommentData(this.title, this.items);

  factory TravelRecommentData.fromMap(json) {
    String title = json["title"] as String;
    List _items = json["items"] as List;
    List<TravelListItem> items = _genList(_items);
    return TravelRecommentData(title, items);
  }

  static List<TravelListItem> _genList(List items) {
    return items.map((item) {
      return TravelListItem.fromMap(item);
    }).toList();
  }
}

class TravelListItem {
  final String id;
  final String name;
  final String desc;
  final String img;
  final int commentCount;
  final double commentScore;
  final String productType;
  final String qunarPrice;
  final String area;
  final String saleCount;
  final bool canCashBack;
  final List activityTagList;

  TravelListItem(
      this.id,
      this.name,
      this.desc,
      this.img,
      this.commentCount,
      this.commentScore,
      this.productType,
      this.qunarPrice,
      this.area,
      this.saleCount,
      this.canCashBack,
      this.activityTagList);

  factory TravelListItem.fromMap(json) {
    String img = json["img"] as String;
    String id = json["id"] as String;
    String name = json["name"] as String;
    String desc = json["desc"] as String;
    int commentCount = json["commentCount"] as int;
    double commentScore = json["commentScore"] as double;
    String productType = json["productType"] as String;
    String qunarPrice = json["qunarPrice"] as String;
    String area = json["area"] as String;
    String saleCount = json["saleCount"].toString();
    bool canCashBack = json["canCashBack"] as bool;
    List activityTagList = json["activityTagList"] as List;
    return TravelListItem(id, name, desc, img, commentCount, commentScore,
        productType, qunarPrice, area, saleCount, canCashBack, activityTagList);
  }
}
