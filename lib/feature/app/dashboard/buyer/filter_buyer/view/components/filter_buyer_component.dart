part of filter_buyer_view;

class FilterBuyerComponent extends StatefulWidget {
  const FilterBuyerComponent({super.key});

  @override
  State<FilterBuyerComponent> createState() => _FilterBuyerComponentState();
}

class _FilterBuyerComponentState extends State<FilterBuyerComponent> {
  final FilterBuyerController controller = Get.put(FilterBuyerController());

  List<int> selectedRowIndices = [-1, -1, -1, -1];

  void selectRow(int rowIndex, int index) {
    setState(() {
      selectedRowIndices[rowIndex] = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        AppContainerOpenBottomSheet(
          title: context.localizations.mechanical_condition,
          image: IconsApp.carMechanic,
          onPressed: () {
            Get.bottomSheet(
                AppBottomSheet(
                  body: BottomSheetBody(
                    index: 5,
                    //TODO: Make Lang Here
                    headerTitle:
                        context.localizations.select_mechanical_condition,
                    title: "ممتازة",
                    logo: "",
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
          title: controller.title.value,
          // title: context.localizations.regional_specifications,
          image: IconsApp.yearOfManufacture,
          onPressed: () {
            // Call the selectDate function with the context.
            controller.selectDate();
          },
        ),
        AppDivider(
          height: 34.h,
          color: ColorResource.gray,
          thickness: 1,
        ),
        AppText(
          text: context.localizations.carrier_type,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorResource.mainFontColor,
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppSelectableContainer(
              isSelected: selectedRowIndices[0] == 0,
              onTap: () => selectRow(0, 0),
              label: context.localizations.automatic,
            ),
            AppSelectableContainer(
              isSelected: selectedRowIndices[0] == 1,
              onTap: () => selectRow(0, 1),
              label: context.localizations.manual,
            ),
          ],
        ),
        AppDivider(
          height: 24.h,
          color: ColorResource.gray,
          thickness: 1,
        ),
        // driving_hand
        AppText(
          text: context.localizations.driving_hand,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorResource.mainFontColor,
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppSelectableContainer(
              isSelected: selectedRowIndices[1] == 0,
              onTap: () => selectRow(1, 0),
              label: context.localizations.right_side,
            ),
            AppSelectableContainer(
              isSelected: selectedRowIndices[1] == 1,
              onTap: () => selectRow(1, 1),
              label: context.localizations.left_side,
            ),
          ],
        ),
        AppDivider(
          height: 24.h,
          color: ColorResource.gray,
          thickness: 1,
        ),
        // seller_type
        AppText(
          text: context.localizations.seller_type,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorResource.mainFontColor,
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppSelectableContainer(
              isSelected: selectedRowIndices[2] == 0,
              onTap: () => selectRow(2, 0),
              label: context.localizations.agent,
            ),
            AppSelectableContainer(
              isSelected: selectedRowIndices[2] == 1,
              onTap: () => selectRow(2, 1),
              label: context.localizations.car_owner,
            ),
          ],
        ),
        AppDivider(
          height: 34.h,
          color: ColorResource.gray,
          thickness: 1,
        ),
        AppContainerOpenBottomSheet(
          title: context.localizations.fuel_consumption_rate,
          image: IconsApp.carName,
          onPressed: () {
            Get.bottomSheet(
                AppBottomSheet(
                  body: BottomSheetBody(
                    index: 10,
                    headerTitle: context.localizations.select_car_model,
                    title: "120",
                    logo: '',
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
          title: context.localizations.km,
          image: IconsApp.carSpeed,
          onPressed: () {
            Get.bottomSheet(
                AppBottomSheet(
                  body: BottomSheetBody(
                    index: 5,
                    headerTitle: context.localizations.km,
                    title: "25000",
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
          title: context.localizations.engine_power,
          image: IconsApp.enginePower,
          onPressed: () {
            Get.bottomSheet(
                AppBottomSheet(
                  body: BottomSheetBody(
                    index: 3,
                    headerTitle: context.localizations.engine_power,
                    //TODO: Make Lang Here
                    title: "600",
                    logo: "",
                    showCheckbox: false,
                  ),
                  height: 350.h,
                ),
                enterBottomSheetDuration: const Duration(milliseconds: 500),
                exitBottomSheetDuration: const Duration(milliseconds: 400));
          },
        ),
        AppDivider(
          height: 50.h,
          color: ColorResource.gray,
          thickness: 1,
        ),
        Row(
          children: [
            Expanded(
                child: DoneButton(
                    title: context.localizations.view, onPressed: () {})),
            SizedBox(height: 100.h),
            Expanded(
                child: DoneButton(
                    title: context.localizations.defaults, onPressed: () {})),
          ],
        )
      ],
    );
  }
}
