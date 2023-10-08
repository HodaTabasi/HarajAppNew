part of complete_store_seller_view;

class InputField extends GetView<CompleteStoreSellerController> {
  CompleteStoreSellerController completeProfileSellerController =
      Get.put(CompleteStoreSellerController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Obx(() {
          return Form(
            key: GeneralGetxController.to.sellerStoreKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFomField(
                  textController: controller.nameController,
                  textInputType: TextInputType.name,
                  title: context.localizations.exhibition_name,
                  radius: 6.r,
                  prefixIcon: IconsApp.person,
                  focusNode: FocusNode(),
                  errorTitle: GeneralGetxController.to.nameErrorText.value,
                  type: 'name',
                ),
                AppTextFomField(
                  textController: controller.phoneController,
                  textInputType: TextInputType.phone,
                  title: context.localizations.exhibition_phone,
                  radius: 6.r,
                  prefixIcon: IconsApp.mobile,
                  secure: controller.isVisibility.value, // Toggle the secure property
                  focusNode: FocusNode(),
                  errorTitle: GeneralGetxController.to.mobileErrorText.value,
                  type: 'mobile',
                ),
                AppTextFomField(
                  textController: controller.commercialRegistrationNumController,
                  textInputType: TextInputType.phone,
                  title: context.localizations.commercial_registration_no,
                  radius: 6.r,
                  prefixIcon: IconsApp.commercialRegisterNumber,
                  focusNode: FocusNode(),
                  errorTitle: GeneralGetxController.to.nicknNameErrorText.value,
                  type: 'name',
                ),
                AppTextFomField(
                  textController: controller.emailController,
                  textInputType: TextInputType.emailAddress,
                  title: context.localizations.email,
                  radius: 6.r,
                  prefixIcon: IconsApp.email,
                  focusNode: FocusNode(),
                  errorTitle: GeneralGetxController.to.emailErrorText.value,
                  type: 'email',
                ),
                AppTextFomField(
                  textController: controller.briefController,
                  textInputType: TextInputType.text,
                  title: context.localizations.additional,
                  radius: 6.r,
                  focusNode: FocusNode(),
                  errorTitle: GeneralGetxController.to.passwordErrorText.value,
                  type: 'name',
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
