part of gallery_buyer_view;

class AdsGalleryComponent extends StatefulWidget {
  const AdsGalleryComponent({super.key, required this.id});
  final int id;

  @override
  State<AdsGalleryComponent> createState() => _AdsGalleryComponentState();
}

class _AdsGalleryComponentState extends State<AdsGalleryComponent> {
  late GalleryBuyerController galleryBuyerController;
  late AdsDetailBuyerController adsDetailBuyerController;

  @override
  void initState() {
    super.initState();
    galleryBuyerController =
        Get.put(GalleryBuyerController(storeId: widget.id));
    adsDetailBuyerController =
        Get.put(AdsDetailBuyerController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          RowDividerWidget(
            text:
                '${galleryBuyerController.storePost.length} ${context.localizations.ad}',
            lineColor: ColorResource.gray,
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsetsDirectional.symmetric(vertical: 16.h),
              itemCount: galleryBuyerController.storePost.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 17.h, // Add spacing between grid items.
                crossAxisSpacing: 15.w, // Add spacing between grid items.
                childAspectRatio: 160.w / 281.h, // Width on Height
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => AdsDetailBuyerScreen(
                          productId:
                              galleryBuyerController.storePost[index].id!,
                        ));
                  },
                  child: AppAdsCarContainer(
                    nameCar: galleryBuyerController.storePost[index].car!.name!,
                    imageCar: galleryBuyerController
                        .storePost[index].gallery!.first.image!,
                    priceCar: galleryBuyerController.storePost[index].price!,
                    conditionCar: galleryBuyerController
                        .storePost[index].mechanicalStatus!.name!,
                    imageSeller: adsDetailBuyerController.adsDetail.store!.avatar!,
                    sellerName: adsDetailBuyerController.adsDetail.store!.name!,
                    nameLocation: adsDetailBuyerController
                        .adsDetail.store!.address!.governorate!.name!,
                    isFavorite:
                        galleryBuyerController.storePost[index].isFavorite!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
