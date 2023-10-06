part of login_view;

class InputField extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() {
          return Form(
            key: GeneralGetxController.to.loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFomField(
                  focusNode: FocusNode(),
                  textController: controller.emailController,
                  textInputType: TextInputType.emailAddress,
                  title: context.localizations.email,
                  radius: 6.r,
                  prefixIcon: IconsApp.email,
                  // validator: GeneralGetxController.to.emailValidation,
                  errorTitle: GeneralGetxController.to.emailErrorText.value,
                  type: 'email',
                ),
                SizedBox(height: 20.h),
                AppTextFomField(
                  focusNode: FocusNode(),
                    textController: controller.passwordController,
                    textInputType: TextInputType.visiblePassword,
                    title: context.localizations.password,
                    radius: 6.r,
                    prefixIcon: IconsApp.password,
                    secure:
                        !controller.isVisibility.value, // Toggle the secure property
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
                  // validator: GeneralGetxController.to.passwordValidation,
                  errorTitle: GeneralGetxController.to.passwordErrorText.value,
                  type: 'password',
                  )

              ],
            ),
          );
        }
      ),
    );
  }
}
