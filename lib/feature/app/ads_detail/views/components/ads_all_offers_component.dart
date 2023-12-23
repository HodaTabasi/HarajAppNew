part of ads_detail_buyer_view;

class AdsAllOffersComponent extends StatefulWidget {
  const AdsAllOffersComponent({super.key, required this.id});

  final int id;

  @override
  State<AdsAllOffersComponent> createState() => _AdsAllOffersComponentState();
}

class _AdsAllOffersComponentState extends State<AdsAllOffersComponent> {
  late AdsDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailController(productId: widget.id));
  }

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
                text:
                    "${context.localizations.offers_submitted} (${controller.selectedMenuItem == 1 ? controller.allOffers.length : controller.newOffers.length})",
                color: ColorResource.mainFontColor,
              ),
              AppPopupMenuButton(
                menuItems: [
                  AppPopupMenuItem(
                    value: 1,
                    title: context.localizations.all_offers,
                    iconColor: ColorResource.mainColor,
                  ),
                  // AppPopupMenuItem(
                  //   value: 2,
                  //   title: context.localizations.new_offers,
                  //   iconColor: ColorResource.red,
                  // ),
                ],
                onSelected: (value) {
                  // Handle selection for this usage
                  debugPrint('Selected value:💯 $value');
                  setState(() {
                    controller.selectedMenuItem = value;
                  });
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
            child: buildListView(controller
                .selectedMenuItem), // Use a function to build the ListView
          ),
        ],
      ),
    );
  }

  Widget buildListView(int selectedItem) {
    switch (selectedItem) {
      case 1:
        // Return the ListView for "all_offers"
        return Obx(()=>ListView.builder(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.allOffers.length,
          itemBuilder: (context, index) {
            return AllOffersCard(
              name: controller.allOffers[index].client!.name!,
              price: controller.allOffers[index].amount.toString(),
              image: controller.allOffers[index].client!.avatar ??
                  ImagesApp.brandLogo,
              posting: controller.allOffers[index].createdAt!,
              status: controller.allOffers[index].status!,
              crossOnTab: () {
                debugPrint(" crossOnTab 💯");
                controller.rejectOffer(postId: controller.allOffers[index].id!);
              },
              checkOnTab: () {
                debugPrint(" checkOnTab 💯");
                controller.acceptOffer(postId: controller.allOffers[index].id!);
              },
              openChat: () {
                if (controller.allOffers[index].status! == 3) {
                  Get.to(() =>
                      ChatScreen(
                        chatId: 0, //TODO check API if there is a running chat already
                        post: PostModel(
                          id: controller.adsDetail.value.id,
                          createdAt: controller.adsDetail.value.createdAt,
                          gallery: controller.adsDetail.value.gallery,
                          brand: GeneralModel(
                            name: controller.adsDetail.value.brand?.name,
                          ),
                          car: GeneralModel(
                            name: controller.adsDetail.value.car?.name,
                          ),
                          generalStatus: GeneralModel(
                            name: controller.adsDetail.value.generalStatus?.name,
                          ),
                          year: controller.adsDetail.value.year,
                          price: controller.adsDetail.value.price,

                        ),
                        otherUser:ClientModel(
                          id: controller.adsDetail.value.sellerId,
                          name: controller.adsDetail.value.store?.name,
                          avatar: controller.adsDetail.value.store?.avatar,
                        ),
                        // post: message.post,
                      ));
                }
              },
            );
          },
        ));
      case 2:
        // Return the ListView for "new_offers"
        return ListView.builder(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.newOffers.length,
          itemBuilder: (context, index) {
            return AllOffersCard(
              name: controller.newOffers[index].client!.name!,
              price: controller.newOffers[index].amount.toString(),
              image: controller.newOffers[index].client!.avatar ??
                  ImagesApp.brandLogo,
              posting: controller.newOffers[index].createdAt!,
              // status: controller.allOffers[index].status!,
              status: 1,
              crossOnTab: () {},
              checkOnTab: () {},
              openChat: () {},
            );
          },
        );
      default:
        return const SizedBox(); // Default case, return an empty container
    }
  }
}
