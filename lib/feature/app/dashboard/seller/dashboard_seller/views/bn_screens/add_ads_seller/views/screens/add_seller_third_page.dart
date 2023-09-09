part of add_ads_seller_view;

class AddSellerThirdPage extends GetView<AddAdsSellerController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppTextFomField(
            focusNode: FocusNode(),
            textController: controller.carPriceController,
            textInputType: TextInputType.number,
            title: context.localizations.car_price,
            radius: 6.r,
            prefixIcon: IconsApp.carPrice,
            errorTitle: '',
            type: 'car price',
          ),
          AppTextFomField(
            focusNode: FocusNode(),
            textController: controller.kilometerController,
            textInputType: TextInputType.number,
            title: context.localizations.km_travel,
            radius: 6.r,
            prefixIcon: IconsApp.carSpeed,
            errorTitle: '',
            type: 'kilo meeter',
          ),
          AddComponent(
            title: context.localizations.vehicle_class,
            image: IconsApp.carCategory,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 10,
                      headerTitle: context.localizations.select_trade_mark,
                      title: "بي ام دبليو",
                      logo: ImagesApp.brandLogo,
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          Obx(() {
            return AddComponent(
              title: controller.title.value,
              // title: context.localizations.production_year,
              image: IconsApp.yearOfManufacture,
              onPressed: () {
                // Call the selectDate function with the context.
                controller.selectDate();
              },
            );
          }),
          SizedBox(height: 24.h),
          AddComponent(
            title: context.localizations.engine_power,
            image: IconsApp.enginePower,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle: "حدد قوة المحرك",
                      title: "600 حصان",
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
            title: context.localizations.exterior_color,
            image: IconsApp.carColorOutside,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle: "حدد لون السيارة الخارجي",
                      title: "بنفتحي",
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
            title: context.localizations.inner_color,
            image: IconsApp.carColorInside,
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBody(
                      index: 5,
                      //TODO: Make Lang Here
                      headerTitle: "حدد لون السيارة الداخلي",
                      title: "ازرق",
                      logo: "",
                    ),
                    height: 500.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 24.h),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CustomeTextFiled(
                textEditingController: controller.carPriceController,
                //TODO: Make Lang Here
                hintText: 'معلومات اضافية',
                radius: 10.r,
                fontColor: ColorResource.gray,
                fontSize: 18.sp,
                maxLine: 4,
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: InkWell(
                  onTap: () {
                    Get.dialog(AlertDialog());
                  },
                  child: AppSvgPicture(
                    assetName: IconsApp.info,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
