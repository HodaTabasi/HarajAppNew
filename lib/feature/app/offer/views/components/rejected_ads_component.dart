part of offer_view;

class RejectedAdsComponent extends StatefulWidget {
  const RejectedAdsComponent({super.key});

  @override
  State<RejectedAdsComponent> createState() => _RejectedAdsComponentState();
}

class _RejectedAdsComponentState extends State<RejectedAdsComponent> {
  final OfferSellerController controller = Get.put(OfferSellerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.rejectedOffers.isNotEmpty) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.rejectedOffers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => AdsDetailScreen(
                            productId: controller.rejectedOffers[index].postId!,
                          ));
                    },
                    child: AppCarContainer(
                      nameCar:
                          controller.rejectedOffers[index].post!.car!.name!,
                      imageCar: controller
                          .rejectedOffers[index].post!.gallery!.first.image!,
                      priceCar: '',
                      conditionCar: controller
                          .rejectedOffers[index].post!.mechanicalStatus!.name!,
                      showCar: 'زائر',
                      postingTime: controller.rejectedOffers[index].createdAt!,
                      showLocation: true,
                      iconLocation: IconsApp.location,
                      nameLocation: controller.rejectedOffers[index].post!
                          .store!.address!.governorate!.name!,
                      showSeller: true,
                      sellerName:
                          controller.rejectedOffers[index].client!.name!,
                      imageSeller:
                          controller.rejectedOffers[index].client!.avatar ??
                              ImagesApp.brandLogo,
                      showOfferedPrice: true,
                      offerPrice:
                          controller.rejectedOffers[index].amount.toString(),
                      discountPrice:
                          controller.rejectedOffers[index].post!.price!,
                      showStatus: true,
                      menuItem: [],
                      onSelected: (value) {
                        // Handle selection for this usage
                        debugPrint('Selected value:💯 $value');
                        // Get.bottomSheet(
                        //     AppBottomSheet(
                        //       body: BottomSheetBody(),
                        //       height: 280.h,
                        //     ),
                        //     enterBottomSheetDuration:
                        //         const Duration(milliseconds: 500),
                        //     exitBottomSheetDuration:
                        //         const Duration(milliseconds: 400));
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
