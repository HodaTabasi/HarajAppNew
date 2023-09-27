part of ads_detail_buyer_view;

class AppActions extends StatefulWidget {
  const AppActions({super.key, required this.id});
  final int id;

  @override
  State<AppActions> createState() => _AppActionsState();
}

class _AppActionsState extends State<AppActions> {
  late AdsDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.loading.value
          ? const Center(
              child:
                  CircularProgressIndicator(color: ColorResource.transparent),
            )
          : InkWell(
              onTap: () {
                print("i am here");
                print(
                    "${controller.adsDetail.isFavorite} || ${controller.favorite.isFavorite}");
                // controller.postFavoriteAds(adsId: widget.id);
                SharedPrefController().type == 1
                    ? Get.bottomSheet(
                        AppBottomSheet(
                          body: BottomSheetBodyOffers(),
                          height: 280.h,
                        ),
                        enterBottomSheetDuration:
                            const Duration(milliseconds: 500),
                        exitBottomSheetDuration:
                            const Duration(milliseconds: 400))
                    : controller.adsDetail.isFavorite == true
                        ? IconsApp.favoriteFill
                        : IconsApp.favoriteOutline;
              },
              child: AppSvgPicture(
                assetName: SharedPrefController().type == 1
                    ? IconsApp.edit
                    : controller.adsDetail.isFavorite == true
                        ? IconsApp.favoriteFill
                        : IconsApp.favoriteOutline,
                width: 16.w,
                height: 16.h,
                color: SharedPrefController().type == 1
                    ? ColorResource.mainColor
                    : controller.adsDetail.isFavorite == true
                        ? ColorResource.mainColor
                        : ColorResource.gray,
              ),
            );
    });
  }
}
