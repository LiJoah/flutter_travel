import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_travel/base/api.dart';
import 'package:flutter_travel/components/empty.dart';
import 'package:flutter_travel/models/journey.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JourneyPage extends StatefulWidget {
  @override
  _JourneyPageState createState() {
    return _JourneyPageState();
  }
}

class _JourneyPageState extends State<JourneyPage> {
  JourneyDataModel _data;
  @override
  void initState() {
    super.initState();
    _getJourneyList();
  }

  bool _isShowEmptyHint() {
    return _data != null && (_data.count == 0 || _data.timelines.isEmpty);
  }

  Future<void> _getJourneyList() async {
    JourneyDataModel data;
    var res = await Api.getJoureyList();
    if (res.code == "601") {
      data = _data ?? JourneyDataModel(0, false, []);
    } else if (res.code == "0") {
      data = JourneyDataModel.fromMap(res.data);
    } else {
      data = JourneyDataModel(0, false, []);
      Fluttertoast.showToast(
          msg: "网络错误啦 ${res.message}", gravity: ToastGravity.TOP);
    }
    setState(() {
      _data = data;
    });
  }

  Widget _renderEmpty() {
    return EmptyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      emptyWidget: _isShowEmptyHint() ? _renderEmpty() : null,
      onRefresh: _getJourneyList,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Center(
              child: Text(
                "有数据哦...",
                style: TextStyle(color: Colors.black12, fontSize: 22),
              ),
            );
          }, childCount: _data != null ? _data?.count : 0),
        )
      ],
    );
  }
}
