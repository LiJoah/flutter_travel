import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NormalListSkeleton extends StatelessWidget {
  final int count;

  NormalListSkeleton({this.count = 10});

  List<Widget> _renderList() {
    List<Widget> list = [];
    for (var i = 0; i < count; i++) {
      list.add(CoinRankingListItemSkeleton());
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Column(
          children: _renderList(),
        ),
      ),
    );
  }
}

class CoinRankingListItemSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: 80.0,
      child: Row(
        children: <Widget>[
          Container(width: 160.0, color: Colors.grey),
          SizedBox(width: 10.0),
          Expanded(
              child: Container(
            child: Column(
              children: <Widget>[
                Container(height: 10.0, color: Colors.grey),
                SizedBox(height: 10),
                Container(height: 10.0, color: Colors.grey),
                SizedBox(height: 10),
                Container(height: 10.0, color: Colors.grey),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(width: 50.0, height: 10.0, color: Colors.grey),
                    Container(width: 70.0, height: 10.0, color: Colors.grey),
                    Container(width: 20.0, height: 10.0, color: Colors.grey),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
