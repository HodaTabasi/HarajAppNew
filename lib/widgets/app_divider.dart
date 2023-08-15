import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double thickness;
  const AppDivider(
      {Key? key,
      required this.height,
      required this.color,
      required this.thickness})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: color,
      thickness: thickness,
    );
  }
}
