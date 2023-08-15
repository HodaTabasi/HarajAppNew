part of subscription_seller_view;

class ErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          backgroundColor: ColorResource.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Container(
              width: double.infinity,
              height: 310.h,
              // padding: EdgeInsets.symmetric(horizontal: 30.w),
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                children: [
                  AppSvgPicture(
                    assetName: IconsApp.stop,
                  ),
                  SizedBox(height: 34.h),
                  AppText(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    text: context.localizations.cant_login,
                    color: ColorResource.mainFontColor,
                  ),
                  SizedBox(height: 18.h),
                  AppText(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    text: context.localizations.must_subscribe,
                    color: ColorResource.mainFontColor,
                  ),
                  SizedBox(height: 24.h),
                  SaveButton(
                      title: context.localizations.subscription,
                      onPressed: () {
                        // Navigator.pushNamedAndRemoveUntil(
                        //   context,
                        //   KeyRoutes.mainSellerScreen,
                        //   (route) => false,
                        // );
                        Get.back();
                      }),
                ],
              )),
        ));
  }
}
