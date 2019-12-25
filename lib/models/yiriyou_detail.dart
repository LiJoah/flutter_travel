class YiRiYouDetailModel {
  final SpuInfo spuInfo;
  YiRiYouDetailModel(this.spuInfo);

  factory YiRiYouDetailModel.fromMap(data) {
    final SpuInfo spuInfo = SpuInfo.fromMap(data["spuInfo"]);
    return YiRiYouDetailModel(spuInfo);
  }
}

class SpuInfo {
  final String productName;
  final String bannerImgUrl;
  final String shareImgUrl;
  final String formCity;
  final String teamType;
  final String type;
  final String aleadySellCount;
  final String supplierId;
  final String supplierName;
  final List<String> imgUrls;
  final int ticketTypeId;
  final int qunarPrice;
  final String productType;

  SpuInfo(
    this.aleadySellCount,
    this.bannerImgUrl,
    this.formCity,
    this.imgUrls,
    this.productName,
    this.productType,
    this.qunarPrice,
    this.shareImgUrl,
    this.supplierId,
    this.supplierName,
    this.teamType,
    this.ticketTypeId,
    this.type,
  );

  factory SpuInfo.fromMap(json) {
    final String productName = json["productName"] as String;
    final String bannerImgUrl = json["bannerImgUrl"] as String;
    final String shareImgUrl = json["shareImgUrl"] as String;
    final String formCity = json["formCity"] as String;
    final String teamType = json["teamType"] as String;
    final String type = json["type"] as String;
    final String aleadySellCount = json["aleadySellCount"] as String;
    final String supplierId = json["supplierId"] as String;
    final String supplierName = json["supplierName"] as String;
    final List<String> imgUrls = json["imgUrls"] as List<String>;
    final int ticketTypeId = json["ticketTypeId"] as int;
    final int qunarPrice = json["qunarPrice"] as int;
    final String productType = json["productType"] as String;
    return SpuInfo(
        aleadySellCount,
        bannerImgUrl,
        formCity,
        imgUrls,
        productName,
        productType,
        qunarPrice,
        shareImgUrl,
        supplierId,
        supplierName,
        teamType,
        ticketTypeId,
        type);
  }
}

class TagData {
  final String label;
  final String type;
  final String icon;

  TagData(this.type, this.icon, this.label);

  factory TagData.fromMap(json) {
    final String label = json["label"] as String;
    final String type = json["type"] as String;
    final String icon = json["icon"] as String;
    return TagData(type, icon, label);
  }
}

class CommentInfoData {
  final String score;
  final String total;

  CommentInfoData(this.score, this.total);

  factory CommentInfoData.fromMap(json) {
    final String total = json["total"] as String;
    final String score = json["score"] as String;
    return CommentInfoData(score, total);
  }
}

class FeatureData {
  final String desc;
  final String url;
  final String recommendReason;
  final bool definite;
  final bool noSellExpense;
  final bool noShopping;

  FeatureData(
    this.definite,
    this.desc,
    this.url,
    this.recommendReason,
    this.noSellExpense,
    this.noShopping,
  );

  factory FeatureData.fromMap(json) {
    final String desc = json["desc"] as String;
    final String url = json["url"] as String;
    final String recommendReason = json["recommendReason"] as String;
    final bool definite = json["definite"] as bool;
    final bool noSellExpense = json["noSellExpense"] as bool;
    final bool noShopping = json["noShopping"] as bool;
    return FeatureData(
      definite,
      desc,
      url,
      recommendReason,
      noSellExpense,
      noShopping,
    );
  }
}

class RouteListDataModel {
  final List<RouteItem> route;
  final String routeType;

  RouteListDataModel(this.route, this.routeType);

  factory RouteListDataModel.fromJson(Map<String, dynamic> json) {
    List<RouteItem> route = _genList(json['route'] as List);
    String routeType = json['routeType'] as String;
    return RouteListDataModel(route, routeType);
  }

  static List<RouteItem> _genList(List items) {
    return items.map((item) {
      return RouteItem.fromMap(item);
    }).toList();
  }
}

