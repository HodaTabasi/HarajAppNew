import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String imageName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const AppImage(
      {super.key,
      required this.imageName,
      this.height,
      this.width,
      this.color,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageName,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }
}
