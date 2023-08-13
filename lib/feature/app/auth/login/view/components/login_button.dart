part of login_view;

class LoginButton extends StatefulWidget {
   LoginButton({Key? key, required this.title, required this.onPressed,this.validate = false})
      : super(key: key);

  final String title;
  final void Function() onPressed;
  bool validate = false;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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
      backgroundColor: widget.validate ?ColorResource.mainColor:ColorResource.white,
      onPressed: widget.onPressed,
      assetName: '',
      fontWeight: FontWeight.w500,
    );
  }
}
