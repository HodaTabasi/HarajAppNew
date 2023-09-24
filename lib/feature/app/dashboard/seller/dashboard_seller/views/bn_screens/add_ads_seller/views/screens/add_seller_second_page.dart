part of add_ads_seller_view;

class AddSellerSecondPage extends StatefulWidget {
  const AddSellerSecondPage({super.key});

  @override
  State<AddSellerSecondPage> createState() => _AddSellerSecondPageState();
}

class _AddSellerSecondPageState extends State<AddSellerSecondPage> {
  List<int> selectedRowIndices = [-1, -1, -1, -1]; //map
  final AddAdsSellerController addAdsSellerController =
  Get.find<AddAdsSellerController>();

  void selectRow(String key, GeneralModel index) {
    setState(() {
      addAdsSellerController.selectedData[key] = index;
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
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row( //list of General Model horizantel
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: addAdsSellerController.carProperties.gears!.map((e){
                return AppSelectableContainer(
                  isSelected: addAdsSellerController.selectedData['gears']!.id == e.id,
                  onTap: () => selectRow('gear_id', e),
                  label: e.name!,
                );
              } ).toList()
            ),
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
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row( //list of General Model horizantel
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: addAdsSellerController.carProperties.drivingSides!.map((e){
                  return AppSelectableContainer(
                    isSelected: addAdsSellerController.selectedData['driving-sides']!.id == e.id,
                    onTap: () => selectRow('driving_side_id', e),
                    label: e.name!,
                  );
                } ).toList()
            ),
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
                isSelected: addAdsSellerController.selectedData['seller_type']!.id == 1,
                onTap: () => selectRow('seller_type', GeneralModel(id: 1)),
                label: context.localizations.agent,
              ),
              AppSelectableContainer(
                isSelected: addAdsSellerController.selectedData['seller_type']!.id == 2 ,
                onTap: () => selectRow("seller_type", GeneralModel(id: 2)),
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
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row( //list of General Model horizantel
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: addAdsSellerController.carProperties.technicalAdvantages!.map((e){
                  return AppSelectableContainer(
                    isSelected: addAdsSellerController.selectedData['technical-advantages']!.id == e.id,
                    onTap: () => selectRow('technical_advantage_id', e),
                    label: e.name!,
                  );
                } ).toList()
            ),
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
                      title: "seat_id",
                      logo: "",
                        list: addAdsSellerController.carProperties.seats ?? []
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
                      title: "cylinder_id",
                      logo: "",
                        list: addAdsSellerController.carProperties.cylinders ?? []
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
                      title: "door_id",
                      logo: "",
                        list: addAdsSellerController.carProperties.doors ??[]
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
