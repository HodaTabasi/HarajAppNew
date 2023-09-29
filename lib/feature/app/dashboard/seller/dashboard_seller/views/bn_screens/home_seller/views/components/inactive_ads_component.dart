part of home_seller_view;

class InActiveAdsComponent extends StatefulWidget {
  const InActiveAdsComponent({super.key});

  @override
  State<InActiveAdsComponent> createState() => _InActiveAdsComponentState();
}

class _InActiveAdsComponentState extends State<InActiveAdsComponent> {
  final HomeSellerController controller = Get.put(HomeSellerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.searchAdsList.isNotEmpty) {
        return Column(
          children: [
            RowDividerWidget(
              text:
                  '${controller.searchAdsList.where((p0) => (p0.status == false)).toList().length} ${context.localizations.ad}',
              lineColor: ColorResource.gray,
            ),
            Expanded(
              child: ListView.builder(
                controller: controller.scrollController,
                shrinkWrap: true,
                itemCount: controller.searchAdsList.length,
                itemBuilder: (context, index) {
                  if (controller.searchAdsList[index].status == false) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => AdsDetailScreen(
                              productId: controller.searchAdsList[index].id!,
                            ));
                      },
                      child: AppCarContainer(
                        nameCar: controller.searchAdsList[index].car!.name!,
                        imageCar: controller
                            .searchAdsList[index].gallery!.first.image!,
                        priceCar: controller.searchAdsList[index].price!,
                        conditionCar: controller
                            .searchAdsList[index].mechanicalStatus!.name!,
                        //TODO:Make Lang Here
                        showCar:
                            '${controller.searchAdsList[index].viewsCount}زائر',
                        showStatus: true,
                        postingTime: controller.searchAdsList[index].createdAt!,
                        isSold: controller.searchAdsList[index].sold!,
                        menuItem: [
                          AppPopupMenuItem(
                            value: 1,
                            iconAsset: IconsApp.remove,
                            title: context.localizations.delete,
                            iconColor: ColorResource.red,
                          ),
                        ],
                        onSelected: (value) {
                          // Handle selection for this usage
                          debugPrint('Selected value:💯 $value');
                          controller.destroyPost(
                              adsId: controller.searchAdsList[index].id);
                        },
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
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
