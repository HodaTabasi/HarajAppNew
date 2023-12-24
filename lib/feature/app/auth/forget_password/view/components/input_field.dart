part of forget_password_view;

class InputField extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() {
          return Form(
            key: GeneralGetxController.to.forgetPasswordKey,
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
              ],
            ),
          );
        }
      ),
    );
  }
}
