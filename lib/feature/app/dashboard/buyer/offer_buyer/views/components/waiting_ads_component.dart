part of offer_buyer_view;

class WaitingAdsComponent extends StatefulWidget {
  const WaitingAdsComponent({super.key});

  @override
  State<WaitingAdsComponent> createState() => _WaitingAdsComponentState();
}

class _WaitingAdsComponentState extends State<WaitingAdsComponent> {
  final OfferBuyerController offerBuyerController =
      Get.put(OfferBuyerController());

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
                  Get.to(() => AdsDetailBuyerScreen());
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
                  showStatus: false,
                  menuItem: [
                    AppPopupMenuItem(
                      value: 1,
                      iconAsset: IconsApp.edit,
                      title: context.localizations.edit,
                      iconColor: ColorResource.mainColor,
                    ),
                    AppPopupMenuItem(
                      value: 2,
                      iconAsset: IconsApp.remove,
                      title: context.localizations.delete,
                      iconColor: ColorResource.mainColor,
                    ),
                  ],
                  onSelected: (value) {
                    // Handle selection for this usage
                    debugPrint('Selected value:💯 $value');
                    switch (value) {
                      case 1:
                        Get.bottomSheet(
                            AppBottomSheet(
                              body: BottomSheetBody(
                                headTitle: context.localizations.edit_offer,
                                buttonTitle: context.localizations.send_edit,
                              ),
                              height: 400.h,
                            ),
                            enterBottomSheetDuration:
                                const Duration(milliseconds: 500),
                            exitBottomSheetDuration:
                                const Duration(milliseconds: 400));
                        break;
                      case 2:
                        Get.dialog(AlertDialog());
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
