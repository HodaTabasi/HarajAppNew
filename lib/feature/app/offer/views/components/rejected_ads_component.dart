part of offer_view;

class RejectedAdsComponent extends StatefulWidget {
  const RejectedAdsComponent({super.key});

  @override
  State<RejectedAdsComponent> createState() => _RejectedAdsComponentState();
}

class _RejectedAdsComponentState extends State<RejectedAdsComponent> {
  final OfferController controller = Get.put(OfferController());

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
                      gallery: controller
                          .rejectedOffers[index].post!.gallery,
                      priceCar: '',
                      showStatus:
                          SharedPrefController().type == 1 ? false : true,
                      //TODO: Make Lang Here
                      conditionCar: "مرفوضة",
                      showCar: '',
                      postingTime: SharedPrefController().type == 1
                          ? controller.rejectedOffers[index].createdAt!
                          : "",
                      showLocation: true,
                      iconLocation: IconsApp.location,
                      nameLocation: controller.rejectedOffers[index].post!
                          .store!.address!.governorate!.name!,
                      showSeller: true,
                      sellerName: SharedPrefController().type == 1
                          ? controller.rejectedOffers[index].client!.name!
                          : controller.rejectedOffers[index].post!.store!.name!,
                      imageSeller: SharedPrefController().type == 1
                          ? controller.rejectedOffers[index].client!.avatar ??
                              ImagesApp.brandLogo
                          : controller
                                  .rejectedOffers[index].post!.store!.avatar ??
                              ImagesApp.brandLogo,
                      showOfferedPrice: true,
                      offerPrice:
                          controller.rejectedOffers[index].amount.toString(),
                      discountPrice:
                          controller.rejectedOffers[index].post!.price!,
                      menuItem: SharedPrefController().type == 1
                          ? [
                              // AppPopupMenuItem(
                              //   value: 1,
                              //   iconAsset: IconsApp.remove,
                              //   title: context.localizations.delete,
                              //   iconColor: ColorResource.mainColor,
                              // ),
                            ]
                          : [
                              AppPopupMenuItem(
                                value: 1,
                                iconAsset: IconsApp.resend,
                                title: context.localizations.re_send,
                                iconColor: ColorResource.mainColor,
                              ),
                              // AppPopupMenuItem(
                              //   value: 2,
                              //   iconAsset: IconsApp.remove,
                              //   title: context.localizations.delete,
                              //   iconColor: ColorResource.mainColor,
                              // ),
                            ],
                      onSelected: (value) {
                        // Handle selection for this usage
                        debugPrint('Selected value:💯 $value');
                        switch (value) {
                          case 1:
                            SharedPrefController().type == 1
                                ? controller.acceptOffer(
                                    postId:
                                        controller.rejectedOffers[index].id!)
                                : Get.bottomSheet(
                                    AppBottomSheet(
                                      body: BottomSheetBody(
                                        headTitle:
                                            context.localizations.edit_price,
                                        buttonTitle:
                                            context.localizations.re_send,
                                        nameCar: controller
                                            .rejectedOffers[index]
                                            .post!
                                            .car!
                                            .name!,
                                        gallery: controller
                                            .rejectedOffers[index]
                                            .post!
                                            .gallery,
                                        //TODO: Make Lang Here
                                        conditionCar: "مرفوضة",
                                        sellerName: controller
                                            .rejectedOffers[index]
                                            .post!
                                            .store!
                                            .name!,
                                        imageSeller: controller
                                                .rejectedOffers[index]
                                                .post!
                                                .store!
                                                .avatar ??
                                            ImagesApp.brandLogo,
                                        offerPrice: controller
                                            .rejectedOffers[index].amount
                                            .toString(),
                                        discountPrice: controller
                                            .rejectedOffers[index].post!.price!,
                                        sendNewOfferButton: () {
                                          controller.performNewPrice(
                                              productId: controller
                                                  .rejectedOffers[index]
                                                  .postId!);
                                          Get.back();
                                        },
                                      ),
                                      height: 420.h,
                                    ),
                                    enterBottomSheetDuration:
                                        const Duration(milliseconds: 500),
                                    exitBottomSheetDuration:
                                        const Duration(milliseconds: 400));
                            break;
                          case 2:
                            Get.dialog(RemoveAlertDialog(
                              removeOfferButton: () {
                                controller.destroyOffer(
                                    postId:
                                        controller.rejectedOffers[index].id!);
                              },
                            ));
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
