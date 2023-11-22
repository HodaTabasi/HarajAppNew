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
                  '${controller.searchAdsList.where((p0) => (p0.status == true)).toList().length} ${context.localizations.ad}',
              lineColor: ColorResource.gray,
            ),
            Expanded(
              child: ListView.builder(
                controller: controller.scrollController,
                shrinkWrap: true,
                itemCount: controller.searchAdsList.length,
                itemBuilder: (context, index) {
                  if (controller.searchAdsList[index].status == true) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => AdsDetailScreen(
                              productId: controller.searchAdsList[index].id!,
                            ));
                      },
                      child: AppCarContainer(
                        nameCar: controller.searchAdsList[index].car?.name ??'',
                        gallery:controller.searchAdsList[index].gallery,
                        priceCar: controller.searchAdsList[index].price!,
                        conditionCar: controller
                            .searchAdsList[index].mechanicalStatus!.name!,
                        //TODO:Make Lang Here
                        showCar:
                            '${controller.searchAdsList[index].viewsCount}زائر',
                        showStatus: true,
                        postingTime: controller.searchAdsList[index].createdAt!,
                        isSold: controller.searchAdsList[index].sold!,
                        postId: controller.searchAdsList[index].id.toString(),
                        onSold: (postId) {
                          controller.soldPost(
                              postId: controller.searchAdsList[index].id);
                        },
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
                              Get.to(() => AddAdsSellerScreen());
                              break;
                            case 2:
                              controller.destroyPost(
                                  adsId: controller.searchAdsList[index].id);
                              break;
                            // Add more cases as needed
                          }
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
