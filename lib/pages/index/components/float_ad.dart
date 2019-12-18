import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_travel/store/index/index.dart';
import 'package:provider/provider.dart';

class FloatAd extends StatelessWidget {
  final String _src;

  FloatAd(this._src);

  Widget _renderFloatAd(BuildContext context, IndexStore indexStore) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
          decoration: BoxDecoration(color: Colors.black45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: CachedNetworkImage(
                  width: ScreenUtil().setWidth(570).toDouble(),
                  height: ScreenUtil().setHeight(766).toDouble(),
                  imageUrl: _src ?? "",
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                onTap: () {
                  indexStore.setShowFloatAd(false);
                },
                child: Container(
                  width: ScreenUtil().setWidth(60).toDouble(),
                  height: ScreenUtil().setHeight(60).toDouble(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                        color: Colors.white,
                        width: 2,
                        style: BorderStyle.solid),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _render(BuildContext context) {
    final IndexStore indexStore = Provider.of<IndexStore>(context);
    if (indexStore.showFloatAd) {
      return _renderFloatAd(context, indexStore);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return _render(context);
      },
    );
  }
}
