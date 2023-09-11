// part of seller_info_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../../../utils/extensions/color_resource/color_resource.dart';

class ImageProfile extends StatefulWidget {
  String? avatar;

  ImageProfile({this.avatar});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: CircleAvatar(
        radius: 50.r,
        backgroundColor: ColorResource.lightGray,
        backgroundImage: NetworkImage(widget.avatar == null
            ? 'https://1.bp.blogspot.com/-kK7Fxm7U9o0/YN0bSIwSLvI/AAAAAAAACFk/aF4EI7XU_ashruTzTIpifBfNzb4thUivACLcBGAsYHQ/s1280/222.jpg'
            : widget.avatar!),
      ),
    );
  }
}
