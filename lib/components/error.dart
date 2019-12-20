import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OurErrorWidget extends StatelessWidget {
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
              "出错了哦",
              style: TextStyle(color: Colors.black12, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
