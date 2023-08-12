import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Copy this CustomPainter code to the Bottom of the File
class AppClipPathShape extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }

  @override
  ui.Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.1059603.h);
    path_0.cubicTo(size.width, size.height * 0.04744000.h,
        size.width * 0.9417642.w, 0, size.width * 0.8699187.w, 0);
    path_0.lineTo(size.width * 0.1311976.w, 0);
    path_0.cubicTo(
        size.width * 0.04748073.w,
        0,
        size.width * -0.01443911.w,
        size.height * 0.06348020.h,
        size.width * 0.004481911.w,
        size.height * 0.1299086.h);
    path_0.lineTo(size.width * 0.2289528.w, size.height * 0.9179868.h);
    path_0.cubicTo(
        size.width * 0.2426301.w,
        size.height * 0.9660066.h,
        size.width * 0.2951528.w,
        size.height,
        size.width * 0.3556683.w,
        size.height);
    path_0.lineTo(size.width * 0.8699187.w, size.height);
    path_0.cubicTo(size.width * 0.9417642.w, size.height, size.width,
        size.height * 0.9525629.h, size.width, size.height * 0.8940397.h);
    path_0.lineTo(size.width, size.height * 0.1059603.h);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffD9D9D9).withOpacity(1.0);

    return path_0;
  }
}
