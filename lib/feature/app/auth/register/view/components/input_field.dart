part of register_view;

class InputField extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFomField(
            controller: controller.emailController,
            textInputType: TextInputType.emailAddress,
            title: context.localizations.email,
            radius: 6.r,
            prefixIcon: IconsApp.email,
          ),
          SizedBox(height: 20.h),
          Obx(() {
            return AppTextFomField(
              controller: controller.passwordController,
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
            );
          }),
          SizedBox(height: 20.h),
          Obx(() {
            return AppTextFomField(
              controller: controller.confirmPasswordController,
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
            );
          }),
        ],
      ),
    );
  }
}