class RouteItem {
  final String startTime;
  final List<OneDayRouteDTOList> oneDayRouteDTOList;

  RouteItem(this.startTime, this.oneDayRouteDTOList);

  factory RouteItem.fromMap(json) {
    String startTime = json['startTime'] as String;
    List<OneDayRouteDTOList> oneDayRouteDTOList =
        _genList(json['oneDayRouteDTOList'] as List);
    return RouteItem(startTime, oneDayRouteDTOList);
  }

  static List<OneDayRouteDTOList> _genList(List items) {
    return items.map((item) {
      return OneDayRouteDTOList.fromMap(item);
    }).toList();
  }
}

class OneDayRouteDTOList {
  final List<DestinationItem> destinationList;

  OneDayRouteDTOList(this.destinationList);

  factory OneDayRouteDTOList.fromMap(json) {
    List<DestinationItem> destinationList =
        _genList(json['destinationList'] as List);
    return OneDayRouteDTOList(destinationList);
  }

  static List<DestinationItem> _genList(List items) {
    return items.map((item) {
      return DestinationItem.fromMap(item);
    }).toList();
  }
}

class DestinationItem {
  String time;
  String name;
  String desc;
  String type;
  String iconUrl;
  DestinationItem(this.time, this.name, this.desc, this.type, this.iconUrl);

  factory DestinationItem.fromMap(json) {
    String time = json['time'] as String;
    String name = json['name'] as String;
    String desc = json['desc'] as String;
    String type = json['type'] as String;
    String iconUrl = json['iconUrl'] as String;
    return DestinationItem(time, name, desc, type, iconUrl);
  }
}

class BookingInfoItem {
  final String typeName;
  final String content;
  final int displayType;
  final int typeId;
  final int type;
  BookingInfoItem(
      this.typeName, this.content, this.displayType, this.typeId, this.type);
  factory BookingInfoItem.fromMap(json) {
    String typeName = json['typeName'] as String;
    String content = json['content'] as String;
    int displayType = json['displayType'] as int;
    int typeId = json['typeId'] as int;
    int type = json['type'] as int;
    return BookingInfoItem(typeName, content, displayType, typeId, type);
  }
}

class CommentListItem {
  final String author;
  final String content;
  final String date;
  final int score;
  final String productId;
  final String ticketName;
  final String supplierName;
  final String supplierId;
  final String commentId;
  final List<ImageItem> imgs;
  final List<TagListItem> tagList;
  final int ticketType;
  final String qunarPrice;
  final String priceId;
  final String sightName;
  final String teamType;
  final String headImg;
  final String commentQuality;
  CommentListItem(
    this.author,
    this.content,
    this.date,
    this.score,
    this.productId,
    this.ticketName,
    this.supplierName,
    this.supplierId,
    this.commentId,
    this.imgs,
    this.tagList,
    this.ticketType,
    this.qunarPrice,
    this.priceId,
    this.sightName,
    this.teamType,
    this.headImg,
    this.commentQuality,
  );
  factory CommentListItem.fromMap(json) {
    String author = json['author'] as String;
    String content = json['content'] as String;
    String date = json['date'] as String;
    int score = json['score'] as int;
    String productId = json['productId'] as String;
    String ticketName = json['ticketName'] as String;
    String supplierName = json['supplierName'] as String;
    String supplierId = json['supplierId'] as String;
    String commentId = json['commentId'] as String;
    List<ImageItem> imgs = _genImageList(json['imgs'] as List);
    List<TagListItem> tagList = _genTagList(json['tagList'] as List);
    int ticketType = json['ticketType'] as int;
    String qunarPrice = json['qunarPrice'] as String;
    String priceId = json['priceId'] as String;
    String sightName = json['sightName'] as String;
    String teamType = json['teamType'] as String;
    String headImg = json['headImg'] as String;
    String commentQuality = json['commentQuality'] as String;
    return CommentListItem(
        author,
        content,
        date,
        score,
        productId,
        ticketName,
        supplierName,
        supplierId,
        commentId,
        imgs,
        tagList,
        ticketType,
        qunarPrice,
        priceId,
        sightName,
        teamType,
        headImg,
        commentQuality);
  }

