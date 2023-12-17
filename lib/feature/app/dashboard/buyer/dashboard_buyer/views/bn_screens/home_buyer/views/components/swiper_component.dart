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
      var featuredList  =  controller.ads.where((element) => element.featured ==  true)
          .where((element) => element.status ==  true)
          .toList();
      if (controller.loading.value) {
        return const Center(
            child: CircularProgressIndicator(color: ColorResource.transparent));
      }
      else
        if (featuredList.isNotEmpty) {
        if (kDebugMode) {
          print("Featured ads : ${featuredList.length}");
          for (var element in featuredList) { if (kDebugMode) {
            print("element.status : ${element.featured}");
          }}

        }
        return SizedBox(
          height: 170.h,
          width: double.infinity.w,
          child: Swiper(
            duration: 500,
            autoplay: false,
            loop: false,
            // itemCount: controller.ads.where((p0) => p0.featured ?? false).toList().length,
            itemCount: featuredList.where((element) => element.featured == true)
                .where((element) => element.status ==  true)
                .toList().length,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (BuildContext context, int index) {
              if (featuredList[index].featured == true) {
             return InkWell(
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
                                child:(controller.ads[index].gallery?.isEmpty??true)?
                                  AppSvgPicture(assetName: IconsApp.logoSeller):
                                  CircleAvatar(
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
                                Container(
                                  constraints: const BoxConstraints(maxWidth: 200),
                                  child: AppText(
                                      color: ColorResource.mainFontColor,
                                      overflow: TextOverflow.ellipsis,
                                      maxLine: 1,
                                      text: controller.ads[index].generalStatus?.name??"no status"),
                                ),
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
      }
        else {
        return Center(
          child: Text(''),
        );
      }
    });
  }
}
