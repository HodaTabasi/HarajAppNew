part of add_ads_seller_view;

class AddSellerFirstPage extends StatefulWidget {
  const AddSellerFirstPage({super.key});

  @override
  State<AddSellerFirstPage> createState() => _AddSellerFirstPageState();
}

class _AddSellerFirstPageState extends State<AddSellerFirstPage> {
  final AddAdsSellerController addAdsSellerController =
  Get.find<AddAdsSellerController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AddComponent(
            title: context.localizations.trade_mark,
            image: IconsApp.tradeMark,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 10,
                      headerTitle: context.localizations.select_trade_mark,
                      title: "brands",
                      list: addAdsSellerController.carProperties.brands ?? [],
                      logo: "",
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          AddComponent(
            title: context.localizations.car_name,
            image: IconsApp.carName,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 10,
                      //TODO: Make Lang Here
                      headerTitle: "حدد اسم السيارة",
                      title: "cars",
                      logo: "",
                      list: addAdsSellerController.carProperties.brands ?? [],
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          AddComponent(
            title: context.localizations.body_type,
            image: IconsApp.carBody,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle: "حدد نوع جسم السيارة",
                      title: "bodies",
                      logo: "",
                      list: addAdsSellerController.carProperties.bodies ?? []
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          AddComponent(
            title: context.localizations.mechanical_condition,
            image: IconsApp.carMechanic,
            onPressed: () {
              print(addAdsSellerController.carProperties.mechanicalStatuses);
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle:
                          context.localizations.select_mechanical_condition,
                      title: "mechanical-statuses",
                      logo: "",
                        list: addAdsSellerController.carProperties.mechanicalStatuses ?? []
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          AddComponent(
            title: context.localizations.regional_specifications,
            image: IconsApp.regionalSpecifications,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle: "حدد المواصفات الاقليمية",
                      title: "standards",
                      logo: "",
                        list: addAdsSellerController.carProperties.standards ?? []
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          AddComponent(
            //TODO:Make Lang here
            title: "حالة السيارة",
            image: IconsApp.carStatus,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle: "حدد حالة السيارة",
                      title: "general-statuses",
                      logo: "",
                      list: addAdsSellerController.carProperties.generalStatuses ??[]
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          AddComponent(
            title: context.localizations.fuel_type,
            image: IconsApp.fuelType,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 3,
                      headerTitle: context.localizations.select_fuel_type,
                      //TODO: Make Lang Here
                      title: "fuels",
                      logo: "",
                        list: addAdsSellerController.carProperties.fuels ??[]
                    ),
                    height: 350.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
        ],
      ),
    );
  }
}
