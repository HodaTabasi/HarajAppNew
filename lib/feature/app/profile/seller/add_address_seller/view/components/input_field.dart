part of add_address_seller_view;

class InputField extends GetView<AddAddressSellerController> {
  AddAddressSellerController addAddressSellerController =
      Get.put(AddAddressSellerController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddressComponent(
            title: context.localizations.emirate,
            image: IconsApp.emirate,
            onPressed: () {
              addAddressSellerController.toggleList('emirate');
              Get.bottomSheet(
                  BottomSheet(
                    title: context.localizations.select_princedom,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 15.h),
          AddressComponent(
            title: context.localizations.city,
            image: IconsApp.city,
            onPressed: () {
              addAddressSellerController.toggleList('city');
              Get.bottomSheet(
                  BottomSheet(
                    title: context.localizations.select_city,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
          SizedBox(height: 15.h),
          AddressComponent(
            title: context.localizations.location,
            image: IconsApp.location,
            onPressed: () {
              Get.to(() => MapScreen());
            },
          ),
          SizedBox(height: 15.h),
          AppTextFomField(
            textController: controller.nameStreetController,
            textInputType: TextInputType.name,
            title: context.localizations.street_name,
            radius: 6.r,
            prefixIcon: IconsApp.street,
            focusNode: FocusNode(),
            errorTitle: GeneralGetxController.to.emailErrorText.value,
            type: 'nameStreet',
          ),
          AppTextFomField(
            textController: controller.buildNumberController,
            textInputType: TextInputType.number,
            title: context.localizations.building_number,
            radius: 6.r,
            prefixIcon: IconsApp.buildingNumber,
            focusNode: FocusNode(),
            errorTitle: GeneralGetxController.to.passwordErrorText.value,
            type: 'buildNumber',
          ),
          AppTextFomField(
            textController: controller.postalCodeController,
            textInputType: TextInputType.number,
            title: context.localizations.postal_code,
            radius: 6.r,
            prefixIcon: IconsApp.postalCode,
            focusNode: FocusNode(),
            errorTitle: GeneralGetxController.to.emailErrorText.value,
            type: 'postalCode',
          ),
        ],
      ),
    );
  }
}
