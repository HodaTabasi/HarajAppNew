import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double? fontSize;
  final TextAlign textAlign;
  final double height;
  final int? maxLine;
  final Color? color;
  final TextOverflow? overflow;

  final TextDecoration? textDecoration;
  final double? decorationThickness;

  const AppText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize,
    this.textAlign = TextAlign.center,
    this.height = 1,
    this.maxLine,
    this.color,
    this.overflow,
    this.textDecoration,
    this.decorationThickness,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        decoration: textDecoration,
        decorationThickness: decorationThickness,
      ),
    );
  }
}
