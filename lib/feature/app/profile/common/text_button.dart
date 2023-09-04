import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/app_text.dart';

class TextButtonApp extends StatefulWidget {
  TextButtonApp(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.color,
      required this.alignment})
      : super(key: key);

  final void Function() onPressed;
  final String title;
  Color color;
  AlignmentGeometry alignment;

  @override
  State<TextButtonApp> createState() => _TextButtonAppState();
}

class _TextButtonAppState extends State<TextButtonApp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Align(
        alignment: widget.alignment,
        child: TextButton(
          onPressed: widget.onPressed,
          child: AppText(
              text: widget.title,
              color: widget.color,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
