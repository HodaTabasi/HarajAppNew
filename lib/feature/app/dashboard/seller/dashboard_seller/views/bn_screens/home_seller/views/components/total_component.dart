part of home_seller_view;

class TotalComponent extends StatefulWidget {
  const TotalComponent({super.key});

  @override
  State<TotalComponent> createState() => _TotalComponentState();
}

class _TotalComponentState extends State<TotalComponent> {
  final HomeSellerController controller = Get.put(HomeSellerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.loading.value == true
          ? const CircularProgressIndicator(color: ColorResource.transparent)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    TotalAds(),
                  ],
                ),
                Column(
                  children: [
                    const TotalViews(),
                    SizedBox(height: 16.h),
                    const SubscriptionRenewal(),
                  ],
                ),
              ],
            );
    });
  }
}
