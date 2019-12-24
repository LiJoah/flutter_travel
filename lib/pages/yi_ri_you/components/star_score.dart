import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';

class StarScore extends StatefulWidget {
  final double _starWidth;

  StarScore(this._starWidth);

  @override
  _StarScoreState createState() {
    return _StarScoreState();
  }
}

class _StarScoreState extends State<StarScore> {
  GlobalKey _key = GlobalKey();
  double _left = 0;
  final double _size = 32;

  @override
  void initState() {
    super.initState();
    _computeLeft();
  }

  @override
  void dispose() {
    _key = null;
    super.dispose();
  }

  _computeLeft() {
    Future.delayed(Duration.zero, () {
      if (!mounted) {
        return;
      }
      double w = _key.currentContext.size.width;
      setState(() {
        _left = (widget._starWidth * w) / 100;
      });
    });
  }

  List<Widget> _renderStar() {
    return [1, 2, 3, 4, 5].map((_) {
      return Image.asset(
        "assets/images/star.png",
        width: ScreenUtilHelper.setWidth(_size),
        height: ScreenUtilHelper.setHeight(_size),
        fit: BoxFit.cover,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      height: ScreenUtilHelper.setHeight(_size),
      width: ScreenUtilHelper.setWidth(_size * 5),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _renderStar(),
          ),
          Positioned(
            top: 0,
            left: _left,
            width: ScreenUtilHelper.setWidth(_size * 5),
            height: ScreenUtilHelper.setHeight(_size),
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
