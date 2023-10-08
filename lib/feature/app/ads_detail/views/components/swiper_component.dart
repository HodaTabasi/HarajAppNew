part of ads_detail_buyer_view;

class SwiperComponent extends StatefulWidget {
  SwiperComponent({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<SwiperComponent> createState() => _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent> {
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
      child: Swiper(
        duration: 500,
        autoplay: true,
        itemCount: controller.adsDetail.value.gallery!.length,
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
              image: DecorationImage(
                image:
                    NetworkImage(controller.adsDetail.value.gallery![index].image!),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: ColorResource.white,
                    ),
                    child: InkWell(
                        onTap: () {
                          Get.dialog(Image.network(
                              controller.adsDetail.value.gallery![index].image!,
                              fit: BoxFit.contain));
                        },
                        child: AppSvgPicture(assetName: IconsApp.fillScreen))),
              ],
            ),
          );
        },
      ),
    );
  }
}
