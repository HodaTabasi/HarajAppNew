part of offer_seller_view;

class NewAdsComponent extends StatefulWidget {
  const NewAdsComponent({super.key});

  @override
  State<NewAdsComponent> createState() => _NewAdsComponentState();
}

class _NewAdsComponentState extends State<NewAdsComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => AdsDetailScreen(
                        productId: 1,
                      ));
                },
                child: AppCarContainer(
                  nameCar: 'بوغاتي شيرون',
                  imageCar:
                      "https://www.pixel4k.com/wp-content/uploads/2019/01/bugatti-chiron-4k_1546362064.jpg.webp",
                  priceCar: '5000 درهم',
                  conditionCar: 'ممتازة',
                  showCar: 'زائر',
                  postingTime: 'قبل ساعة',
                  showLocation: true,
                  iconLocation: IconsApp.location,
                  nameLocation: "دبي",
                  showSeller: true,
                  sellerName: "محمود محمود",
                  imageSeller:
                      "https://t4.ftcdn.net/jpg/02/44/15/93/360_F_244159328_RMi7Md6rmrXMuVCZp9dQWp9r1UoIcVYt.jpg",
                  showOfferedPrice: true,
                  offerPrice: "49999",
                  discountPrice: "550000",
                  showStatus: true,
                  menuItem: [
                    AppPopupMenuItem(
                      value: 1,
                      iconAsset: IconsApp.check,
                      title: context.localizations.yes,
                      iconColor: ColorResource.green,
                    ),
                    AppPopupMenuItem(
                      value: 2,
                      iconAsset: IconsApp.cross,
                      title: context.localizations.no,
                      iconColor: ColorResource.mainColor,
                    ),
                  ],
                  onSelected: (value) {
                    // Handle selection for this usage
                    debugPrint('Selected value:💯 $value');
                    switch (value) {
                      case 1:
                        // Get.bottomSheet(
                        //     AppBottomSheet(
                        //       body: BottomSheetBody(),
                        //       height: 280.h,
                        //     ),
                        //     enterBottomSheetDuration:
                        //         const Duration(milliseconds: 500),
                        //     exitBottomSheetDuration:
                        //         const Duration(milliseconds: 400));
                        break;
                      case 2:
                        break;
                      // Add more cases as needed
                    }
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
