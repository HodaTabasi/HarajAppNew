part of add_ads_seller_view;

class ShowPhoto extends StatefulWidget {
  const ShowPhoto({super.key});

  @override
  State<ShowPhoto> createState() => _ShowPhotoState();
}

class _ShowPhotoState extends State<ShowPhoto> {
  final ProfileSellerController controller = Get.find<ProfileSellerController>();

  @override
  Widget build(BuildContext context) {
    return controller.imageFileList!.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 4),
            itemCount: controller.imageFileList!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16.h, // Add spacing between grid items.
              crossAxisSpacing: 12.w, // Add spacing between grid items.
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: ColorResource.white,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                      color: ColorResource.lightGray,
                    )),
                child: Image.file(
                  File(controller.imageFileList![index].path),
                  fit: BoxFit.cover,
                ),
              );
            },
          )
        : Column(
            children: [
              SizedBox(height: 52.h),
              Center(
                child: AppSvgPicture(
                  assetName: IconsApp.image,
                  height: 120.h,
                  width: 120.w,
                ),
              ),
              SizedBox(height: 29.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: AppText(
                  text: context.localizations.must_add_images,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorResource.gray,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 65.h),
            ],
          );

    // return controller.photoFile.value != null
    //     ? Container(
    //   height: 88.h,
    //   width: 88.w,
    //   clipBehavior: Clip.antiAliasWithSaveLayer,
    //   margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(5.r),
    //     color: ColorResource.white,
    //     border: Border.all(color: ColorResource.lightGray),
    //   ),
    //   child: Image.file(
    //     controller.photoFile.value!,
    //     fit: BoxFit.cover,
    //   ),
    // )
    //     : Column(
    //   children: [
    //     Center(
    //       child: AppSvgPicture(
    //         assetName: IconsApp.image,
    //         height: 120.h,
    //         width: 120.w,
    //       ),
    //     ),
    //     SizedBox(height: 29.h),
    //     Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 32.w),
    //       child: AppText(
    //         text: context.localizations.must_add_images,
    //         fontSize: 14.sp,
    //         fontWeight: FontWeight.w400,
    //         color: ColorResource.gray,
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   ],
    // );
  }
}
