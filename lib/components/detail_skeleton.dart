import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            Container(height: 440.0, color: Colors.grey),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(width: 50.0, height: 10.0, color: Colors.grey),
                Container(width: 70.0, height: 10.0, color: Colors.grey),
                Container(width: 20.0, height: 10.0, color: Colors.grey),
              ],
            ),
            Container(height: 10.0, color: Colors.grey),
            SizedBox(height: 10),
            Container(height: 10.0, color: Colors.grey),
            SizedBox(height: 10),
            Container(
              height: 40.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
