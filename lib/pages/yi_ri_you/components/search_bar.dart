import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/event_emitter.dart';

/// 搜索条
class SearchBar extends StatefulWidget {
  /// 事件发射实例
  final EventEmitter eventEmitter = EventEmitter();
  final String _placeholder;
  final String _label;

  ///
  SearchBar(this._label, this._placeholder);

  @override
  _SearchBarState createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget._placeholder,
            hintStyle: TextStyle(
                fontSize: 18.0, color: Color.fromARGB(100, 220, 220, 220)),
            labelText: widget._label));
  }
}
