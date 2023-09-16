part of favorite_buyer_view;

class SavedAdsComponent extends StatefulWidget {
  const SavedAdsComponent({super.key});

  @override
  State<SavedAdsComponent> createState() => _SavedAdsComponentState();
}

class _SavedAdsComponentState extends State<SavedAdsComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        RowDividerWidget(
          text: '010 ${context.localizations.ad}',
          lineColor: ColorResource.gray,
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 17.h, // Add spacing between grid items.
              crossAxisSpacing: 15.w, // Add spacing between grid items.
              childAspectRatio: 160.w / 281.h, // Width on Height
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.to(() => AdsDetailBuyerScreen(
                        productId: 1,
                      ));
                },
                child: const AppAdsCarContainer(
                  nameCar: 'بوغاتي شيرون',
                  imageCar: ImagesApp.imageSwiper,
                  priceCar: '5000 درهم',
                  conditionCar: 'ممتازة',
                  imageSeller: ImagesApp.imageSwiper,
                  sellerName: 'معرض النور لبيع السيارات',
                  nameLocation: 'دبي',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
