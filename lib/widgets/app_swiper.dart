import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class AppSwiper extends StatefulWidget {
  AppSwiper(
      {super.key,
      required this.height,
      required this.itemCount,
      required this.viewportFraction,
      required this.imageSwiper});

  final double height;
  final int itemCount;
  final double viewportFraction;
  final String imageSwiper;

  @override
  State<AppSwiper> createState() => _AppSwiperState();
}

class _AppSwiperState extends State<AppSwiper> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity.w,
      child: Swiper(
        duration: 500,
        autoplay: true,
        itemCount: widget.itemCount,
        viewportFraction: widget.viewportFraction,
        scale: 0.8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: ColorResource.secondaryColor,
              image: DecorationImage(
                image: NetworkImage(widget.imageSwiper),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
