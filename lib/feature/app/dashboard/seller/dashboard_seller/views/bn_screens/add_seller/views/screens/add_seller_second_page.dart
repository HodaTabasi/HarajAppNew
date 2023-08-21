part of add_seller_view;

class AddSellerSecondPage extends StatefulWidget {
  const AddSellerSecondPage({super.key});

  @override
  State<AddSellerSecondPage> createState() => _AddSellerSecondPageState();
}

class _AddSellerSecondPageState extends State<AddSellerSecondPage> {
  List<int> selectedRowIndices = [-1, -1, -1, -1];

  void selectRow(int rowIndex, int index) {
    setState(() {
      selectedRowIndices[rowIndex] = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // carrier_type
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
            height: 24.h,
            color: ColorResource.gray,
            thickness: 1,
          ),
          // مميزات تقنية
          AppText(
            //TODO:Make Lang Here
            text: "مميزات تقنية",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorResource.mainFontColor,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: AppSelectableContainer(
                  isSelected: selectedRowIndices[3] == 0,
                  onTap: () => selectRow(3, 0),
                  label: context.localizations.front_drag,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: AppSelectableContainer(
                  isSelected: selectedRowIndices[3] == 1,
                  onTap: () => selectRow(3, 1),
                  label: context.localizations.rear_drag,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: AppSelectableContainer(
                  isSelected: selectedRowIndices[3] == 2,
                  onTap: () => selectRow(3, 2),
                  label: context.localizations.four_wheel_drive,
                ),
              ),
            ],
          ),
          AppDivider(
            height: 24.h,
            color: ColorResource.gray,
            thickness: 1,
          ),
          // seats_number
          AddComponent(
            title: context.localizations.seats_number,
            image: IconsApp.regionalSpecifications,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle: "حدد عدد المقاعد",
                      title: "8",
                      logo: "",
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          AppDivider(
            height: 24.h,
            color: ColorResource.gray,
            thickness: 1,
          ),
          // cylinders_number
          AddComponent(
            title: context.localizations.cylinders_number,
            image: IconsApp.regionalSpecifications,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle: "حدد عدد الاسطوانات",
                      title: "5",
                      logo: "",
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          AppDivider(
            height: 24.h,
            color: ColorResource.gray,
            thickness: 1,
          ),
          // doors_number
          AddComponent(
            title: context.localizations.doors_number,
            image: IconsApp.regionalSpecifications,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle: "حدد عدد الابواب",
                      title: "4",
                      logo: "",
                    ),
                    height: 500.h,
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
