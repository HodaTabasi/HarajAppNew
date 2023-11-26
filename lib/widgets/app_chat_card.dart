import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_text.dart';

class AppChatCard extends StatefulWidget {
  final String image;
  final num? postId;
  final String title;
  final String subTitle;
  final String time;
  final String numberOfMessages;
  final bool isOnLine;
  final bool isMessage;
  final bool isNewMessage;

  const AppChatCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.time,
    required this.numberOfMessages,
    required this.isOnLine,
    required this.isMessage,
    required this.isNewMessage, this.postId,
  });

  @override
  State<AppChatCard> createState() => _AppChatCardState();
}

class _AppChatCardState extends State<AppChatCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 74.h,
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(widget.postId != null)
              AppText(
                color: ColorResource.mainFontColor,
                text: 'رقم الإعلان ${widget.postId}',
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                textAlign: TextAlign.start,
                maxLine: 1,
                overflow: TextOverflow.ellipsis,
              ),
              ListTile(
                horizontalTitleGap: 10.w,
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 0.w,
                minVerticalPadding: 0.h,
                leading: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: 50.r,
                      width: 50.r,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        // border: Border.all(color: ColorResource.red, width: 1.w),
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    widget.isOnLine == true
                        ? CircleAvatar(
                            backgroundColor: ColorResource.white,
                            radius: 8.r,
                            child: CircleAvatar(
                              backgroundColor: ColorResource.green,
                              radius: 7.r,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AppText(
                        color: ColorResource.mainFontColor,
                        text: widget.title,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        textAlign: TextAlign.start,
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    AppText(
                      color: widget.isNewMessage == true
                          ? ColorResource.mainColor
                          : ColorResource.gray,
                      text: widget.time,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AppText(
                        color: ColorResource.gray,
                        text: widget.subTitle,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        textAlign: TextAlign.start,
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    widget.isMessage == true
                        ? !widget.isNewMessage ? const SizedBox():Container(
                            height: 19.h,
                            width: 18.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: ColorResource.mainColor,
                            ),
                            child: AppText(
                              color: ColorResource.white,
                              text: widget.numberOfMessages,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              textAlign: TextAlign.start,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
        AppDivider(
          height: 0.h,
          color: ColorResource.lightGray,
          thickness: 1,
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
