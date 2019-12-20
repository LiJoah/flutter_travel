import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/no_data.png",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "没有数据哦...",
              style: TextStyle(color: Colors.black12, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
