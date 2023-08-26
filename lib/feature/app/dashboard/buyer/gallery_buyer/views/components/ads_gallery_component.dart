part of gallery_buyer_view;

class AdsGalleryComponent extends StatefulWidget {
  const AdsGalleryComponent({super.key});

  @override
  State<AdsGalleryComponent> createState() => _AdsGalleryComponentState();
}

class _AdsGalleryComponentState extends State<AdsGalleryComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          RowDividerWidget(
            text: '010 ${context.localizations.ad}',
            lineColor: ColorResource.gray,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.to(() => AdsDetailBuyerScreen());
              },
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsetsDirectional.symmetric(vertical: 16.h),
                itemCount: 10,
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
            ),
          ),
        ],
      ),
    );
  }
}
