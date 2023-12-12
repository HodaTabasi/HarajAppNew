part of search_buyer_view;

class SearchBuyerComponent extends StatefulWidget {
  const SearchBuyerComponent({super.key});

  @override
  State<SearchBuyerComponent> createState() => _SearchBuyerComponentState();
}

class _SearchBuyerComponentState extends State<SearchBuyerComponent> {
  final SearchBuyerController searchController =
  Get.find<SearchBuyerController>();

  final AddAddressSellerController addAddressSellerController =
  Get.find<AddAddressSellerController>();


  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: Obx(()=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: context.localizations.search_car,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorResource.gray,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 15.h),
          AppContainerOpenBottomSheet(
            title: searchController.brandId.value == 0 ?context.localizations.car_model :
            searchController.carProperties.brands!.firstWhere((element) =>
            element.id ==searchController.brandId.value).name ?? "",
            image: IconsApp.carName,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 10,
                      headerTitle: context.localizations.select_car_model,
                      title: "بي ام دبليواكس 6",
                      logo: ImagesApp.brandLogo,
                      //showCheckbox: true,
                      list: searchController.carProperties.brands ?? [],
                      isForBrand: true,
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          AppContainerOpenBottomSheet(
            title: searchController.governorateId.value == 0 ?context.localizations.emirate :
            addAddressSellerController.emirates.firstWhere((element) =>
            element.id ==searchController.governorateId.value).name ?? "",
            image: IconsApp.city,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBodyGovernorates(
                      index: 5,
                      headerTitle: context.localizations.select_governorate,
                      title: "ابو ظبي",
                      logo: "",
                      list: addAddressSellerController.emirates ?? [],
                      //showCheckbox: false,
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          if(searchController.selectedCities.isNotEmpty)
          Column(
            children: [
              AppContainerOpenBottomSheet(
                title: searchController.cityId.value == 0 ?context.localizations.city :
                searchController.selectedCities.firstWhere((element) =>
                element.id ==searchController.cityId.value).name ?? "",
                image: IconsApp.city,
                onPressed: () {
                  Get.bottomSheet(
                      AppBottomSheet(
                        body: BottomSheetBodyCities(
                          index: 5,
                          headerTitle: context.localizations.select_city,
                          title: "ابو ظبي",
                          logo: "",
                          list: searchController.selectedCities,
                          //showCheckbox: false,
                        ),
                        height: 500.h,
                      ),
                      enterBottomSheetDuration: const Duration(milliseconds: 500),
                      exitBottomSheetDuration: const Duration(milliseconds: 400));
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
          AppContainerOpenBottomSheet(
            title: searchController.fuelId.value == 0 ?context.localizations.fuel_type :
            searchController.carProperties.fuels!.firstWhere((element) =>
            element.id ==searchController.fuelId.value).name ?? "",
            image: IconsApp.fuelType,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 3,
                      headerTitle: context.localizations.select_fuel_type,
                      //TODO: Make Lang Here
                      title: "بنزين",
                      logo: "",
                      list: searchController.carProperties.fuels ?? [],
                      isForBrand: false,
                      //showCheckbox: true,
                    ),
                    height: 350.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          Obx(() => searchController.loading.value?const Center(child: CircularProgressIndicator()):
          DoneButton(
            title: context.localizations.search,
            onPressed: ()  {
              searchController.showNoResultBtn.value = true;
              searchController.getIndexAds().then((value) => Get.to(() => const SearchResultBuyerScreen()));
            },
          ),),
          SizedBox(height: 15.h),
          DoneButton(
            title: context.localizations.clear_filter_lbl,
            onPressed: ()  {
             searchController.clearFilters();
            },
          )
        ],
      )),
    );
  }
}
