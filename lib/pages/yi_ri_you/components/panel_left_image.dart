import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/screen_util_helper.dart';

class PanelLeftImage extends StatelessWidget {
  final String _img;

  PanelLeftImage(this._img);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: ScreenUtilHelper.setHeight(220),
      width: ScreenUtilHelper.setWidth(220),
      imageUrl: _img ?? "",
      fit: BoxFit.cover,
    );
  }
}
