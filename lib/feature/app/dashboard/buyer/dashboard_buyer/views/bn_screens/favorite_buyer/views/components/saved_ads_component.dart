part of favorite_buyer_view;

class SavedAdsComponent extends StatefulWidget {
  const SavedAdsComponent({super.key});

  @override
  State<SavedAdsComponent> createState() => _SavedAdsComponentState();
}

class _SavedAdsComponentState extends State<SavedAdsComponent> {
  final FavoriteBuyerController controller = Get.put(FavoriteBuyerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.savedAds.isNotEmpty) {
        return Column(
          children: [
            SizedBox(height: 10.h),
            RowDividerWidget(
              text: '${controller.savedAds.length} ${context.localizations.ad}',
              lineColor: ColorResource.gray,
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
                itemCount: controller.savedAds.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 17.h, // Add spacing between grid items.
                  crossAxisSpacing: 15.w, // Add spacing between grid items.
                  childAspectRatio: 160.w / 290.h, // Width on Height
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => AdsDetailScreen(
                            productId: controller.savedAds[index].id!,
                          ));
                    },
                    child: AppAdsCarContainer(
                      nameCar: controller.savedAds[index].car?.name ?? '',
                      gallery:
                          controller.savedAds[index].gallery,
                      priceCar: controller.savedAds[index].price!,
                      conditionCar:
                          controller.savedAds[index].mechanicalStatus!.name!,
                      imageSeller: /*controller.savedAds[index].store!.avatar ??*/
                          ImagesApp.brandLogo,
                      sellerName: /*controller.savedAds[index].store!.name!*/
                          "Store Name",
                      nameLocation: /*controller.savedAds[index].store!.address!.governorate!.name!*/
                          "Dubai",
                      isFavorite: controller.savedAds[index].isFavorite!,
                      FavoriteOnTap: () {
                        controller.postFavoriteAds(
                            adsId: controller.savedAds[index].id);
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
