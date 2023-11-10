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
      child: Obx(() {
          return Column(
            children: [
              AddComponent(
                title: addAdsSellerController.selectedData["brand_id"]!.name ??context.localizations.trade_mark,
                image: IconsApp.tradeMark,
                onPressed: () {
                  Get.bottomSheet(
                      AppBottomSheet(
                        body: BottomSheetBody(
                          index: 10,
                          headerTitle: context.localizations.select_trade_mark,
                          title: "brand_id",
                          list: addAdsSellerController.carProperties.brands ?? [],
                          logo: "",
                        ),
                        height: 500.h,
                      ),
                      enterBottomSheetDuration: const Duration(milliseconds: 500),
                      exitBottomSheetDuration: const Duration(milliseconds: 400));
                },
              ),
              if(AddAdsSellerController.to.selectedData['brand_id']?.id != null)
                SizedBox(height: 24.h),
              if( AddAdsSellerController.to.selectedData['brand_id']?.id != null)
              AddComponent(
                title: addAdsSellerController.selectedData["car_id"]!.name ?? context.localizations.car_name,
                image: IconsApp.carName,
                onPressed: () {
                  Get.bottomSheet(
                      AppBottomSheet(
                        body: BottomSheetBody(
                          index: 10,
                          //TODO: Make Lang Here
                          headerTitle: "حدد اسم السيارة",
                          title: "car_id",
                          logo: "",
                          list: addAdsSellerController.carProperties.brands?.firstWhere((element) =>
                          element.id == AddAdsSellerController.to.selectedData['brand_id']?.id).cars ?? [],
                        ),
                        height: 500.h,
                      ),
                      enterBottomSheetDuration: const Duration(milliseconds: 500),
                      exitBottomSheetDuration: const Duration(milliseconds: 400));
                },
              ),
              SizedBox(height: 24.h),
              AddComponent(
                title: addAdsSellerController.selectedData["body_id"]!.name ?? context.localizations.body_type,
                image: IconsApp.carBody,
                onPressed: () {
                  Get.bottomSheet(
                      AppBottomSheet(
                        body: BottomSheetBody(
                          index: 5,
                          //TODO: Make Lang Here
                          headerTitle: "حدد نوع جسم السيارة",
                          title: "body_id",
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
                title: addAdsSellerController.selectedData["mechanical_status_id"]!.name ?? context.localizations.mechanical_condition,
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
                          title: "mechanical_status_id",
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
                title: addAdsSellerController.selectedData["standard_id"]!.name ?? context.localizations.regional_specifications,
                image: IconsApp.regionalSpecifications,
                onPressed: () {
                  Get.bottomSheet(
                      AppBottomSheet(
                        body: BottomSheetBody(
                          index: 5,
                          //TODO: Make Lang Here
                          headerTitle: "حدد المواصفات الاقليمية",
                          title: "standard_id",
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
                title: addAdsSellerController.selectedData["general_status_id"]!.name ?? "حالة السيارة",
                image: IconsApp.carStatus,
                onPressed: () {
                  Get.bottomSheet(
                      AppBottomSheet(
                        body: BottomSheetBody(
                          index: 5,
                          //TODO: Make Lang Here
                          headerTitle: "حدد حالة السيارة",
                          title: "general_status_id",
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
                title: addAdsSellerController.selectedData["fuel_id"]!.name ??context.localizations.fuel_type,
                image: IconsApp.fuelType,
                onPressed: () {
                  Get.bottomSheet(
                      AppBottomSheet(
                        body: BottomSheetBody(
                          index: 3,
                          headerTitle: context.localizations.select_fuel_type,
                          //TODO: Make Lang Here
                          title: "fuel_id",
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
          );
        }
      ),
    );
  }
}
