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
      height: double.infinity.h,
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
              autoplay: false,
              itemCount: controller.adsDetail.value.gallery!.length,
              viewportFraction: 1,
              scale: 0.8,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment:Localizations.localeOf(context)
                      .languageCode == 'ar'
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: ColorResource.black,
                    image: DecorationImage(
                      image: NetworkImage(
                          controller.adsDetail.value.gallery![index].image!),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Positioned.directional(
                      start: 10,
                      top: 10,
                      textDirection:
                      Localizations.localeOf(context)
                          .languageCode ==
                          'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ))),
                );
              },
            ),
    );
  }
}
