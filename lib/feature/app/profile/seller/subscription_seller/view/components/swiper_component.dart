part of subscription_seller_view;

class SwiperComponent extends StatefulWidget {
  SwiperComponent({Key? key}) : super(key: key);

  @override
  State<SwiperComponent> createState() => _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 134.h,
      width: double.infinity.w,
      child: Swiper(
        duration: 500,
        autoplay: true,
        itemCount: 3,
        viewportFraction: 1,
        scale: 0.8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: ColorResource.secondaryColor,
              // image: const DecorationImage(
              //   image: AssetImage(ImagesApp.backgroundCard),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TODO: make lang here
                    AppText(
                      text: 'بنك الامارات',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorResource.white,
                    ),
                    Container(
                        width: 26.w,
                        height: 28.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: ColorResource.white,
                          // image: const DecorationImage(
                          //   image: AssetImage(ImagesApp.backgroundCard),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: AppSvgPicture(assetName: IconsApp.copy)),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //TODO: make lang here
                    AppText(
                      text: 'حساب رقم :',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorResource.white,
                    ),
                    SizedBox(width: 10.w),
                    AppText(
                      text: '1234 5678 9101 1213',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorResource.white,
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 90.w,
                    height: 30.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: ColorResource.mainColor,
                    ),
                    child: AppText(
                      text: 'حساب جاري',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorResource.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
