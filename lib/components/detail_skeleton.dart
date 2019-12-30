import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';
import 'package:shimmer/shimmer.dart';

class DetailSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Container(
                height: ScreenUtilHelper.setHeight(440.0), color: Colors.grey),
            Container(
                height: ScreenUtilHelper.setHeight(200.0), color: Colors.grey),
            SizedBox(height: 10),
            Container(
                height: ScreenUtilHelper.setHeight(200.0), color: Colors.grey),
            Container(height: 10.0, color: Colors.grey),
            SizedBox(height: 10),
            Container(
                height: ScreenUtilHelper.setHeight(200.0), color: Colors.grey),
            SizedBox(height: 10),
            Container(
              height: 40.0,
              color: Colors.grey,
            ),
            Container(
                height: ScreenUtilHelper.setHeight(200.0), color: Colors.grey),
            Container(
                height: ScreenUtilHelper.setHeight(200.0), color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
