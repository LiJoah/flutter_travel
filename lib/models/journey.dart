class JourneyDataModel {
  final int count;
  final bool loadMore;
  final List<JourneyListItem> timelines;

  JourneyDataModel(this.count, this.loadMore, this.timelines);

  factory JourneyDataModel.fromMap(json) {
    int count = (json["count"] as int) ?? 0;
    bool loadMore = (json["loadMore"] as bool) ?? false;
    List<dynamic> list = (json["timelines"] as List) ?? [];
    List<JourneyListItem> _timelines = [];
    if (list.isNotEmpty) {
      _timelines = _genTimelines(list);
    }

    return JourneyDataModel(count, loadMore, _timelines);
  }

  static List<JourneyListItem> _genTimelines(List<dynamic> list) {
    return list.map((item) {
      return JourneyListItem.fromMap(item);
    }).toList();
  }
}

class JourneyListItem {
  JourneyListItem();
  factory JourneyListItem.fromMap(json) {
    return JourneyListItem();
  }
}
