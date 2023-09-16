part of ads_detail_buyer_view;

class HeaderTitle extends StatefulWidget {
  const HeaderTitle({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<HeaderTitle> createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  late AdsDetailBuyerController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailBuyerController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              color: ColorResource.mainFontColor,
              text: controller.adsDetail.car!.name!,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            AppText(
              color: ColorResource.mainColor,
              text: controller.adsDetail.price!,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: OfferCard(
                name: controller.adsDetail.store!.name!,
                subName: controller.adsDetail.store!.description!,
                image: controller.adsDetail.store!.avatar!,
                posting: controller.adsDetail.createdAt!,
                onTab: () {
                  Get.to(() => GalleryBuyerScreen(
                        storeId: controller.adsDetail.store!.id!,
                      ));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
