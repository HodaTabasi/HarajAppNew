part of forget_password_view;

class PasswordInputField extends GetView<ForgetPasswordController> {
  //ForgetPasswordController controller = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Obx(() {
          return Form(
            key: GeneralGetxController.to.addPasswordKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                AppTextFomField(
                    textController: controller.passwordController,
                    textInputType: TextInputType.visiblePassword,
                    title: context.localizations.password,
                    radius: 6.r,
                    prefixIcon: IconsApp.password,
                    secure:
                        controller.isVisibility.value, // Toggle the secure property
                    suffixIcon: IconButton(
                      color: ColorResource.red,
                      onPressed: () {
                        controller
                            .toggleVisibility(); // Call the toggleVisibility method
                        debugPrint('${controller.isVisibility.value}');
                      },
                      icon: Icon(
                        controller.isVisibility
                                .value // Use .value to get the RxBool value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: controller.isVisibility
                                .value // Use .value to get the RxBool value
                            ? ColorResource.gray
                            : ColorResource.black,
                      ),
                    ),
                    focusNode: FocusNode(),
                    errorTitle: GeneralGetxController.to.passwordErrorText.value,
                    type: 'password',
                  ),
                SizedBox(height: 20.h),
               AppTextFomField(
                    textController: controller.confirmPasswordController,
                    textInputType: TextInputType.visiblePassword,
                    title: context.localizations.retype_password,
                    radius: 6.r,
                    prefixIcon: IconsApp.password,
                    secure:
                        controller.isVisibility.value, // Toggle the secure property
                    suffixIcon: IconButton(
                      color: ColorResource.red,
                      onPressed: () {
                        controller
                            .toggleVisibility(); // Call the toggleVisibility method
                        debugPrint('${controller.isVisibility.value}');
                      },
                      icon: Icon(
                        controller.isVisibility
                                .value // Use .value to get the RxBool value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: controller.isVisibility
                                .value // Use .value to get the RxBool value
                            ? ColorResource.gray
                            : ColorResource.black,
                      ),
                    ),
                    focusNode: FocusNode(),
                    errorTitle: GeneralGetxController.to.confiormPasswordErrorText.value,
                    type: 'conformPassword',
                  )
              ],
            ),
          );
        }
      ),
    );
  }
}