  static List<ImageItem> _genImageList(List items) {
    return items.map((item) {
      return ImageItem.fromMap(item);
    }).toList();
  }

  static List<TagListItem> _genTagList(List items) {
    return items.map((item) {
      return TagListItem.fromMap(item);
    }).toList();
  }
}

class ImageItem {
  final String small;
  final String title;
  final String big;
  ImageItem(this.small, this.title, this.big);
  factory ImageItem.fromMap(json) {
    String small = json['small'] as String;
    String title = json['title'] as String;
    String big = json['big'] as String;
    return ImageItem(small, title, big);
  }
}

class TagListItem {
  final int tagType;
  final int tagScore;
  final int tagNum;
  final String tagName;
  TagListItem(this.tagType, this.tagScore, this.tagNum, this.tagName);

  factory TagListItem.fromMap(json) {
    int tagType = json['tagType'] as int;
    int tagScore = json['tagScore'] as int;
    int tagNum = json['tagNum'] as int;
    String tagName = json['tagName'] as String;
    return TagListItem(tagType, tagScore, tagNum, tagName);
  }
}

class StructureInfoDataModel {
  final bool useFeeInfoStructure;
  final FeeInfoSchedule feeInfoSchedule;
  final bool useUseInfoStructure;
  final List<CommonItem> useInfoSchedule;
  final RiskTipsInfo riskTipsInfo;

  StructureInfoDataModel(this.useFeeInfoStructure, this.feeInfoSchedule,
      this.useUseInfoStructure, this.useInfoSchedule, this.riskTipsInfo);

  factory StructureInfoDataModel.fromMap(json) {
    bool useFeeInfoStructure = json['useFeeInfoStructure'] as bool;
    FeeInfoSchedule feeInfoSchedule = json['feeInfoSchedule'] != null
        ? FeeInfoSchedule.fromMap(json['feeInfoSchedule'])
        : null;
    bool useUseInfoStructure = json['useUseInfoStructure'] as bool;
    List<CommonItem> useInfoSchedule =
        _genList(json['useInfoSchedule'] as List);

    RiskTipsInfo riskTipsInfo = json['riskTipsInfo'] != null
        ? RiskTipsInfo.fromMap(json['riskTipsInfo'])
        : null;
    return StructureInfoDataModel(
      useFeeInfoStructure,
      feeInfoSchedule,
      useUseInfoStructure,
      useInfoSchedule,
      riskTipsInfo,
    );
  }
  static List<CommonItem> _genList(List items) {
    return items.map((item) {
      return CommonItem.fromMap(item);
    }).toList();
  }
}

class FeeInfoSchedule {
  final List<CommonItem> feeInclude;
  final List<CommonItem> feeExclude;
  final String refundInfo;

  FeeInfoSchedule(this.feeInclude, this.feeExclude, this.refundInfo);

  factory FeeInfoSchedule.fromMap(json) {
    List<CommonItem> feeInclude =
        _genFeeIncludeList(json['feeInclude'] as List);
    List<CommonItem> feeExclude =
        _genFeeIncludeList(json['feeExclude'] as List);
    String refundInfo = json['refundInfo'] as String;
    return FeeInfoSchedule(feeInclude, feeExclude, refundInfo);
  }

  static List<CommonItem> _genFeeIncludeList(List items) {
    return items.map((item) {
      return CommonItem.fromMap(item);
    }).toList();
  }
}

class CommonItem {
  final String title;
  final String desc;
  CommonItem(this.title, this.desc);
  factory CommonItem.fromMap(json) {
    String title = json['title'] as String;
    String desc = json['desc'] as String;
    return CommonItem(title, desc);
  }
}

class RiskTipsInfo {
  final String title;
  final String desc;

  final List<StrongDescDetails> strongDescDetails;

