part of add_address_seller_view;

class DoneButton extends StatefulWidget {
  const DoneButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  State<DoneButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<DoneButton> {
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
