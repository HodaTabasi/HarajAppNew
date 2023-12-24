part of forget_password_view;

class ChangePasswordButton extends StatefulWidget {
  const ChangePasswordButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  State<ChangePasswordButton> createState() => _ChangePasswordButtonState();
}

class _ChangePasswordButtonState extends State<ChangePasswordButton> {
  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      title: widget.title,
      // title: 'SignUp',
      titleColor: ColorResource.white,
      fontSize: 15.sp,
      widthButton: double.infinity,
      heightButton: 50.h,
      radius: 5.r,
      backgroundColor: ColorResource.mainColor,
      onPressed: widget.onPressed,
      assetName: '',
      fontWeight: FontWeight.w500,
    );
  }
}
