part of home_buyer_view;

class ShowAds extends StatefulWidget {
  const ShowAds({super.key});

  @override
  State<ShowAds> createState() => _ShowAdsState();
}

class _ShowAdsState extends State<ShowAds> {
  final HomeBuyerController controller = Get.put(HomeBuyerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.ads.isNotEmpty) {
        return GridView.builder(
          controller: controller.scrollController,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 4.h),
          itemCount: controller.ads.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 17.h, // Add spacing between grid items.
            crossAxisSpacing: 15.w, // Add spacing between grid items.
            childAspectRatio: 160.w / 291.h, // Width on Height
          ),
          itemBuilder: (BuildContext context, int index) {
            if (controller.ads[index].status == true &&
                controller.ads[index].sold == false) {
              return InkWell(
                onTap: () {
                  Get.to(() =>
                      AdsDetailScreen(productId: controller.ads[index].id!));
                },
                child: AppAdsCarContainer(
                  nameCar: controller.ads[index].car!.name!,
                  imageCar: controller.ads[index].gallery!.first.image!,
                  priceCar: controller.ads[index].price!,
                  conditionCar: controller.ads[index].mechanicalStatus!.name!,
                  imageSeller: controller.ads[index].store!.avatar!,
                  sellerName: controller.ads[index].sellerType!.name!,
                  nameLocation:
                      controller.ads[index].store!.address!.governorate!.name!,
                  isFavorite: controller.ads[index].isFavorite!,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      } else {
        return Center(
          child: Text('No data'),
        );
      }
    });
  }
}
