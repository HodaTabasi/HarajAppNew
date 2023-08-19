part of ads_detail_seller_view;

class SwiperComponent extends StatefulWidget {
  SwiperComponent({Key? key}) : super(key: key);

  @override
  State<SwiperComponent> createState() => _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
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
              image: const DecorationImage(
                image: NetworkImage(
                    'https://www.pixel4k.com/wp-content/uploads/2019/01/bugatti-chiron-4k_1546362064.jpg.webp'),
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
                    child: AppSvgPicture(assetName: IconsApp.fillScreen)),
              ],
            ),
          );
        },
      ),
    );
  }
}
