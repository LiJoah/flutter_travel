import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_travel/models/home_info_config.dart';

class ActivityBanner extends StatelessWidget {
  final List<BannerModel> _banners;
  ActivityBanner(List<BannerModel> _banners) : _banners = _banners ?? [] {
    _banners = _banners;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 15, bottom: 30),
      padding: EdgeInsets.only(left: 16, right: 16),
      width: ScreenUtil().setWidth(686).toDouble(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "热门活动",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(298).toDouble(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Swiper(
              containerHeight: ScreenUtil().setHeight(298).toDouble(),
              containerWidth: ScreenUtil().setWidth(686).toDouble(),
              scale: 0.9,
              autoplay: true,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      activeColor: Color(0xff23f6e1))),
              itemBuilder: (context, int index) {
                String src =
                    _banners[index]?.newImg ?? _banners[index]?.imgUrl ?? "";
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: CachedNetworkImage(
                    imageUrl: src,
                    fit: BoxFit.fill,
                  ),
                );
              },
              itemCount: _banners.length,
            ),
          )
        ],
      ),
    );
  }
}
