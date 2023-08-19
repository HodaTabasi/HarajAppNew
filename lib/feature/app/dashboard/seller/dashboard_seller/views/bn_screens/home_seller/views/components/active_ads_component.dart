part of home_seller_view;

class ActiveAdsComponent extends StatefulWidget {
  const ActiveAdsComponent({super.key});

  @override
  State<ActiveAdsComponent> createState() => _ActiveAdsComponentState();
}

class _ActiveAdsComponentState extends State<ActiveAdsComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowDividerWidget(
          text: '010 ${context.localizations.ad}',
          lineColor: ColorResource.gray,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => AdsDetailSellerScreen());
                },
                child: AppCarContainer(
                  nameCar: 'بوغاتي شيرون',
                  imageCar:
                      "https://www.pixel4k.com/wp-content/uploads/2019/01/bugatti-chiron-4k_1546362064.jpg.webp",
                  priceCar: '5000 درهم',
                  conditionCar: 'ممتازة',
                  showCar: 'زائر',
                  postingTime: 'قبل ساعة',
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
                      iconColor: ColorResource.red,
                    ),
                  ],
                  onSelected: (value) {
                    // Handle selection for this usage
                    debugPrint('Selected value:💯 $value');
                    switch (value) {
                      case 1:
                        Get.bottomSheet(
                            AppBottomSheet(
                              body: BottomSheetBody(),
                              height: 280.h,
                            ),
                            enterBottomSheetDuration:
                                const Duration(milliseconds: 500),
                            exitBottomSheetDuration:
                                const Duration(milliseconds: 400));
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
