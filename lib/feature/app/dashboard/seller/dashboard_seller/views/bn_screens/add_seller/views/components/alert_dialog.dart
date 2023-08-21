part of add_seller_view;

class AlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorResource.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Container(
          width: double.infinity,
          height: 162.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            children: [
              AppSvgPicture(
                assetName: IconsApp.exclamationMark,
              ),
              SizedBox(height: 34.h),
              AppText(
                textAlign: TextAlign.start,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                text: context.localizations.additional_hint,
                color: ColorResource.mainFontColor,
              ),
            ],
          )),
    );
  }
}
