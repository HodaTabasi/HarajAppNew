part of search_buyer_view;

class SearchBuyerComponent extends StatefulWidget {
  const SearchBuyerComponent({super.key});

  @override
  State<SearchBuyerComponent> createState() => _SearchBuyerComponentState();
}

class _SearchBuyerComponentState extends State<SearchBuyerComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: Column(
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
            title: context.localizations.car_model,
            image: IconsApp.carName,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 10,
                      headerTitle: context.localizations.select_car_model,
                      title: "بي ام دبليواكس 6",
                      logo: ImagesApp.brandLogo,
                      showCheckbox: true,
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          AppContainerOpenBottomSheet(
            title: context.localizations.city,
            image: IconsApp.city,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      headerTitle: context.localizations.select_city,
                      title: "ابو ظبي",
                      logo: "",
                      showCheckbox: false,
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          AppContainerOpenBottomSheet(
            title: context.localizations.fuel_type,
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
                      showCheckbox: true,
                    ),
                    height: 350.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          DoneButton(
            title: context.localizations.search,
            onPressed: () {
              Get.to(() => const SearchResultBuyerScreen());
            },
          ),
        ],
      ),
    );
  }
}
