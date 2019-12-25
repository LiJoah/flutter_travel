import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/widgets/normal_app_bar_title.dart';

class NormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color bgColor;
  final Color fontColor;
  NormalAppBar({@required this.title, this.bgColor, this.fontColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: bgColor == null ? primaryColor : bgColor,
      elevation: 0,
      centerTitle: true,
      title: NormalAppBarTitle(
        title: title,
        color: fontColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44);
}
