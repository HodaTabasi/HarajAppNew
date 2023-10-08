part of ads_detail_buyer_view;

class HeaderTitle extends StatefulWidget {
  const HeaderTitle({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<HeaderTitle> createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  late AdsDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailController(productId: widget.id));
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
              text: controller.adsDetail.value.car?.name ?? '',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            AppText(
              color: ColorResource.mainColor,
              text: controller.adsDetail.value.price!,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SharedPrefController().type == 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: ColorResource.gray,
                    size: 18.w,
                  ),
                  SizedBox(width: 5.w),
                  AppText(
                    //TODO:Make Lang here
                    color: ColorResource.gray,
                    text: 'وقت النشر :',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                  AppText(
                    color: ColorResource.gray,
                    text: controller.adsDetail.value.createdAt!,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: OfferCard(
                      name: controller.adsDetail.value.store!.name!,
                      subName: controller.adsDetail.value.store!.description!,
                      image: controller.adsDetail.value.store!.avatar!,
                      posting: controller.adsDetail.value.createdAt!,
                      onTab: () {
                        Get.to(() => GalleryBuyerScreen(
                              storeId: controller.adsDetail.value.store!.id!,
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
