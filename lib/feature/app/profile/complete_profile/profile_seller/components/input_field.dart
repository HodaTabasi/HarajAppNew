part of complete_profile_seller_view;

class InputField extends GetView<CompleteProfileSellerController> {
  CompleteProfileSellerController completeProfileSellerController =
      Get.put(CompleteProfileSellerController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Obx(() {
          return Form(
            key: GeneralGetxController.to.sellerProfileKey,
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
                  errorTitle: GeneralGetxController.to.nameErrorText.value,
                  type: 'name',
                ),
                AppTextFomField(
                  textController: controller.phoneController,
                  textInputType: TextInputType.phone,
                  title: context.localizations.official_phone_number,
                  radius: 6.r,
                  prefixIcon: IconsApp.mobile,
                  secure: controller.isVisibility.value, // Toggle the secure property
                  focusNode: FocusNode(),
                  errorTitle: GeneralGetxController.to.mobileErrorText.value,
                  type: 'mobile',
                ),
                AppTextFomField(
                  textController: controller.idController,
                  textInputType: TextInputType.phone,
                  title: context.localizations.id_number,
                  radius: 6.r,
                  prefixIcon: IconsApp.id,
                  focusNode: FocusNode(),
                  errorTitle: GeneralGetxController.to.idErrorText.value,
                  type: 'id',
                ),
                AppTextFomField(
                  textController: controller.nickNameController,
                  textInputType: TextInputType.name,
                  title: context.localizations.nickname,
                  radius: 6.r,
                  focusNode: FocusNode(),
                  errorTitle: GeneralGetxController.to.nicknNameErrorText.value,
                  type: 'nick_name',
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