  RiskTipsInfo(this.title, this.desc, this.strongDescDetails);

  factory RiskTipsInfo.fromMap(json) {
    String title = json['title'] as String;
    String desc = json['desc'] as String;
    List _items = json["strongDescDetails"] as List;
    List<StrongDescDetails> strongDescDetails = _genList(_items);
    return RiskTipsInfo(title, desc, strongDescDetails);
  }

  static List<StrongDescDetails> _genList(List items) {
    return items.map((item) {
      return StrongDescDetails.fromMap(item);
    }).toList();
  }
}

class StrongDescDetails {
  final String strongDesc;
  final String url;

  StrongDescDetails(this.strongDesc, this.url);

  factory StrongDescDetails.fromMap(json) {
    String strongDesc = json['strongDesc'] as String;
    String url = json['url'] as String;
    return StrongDescDetails(strongDesc, url);
  }
}

class CategoryDataModel {
  final String ticketName;
  final String lowerPrice;
  final List<CategoryListItem> categoryList;
  final ValidCombine validCombine;

  CategoryDataModel(
      this.ticketName, this.lowerPrice, this.categoryList, this.validCombine);

  factory CategoryDataModel.fromJson(json) {
    String ticketName = json['ticketName'] as String;
    String lowerPrice = json['lowerPrice'] as String;
    List<CategoryListItem> categoryList =
        _genList(json['categoryList'] as List);
    ValidCombine validCombine = json['validCombine'] != null
        ? ValidCombine.fromMap(json['validCombine'])
        : null;
    return CategoryDataModel(
        ticketName, lowerPrice, categoryList, validCombine);
  }

  static List<CategoryListItem> _genList(List items) {
    return items.map((item) {
      return CategoryListItem.fromMap(item);
    }).toList();
  }
}

class CategoryListItem {
  final String type;
  final String showType;
  final String title;
  final List<CategoryItemDetail> values;
  CategoryListItem(this.type, this.showType, this.title, this.values);

  factory CategoryListItem.fromMap(json) {
    String type = json['type'] as String;
    String showType = json['showType'] as String;
    String title = json['title'] as String;
    List<CategoryItemDetail> values = _genList(json['values'] as List);
    return CategoryListItem(type, showType, title, values);
  }
  static List<CategoryItemDetail> _genList(List items) {
    return items.map((item) {
      return CategoryItemDetail.fromMap(item);
    }).toList();
  }
}

class CategoryItemDetail {
  final String displayName;
  final String key;
  final ValueProperties valueProperties;
  final String date;
  final int minBuyCount;
  final int maxBuyCount;
  final bool valid;
  CategoryItemDetail(this.displayName, this.key, this.valueProperties,
      this.date, this.minBuyCount, this.maxBuyCount, this.valid);
  factory CategoryItemDetail.fromMap(json) {
    String displayName = json['displayName'] as String;
    String key = json['key'] as String;
    ValueProperties valueProperties = json['valueProperties'] != null
        ? ValueProperties.fromMap(json['valueProperties'])
        : null;
    String date = json['date'] as String;
    int minBuyCount = json['minBuyCount'] as int;
    int maxBuyCount = json['maxBuyCount'] as int;
    bool valid = json['valid'] as bool;
    return CategoryItemDetail(
      displayName,
      key,
      valueProperties,
      date,
      minBuyCount,
      maxBuyCount,
      valid,
    );
  }
}

class ValueProperties {
  final String displayDate;

  ValueProperties(this.displayDate);

  factory ValueProperties.fromMap(json) {
    String displayDate = json['displayDate'] as String;
    return ValueProperties(displayDate);
  }
}

class ValidCombine {
  final List<String> validCombineList;
  final List<String> columnDefinition;

  ValidCombine(this.validCombineList, this.columnDefinition);

  factory ValidCombine.fromMap(json) {
    final List<String> validCombineList =
        json['validCombineList'] as List<String>;
    final List<String> columnDefinition =
        json['columnDefinition'] as List<String>;
    return ValidCombine(validCombineList, columnDefinition);
  }
}
