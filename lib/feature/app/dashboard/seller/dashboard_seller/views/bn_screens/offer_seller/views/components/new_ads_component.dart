part of offer_seller_view;

class NewAdsComponent extends StatefulWidget {
  const NewAdsComponent({super.key});

  @override
  State<NewAdsComponent> createState() => _NewAdsComponentState();
}

class _NewAdsComponentState extends State<NewAdsComponent> {
  final OfferSellerController controller = Get.put(OfferSellerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.newOffers.isNotEmpty) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.newOffers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => AdsDetailScreen(
                            productId: controller.newOffers[index].postId!,
                          ));
                    },
                    child: AppCarContainer(
                      nameCar: controller.newOffers[index].post!.car!.name!,
                      imageCar: controller
                          .newOffers[index].post!.gallery!.first.image!,
                      priceCar: "",
                      conditionCar: controller
                          .newOffers[index].post!.mechanicalStatus!.name!,
                      showCar: 'زائر',
                      postingTime: controller.newOffers[index].createdAt!,
                      showLocation: true,
                      iconLocation: IconsApp.location,
                      nameLocation: controller.newOffers[index].post!.store!
                          .address!.governorate!.name!,
                      showSeller: true,
                      sellerName: controller.newOffers[index].client!.name!,
                      imageSeller: controller.newOffers[index].client!.avatar ??
                          ImagesApp.brandLogo,
                      showOfferedPrice: true,
                      offerPrice: controller.newOffers[index].amount.toString(),
                      discountPrice: controller.newOffers[index].post!.price!,
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
      } else {
        return Center(
          child: Text('No data'),
        );
      }
    });
  }
}
