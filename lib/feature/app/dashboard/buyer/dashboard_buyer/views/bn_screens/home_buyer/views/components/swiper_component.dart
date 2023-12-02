part of home_buyer_view;

class SwiperComponent extends StatefulWidget {
  const SwiperComponent({Key? key}) : super(key: key);

  @override
  State<SwiperComponent> createState() => _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent> {
  final HomeBuyerController controller = Get.put(HomeBuyerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(
            child: CircularProgressIndicator(color: ColorResource.transparent));
      } else if (controller.ads.isNotEmpty) {
        if (kDebugMode) {
          var featuredList  =  controller.ads.where((element) => element.featured =  true).toList();
          print("Featured ads : ${featuredList.length}");

        }
        return SizedBox(
          height: 170.h,
          width: double.infinity.w,
          child: Swiper(
            duration: 500,
            autoplay: false,
            // itemCount: controller.ads.where((p0) => p0.featured ?? false).toList().length,
            itemCount: controller.ads.where((element) => element.featured =  true).toList().length,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (BuildContext context, int index) {
              if (controller.ads[index].featured == true) {
                return (controller.ads[index].gallery?.isEmpty??true)
                    ? InkWell(
                  onTap: (){
                    Get.to( AdsDetailScreen(productId: controller.ads[index].id!));
                  },
                      child: Container(
                      decoration: BoxDecoration(
                        color: ColorResource.fillgrey,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: ColorResource.lightGreyDivider1),
                      ),
                      padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                      margin:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        SizedBox(
                        height: 90.h,
                        width: 90.w,
                        child: AppSvgPicture(assetName: IconsApp.logoSeller)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                fontWeight: FontWeight.bold,
                                color: ColorResource.mainFontColor,
                                  text:"${controller.ads[index].brand}"??""),
                              AppText(
                                  color: ColorResource.mainFontColor,
                                  text: "${controller.ads[index].address?.governorate?.name??"no govern"} - "
                                      "${controller.ads[index].address?.city?.name??"no city"}"),
                              AppText(
                                color: ColorResource.mainFontColor,
                                  text:controller.ads[index].outColor?.name??"no color"
                              ),
                              AppText(
                                  color: ColorResource.mainColor,
                                  text:controller.ads[index].price??"no color"
                              )
                            ],
                          ),
                        )])),
                    )
                    :InkWell(
                  onTap: (){
                    Get.to( AdsDetailScreen(productId: controller.ads[index].id!));
                  },
                      child: Container(
                  decoration: BoxDecoration(
                      color: ColorResource.fillgrey,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                          color: ColorResource.lightGreyDivider1),
                  ),
                  padding:
                  EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                  margin:
                  EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: SizedBox(
                                height: 70.h,
                                width: 70.w,
                                child: CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: ColorResource.lightGray,
                                  backgroundImage:
                                  NetworkImage(controller.ads[index].gallery!.first.image!)),
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppText(
                                    fontWeight: FontWeight.bold,
                                    color: ColorResource.mainFontColor,
                                    text:"${controller.ads[index].brand}"??""),
                                AppText(
                                    color: ColorResource.mainFontColor,
                                    text: controller.ads[index].generalStatus?.name??"no status"),
                                AppText(
                                    color: ColorResource.mainFontColor,
                                    text:controller.ads[index].outColor?.name??"no color"
                                ),
                                AppText(
                                    color: ColorResource.mainColor,
                                    text:"${controller.ads[index].price??"no color"} ${context.localizations.currency}"
                                )
                              ],
                            ),
                          )]),
                ),
                    );
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      } else {
        return Center(
          child: Text(''),
        );
      }
    });
  }
}
