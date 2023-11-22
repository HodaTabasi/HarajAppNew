part of offer_view;

class AcceptedAdsComponent extends StatefulWidget {
  const AcceptedAdsComponent({super.key});

  @override
  State<AcceptedAdsComponent> createState() => _AcceptedAdsComponentState();
}

class _AcceptedAdsComponentState extends State<AcceptedAdsComponent> {
  final OfferController controller = Get.put(OfferController());

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
                itemCount: controller.acceptedOffers.length,
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
                      gallery: controller
                          .acceptedOffers[index].post!.gallery,
                      priceCar: '',
                      showStatus:
                          SharedPrefController().type == 1 ? false : true,
                      //TODO: Make Lang Here
                      conditionCar: "مقبول",
                      showCar: '',
                      postingTime: SharedPrefController().type == 1
                          ? controller.acceptedOffers[index].createdAt!
                          : "",
                      showLocation: true,
                      iconLocation: IconsApp.location,
                      nameLocation: controller.acceptedOffers[index].post!
                          .store!.address!.governorate!.name!,
                      showSeller: true,
                      sellerName: SharedPrefController().type == 1
                          ? controller.acceptedOffers[index].client!.name!
                          : controller.acceptedOffers[index].post!.store!.name!,
                      imageSeller: SharedPrefController().type == 1
                          ? controller.acceptedOffers[index].client!.avatar ??
                              ImagesApp.brandLogo
                          : controller
                                  .acceptedOffers[index].post!.store!.avatar ??
                              ImagesApp.brandLogo,
                      showOfferedPrice: true,
                      offerPrice:
                          controller.acceptedOffers[index].amount.toString(),
                      discountPrice:
                          controller.acceptedOffers[index].post!.price!,
                      menuItem: SharedPrefController().type == 1
                          ? [
                              AppPopupMenuItem(
                                value: 1,
                                iconAsset: IconsApp.chatting,
                                title: context.localizations.contact,
                                iconColor: ColorResource.green,
                              ),
                            ]
                          : [
                              // AppPopupMenuItem(
                              //   value: 1,
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
                            Get.to(() => ChatScreen(comeFrom: "", chatId: 0,));
                            // SharedPrefController().type == 1
                            //     ? controller.acceptOffer(
                            //         postId:
                            //             controller.acceptedOffers[index].id!)
                            //     : "controller.destroyOffer(postId: controller.acceptedOffers[index].id!)";
                            break;
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
