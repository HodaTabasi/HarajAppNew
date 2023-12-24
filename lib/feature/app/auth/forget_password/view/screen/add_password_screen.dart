part of forget_password_view;

class AddPasswordScreen extends StatefulWidget {
  @override
  State<AddPasswordScreen> createState() => _AddPassswordScreenState();
}
class _AddPassswordScreenState extends State<AddPasswordScreen> {
  ForgetPasswordController controller = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    controller.loading.value = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const HeaderImage(),
                Padding(
                  padding: EdgeInsets.only(top: 55.h),
                  child: Column(
                    children: [
                      const HeaderLogo(),
                      SizedBox(height: 30.h),
                      PasswordInputField(),
                      SizedBox(height: 15.h),
                      Obx(() {
                        return controller.loading.isTrue
                            ? const Center(child: CircularProgressIndicator())
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: ChangePasswordButton(
                                  title: context.localizations.change_password,
                                  onPressed: () async {
                                    await controller.performChangePassword();
                                  },
                                ),
                              );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
