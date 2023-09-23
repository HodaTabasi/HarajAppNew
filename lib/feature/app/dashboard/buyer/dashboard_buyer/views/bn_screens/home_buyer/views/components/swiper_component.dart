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
        return SizedBox(
          height: 160.h,
          width: double.infinity.w,
          child: Swiper(
            duration: 500,
            autoplay: false,
            // itemCount: controller.ads.where((p0) => p0.featured ?? false).toList().length,
            itemCount: controller.ads.length,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (BuildContext context, int index) {
              if (controller.ads[index].featured == true) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: ColorResource.secondaryColor,
                    image: DecorationImage(
                      image: NetworkImage(
                          controller.ads[index].gallery!.first.image!),
                      fit: BoxFit.cover,
                    ),
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
