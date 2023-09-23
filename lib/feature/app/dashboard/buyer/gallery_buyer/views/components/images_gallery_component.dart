part of gallery_buyer_view;

class ImagesGalleryComponent extends StatefulWidget {
  const ImagesGalleryComponent({super.key, required this.id});
  final int id;

  @override
  State<ImagesGalleryComponent> createState() => _ImagesGalleryComponentState();
}

class _ImagesGalleryComponentState extends State<ImagesGalleryComponent> {
  late AdsDetailController adsDetailController;

  @override
  void initState() {
    super.initState();
    adsDetailController = Get.put(AdsDetailController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: adsDetailController.adsDetail.store!.gallery!.length,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      itemBuilder: (context, index) {
        return Container(
          height: 234.h,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.only(bottom: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.white,
            border: Border.all(color: ColorResource.shadeGrey, width: 1.w),
          ),
          child: Image.network(
            adsDetailController.adsDetail.store!.gallery![index].image!,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
