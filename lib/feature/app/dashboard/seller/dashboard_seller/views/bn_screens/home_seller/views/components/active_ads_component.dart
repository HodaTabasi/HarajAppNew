part of home_seller_view;

class ActiveAdsComponent extends StatefulWidget {
  const ActiveAdsComponent({super.key});

  @override
  State<ActiveAdsComponent> createState() => _ActiveAdsComponentState();
}

class _ActiveAdsComponentState extends State<ActiveAdsComponent> {
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
                  '${controller.searchAdsList.length} ${context.localizations.ad}',
              lineColor: ColorResource.gray,
            ),
            Expanded(
              child: ListView.builder(
                controller: controller.scrollController,
                shrinkWrap: true,
                itemCount: controller.searchAdsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => AdsDetailScreen(
                            productId: controller.searchAdsList[index].id!,
                          ));
                    },
                    child: AppCarContainer(
                      nameCar: controller.searchAdsList[index].car!.name!,
                      imageCar:
                          controller.searchAdsList[index].gallery!.first.image!,
                      priceCar: controller.searchAdsList[index].price!,
                      conditionCar: controller
                          .searchAdsList[index].mechanicalStatus!.name!,
                      showCar: '4K زائر',
                      showStatus: true,
                      postingTime: controller.searchAdsList[index].createdAt!,
                      isSold: controller.searchAdsList[index].sold!,
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
      } else {
        return Center(
          child: Text('No data'),
        );
      }
    });
  }
}
