part of ads_detail_buyer_view;

class CheckAlertDialog extends StatelessWidget {
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
                assetName: IconsApp.bigCheck,
              ),
              SizedBox(height: 34.h),
              AppText(
                textAlign: TextAlign.start,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                //TODO:Make Lang Here
                text: "تم ارسال العرض بنجاح",
                color: ColorResource.mainFontColor,
              ),
            ],
          )),
    );
  }
}
