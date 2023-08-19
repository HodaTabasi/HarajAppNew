part of ads_detail_seller_view;

class AdsOffersComponent extends StatefulWidget {
  const AdsOffersComponent({super.key});

  @override
  State<AdsOffersComponent> createState() => _AdsOffersComponentState();
}

class _AdsOffersComponentState extends State<AdsOffersComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                text: "${context.localizations.offers_submitted} (${3})",
                color: ColorResource.mainFontColor,
              ),
              AppPopupMenuButton(
                menuItems: [
                  AppPopupMenuItem(
                    value: 1,
                    iconAsset: '',
                    title: context.localizations.all_offers,
                    iconColor: ColorResource.mainColor,
                  ),
                  AppPopupMenuItem(
                    value: 2,
                    iconAsset: '',
                    title: context.localizations.new_offers,
                    iconColor: ColorResource.red,
                  ),
                  AppPopupMenuItem(
                    value: 3,
                    iconAsset: '',
                    title: context.localizations.recent_offers,
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
                            body: BottomSheetBodyOffers(),
                            height: 280.h,
                          ),
                          enterBottomSheetDuration:
                              const Duration(milliseconds: 500),
                          exitBottomSheetDuration:
                              const Duration(milliseconds: 400));
                      break;
                    case 2:
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
                    case 3:
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
                    // Add more cases as needed
                  }
                },
              ),
            ],
          ),
          AppDivider(
            color: ColorResource.secondaryColor,
            height: 10.h,
            thickness: 1.h,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return OfferCard(
                  name: 'محمد محمد',
                  price: '400000 درهم',
                  image: ImagesApp.person,
                  posting: 'قبل 1 ساعة',
                  crossOnTab: () {},
                  checkOnTab: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
