part of complete_profile_buyer_view;

class InputField extends GetView<CompleteProfileBuyerController> {
  CompleteProfileBuyerController completeProfileBuyerController =
      Get.put(CompleteProfileBuyerController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFomField(
            textController: controller.nameController,
            textInputType: TextInputType.name,
            title: context.localizations.real_name,
            radius: 6.r,
            prefixIcon: IconsApp.person,
            focusNode: FocusNode(),
            errorTitle: GeneralGetxController.to.emailErrorText.value,
            type: 'name',
          ),
          SizedBox(height: 20.h),
          Obx(() {
            return AppTextFomField(
              textController: controller.phoneController,
              textInputType: TextInputType.phone,
              title: context.localizations.official_phone_number,
              radius: 6.r,
              prefixIcon: IconsApp.mobile,
              secure:
                  controller.isVisibility.value, // Toggle the secure property
              focusNode: FocusNode(),
              errorTitle: GeneralGetxController.to.passwordErrorText.value,
              type: 'phone',
            );
          }),
        ],
      ),
    );
  }
}
