part of home_buyer_view;

class ShowAds extends StatefulWidget {
  const ShowAds({super.key});

  @override
  State<ShowAds> createState() => _ShowAdsState();
}

class _ShowAdsState extends State<ShowAds> {
  final HomeBuyerController controller = Get.put(HomeBuyerController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => AdsDetailBuyerScreen());
      },
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 4.h),
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 17.h, // Add spacing between grid items.
          crossAxisSpacing: 15.w, // Add spacing between grid items.
          childAspectRatio: 160.w / 281.h, // Width on Height
        ),
        itemBuilder: (BuildContext context, int index) {
          return const AppAdsCarContainer(
            nameCar: 'بوغاتي شيرون',
            imageCar: ImagesApp.imageSwiper,
            priceCar: '5000 درهم',
            conditionCar: 'ممتازة',
            imageSeller: ImagesApp.imageSwiper,
            sellerName: 'معرض النور لبيع السيارات',
            nameLocation: 'دبي',
          );
        },
      ),
    );
  }
}
