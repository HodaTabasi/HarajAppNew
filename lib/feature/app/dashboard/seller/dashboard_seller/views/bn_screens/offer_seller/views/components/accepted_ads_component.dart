part of offer_seller_view;

class AcceptedAdsComponent extends StatefulWidget {
  const AcceptedAdsComponent({super.key});

  @override
  State<AcceptedAdsComponent> createState() => _AcceptedAdsComponentState();
}

class _AcceptedAdsComponentState extends State<AcceptedAdsComponent> {
  final OfferSellerController controller = Get.put(OfferSellerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.acceptedOffers.isNotEmpty) {
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
                            productId: controller.acceptedOffers[index].postId!,
                          ));
                    },
                    child: AppCarContainer(
                      nameCar:
                          controller.acceptedOffers[index].post!.car!.name!,
                      imageCar: controller
                          .acceptedOffers[index].post!.gallery!.first.image!,
                      priceCar: '',
                      conditionCar: controller
                          .acceptedOffers[index].post!.mechanicalStatus!.name!,
                      showCar: 'زائر',
                      postingTime: controller.acceptedOffers[index].createdAt!,
                      showLocation: true,
                      iconLocation: IconsApp.location,
                      nameLocation: controller.acceptedOffers[index].post!
                          .store!.address!.governorate!.name!,
                      showSeller: true,
                      sellerName:
                          controller.acceptedOffers[index].client!.name!,
                      imageSeller:
                          controller.acceptedOffers[index].client!.avatar ??
                              ImagesApp.brandLogo,
                      showOfferedPrice: true,
                      offerPrice:
                          controller.acceptedOffers[index].amount.toString(),
                      discountPrice:
                          controller.acceptedOffers[index].post!.price!,
                      showStatus: true,
                      menuItem: [
                        AppPopupMenuItem(
                          value: 1,
                          iconAsset: IconsApp.chatting,
                          title: context.localizations.contact,
                          iconColor: ColorResource.green,
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
