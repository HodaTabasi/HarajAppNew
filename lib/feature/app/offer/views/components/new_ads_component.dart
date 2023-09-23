part of offer_view;

class NewAdsComponent extends StatefulWidget {
  const NewAdsComponent({super.key});

  @override
  State<NewAdsComponent> createState() => _NewAdsComponentState();
}

class _NewAdsComponentState extends State<NewAdsComponent> {
  final OfferController controller = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller
          .newOffers.isEmpty /*controller.newOffers.isNotEmpty*/) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                // itemCount: controller.newOffers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => AdsDetailScreen(
                            productId: controller.newOffers[index].postId!,
                          ));
                    },
                    child: AppCarContainer(
                      nameCar: 'بوغاتي شيرون',
                      imageCar:
                          "https://www.pixel4k.com/wp-content/uploads/2019/01/bugatti-chiron-4k_1546362064.jpg.webp",
                      priceCar: '',
                      conditionCar: SharedPrefController().type == 1
                          ? controller
                              .newOffers[index].post!.mechanicalStatus!.name!
                          : "Watting",
                      showCar: SharedPrefController().type == 1 ? "زائر" : "",
                      postingTime: SharedPrefController().type == 1
                          ? controller.newOffers[index].createdAt!
                          : "",
                      showLocation: true,
                      iconLocation: IconsApp.location,
                      nameLocation: controller.newOffers[index].post!.store!
                          .address!.governorate!.name!,
                      showSeller: true,
                      sellerName: SharedPrefController().type == 1
                          ? controller.newOffers[index].client!.name!
                          : controller.newOffers[index].post!.store!.name!,
                      imageSeller: SharedPrefController().type == 1
                          ? controller.newOffers[index].client!.avatar ??
                              ImagesApp.brandLogo
                          : controller.newOffers[index].post!.store!.avatar ??
                              ImagesApp.brandLogo,
                      showOfferedPrice: true,
                      offerPrice: controller.newOffers[index].amount.toString(),
                      discountPrice: controller.newOffers[index].post!.price!,
                      showStatus:
                          SharedPrefController().type == 1 ? false : true,
                      menuItem: SharedPrefController().type == 1
                          ? [
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
                            ]
                          : [
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
                            SharedPrefController().type == 1
                                ? controller.acceptOffer(
                                    postId: controller.newOffers[index].id!)
                                : Get.bottomSheet(
                                    AppBottomSheet(
                                      body: BottomSheetBody(
                                        headTitle:
                                            context.localizations.edit_offer,
                                        buttonTitle:
                                            context.localizations.send_edit,
                                      ),
                                      height: 400.h,
                                    ),
                                    enterBottomSheetDuration:
                                        const Duration(milliseconds: 500),
                                    exitBottomSheetDuration:
                                        const Duration(milliseconds: 400));
                            break;
                          case 2:
                            SharedPrefController().type == 1
                                ? debugPrint('Selected value 2:💯 $value')
                                : Get.dialog(AlertDialog());
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
      } else {
        return Center(
          child: Text('No data'),
        );
      }
    });
  }
}
