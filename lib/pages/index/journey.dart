import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/api.dart';
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
    return _data.count == 0 || _data.timelines.isEmpty;
  }

  _getJourneyList() async {
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

  Widget _render() {
    if (_data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (_isShowEmptyHint()) {
      return Center(
        child: Text(
          "没有数据哦...",
          style: TextStyle(color: Colors.black87, fontSize: 22),
        ),
      );
    } else {
      return Center(
        child: Text(
          "有数据了哦...",
          style: TextStyle(color: Colors.black87, fontSize: 22),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _render();
  }
}
