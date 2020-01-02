import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/components/panel_title.dart';

class ContentWrap extends StatelessWidget {
  final Widget _child;
  final String _title;

  ContentWrap(this._child, this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[PanelTitle(_title), _child],
      ),
    );
  }
}
