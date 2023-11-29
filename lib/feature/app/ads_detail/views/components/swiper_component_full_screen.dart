part of ads_detail_buyer_view;

class SwiperComponentFullScreen extends StatefulWidget {
  SwiperComponentFullScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<SwiperComponentFullScreen> createState() => _SwiperComponentFullScreenState();
}

class _SwiperComponentFullScreenState extends State<SwiperComponentFullScreen> {
  late AdsDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: double.infinity.w,
      child: controller.adsDetail.value.gallery!.isEmpty
          ? Column(
              children: [
                SizedBox(
                  width: 127.w,
                  height: 151.h,
                  child: ClipPath(
                    clipper: RPSCustomPainter(),
                    child: AppSvgPicture(assetName: IconsApp.logoSeller),
                  ),
                ),
                Text('لا يوجد صور متوفرة للسيارة'),
              ],
            )
          : Swiper(
              duration: 500,
              autoplay: true,
              itemCount: controller.adsDetail.value.gallery!.length,
              viewportFraction: 1,
              scale: 0.8,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: ColorResource.secondaryColor,
                    image: DecorationImage(
                      image: NetworkImage(
                          controller.adsDetail.value.gallery![index].image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 28.w,
                          height: 28.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: ColorResource.white,
                          ),
                          child: InkWell(
                              onTap: () {
                                Get.dialog(
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SwiperComponent(id: widget.id),
                                      ],
                                    ),
                                    barrierColor: Colors.black,
                                    barrierDismissible: true);
                              },
                              child: AppSvgPicture(
                                  assetName: IconsApp.fillScreen))),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
