part of offer_buyer_view;

class SendEditButton extends StatefulWidget {
  const SendEditButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  State<SendEditButton> createState() => _SendEditButtonState();
}

class _SendEditButtonState extends State<SendEditButton> {
  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      title: widget.title,
      titleColor: ColorResource.white,
      fontSize: 15.sp,
      widthButton: double.infinity,
      heightButton: 50.h,
      radius: 5.r,
      backgroundColor: ColorResource.mainColor,
      onPressed: widget.onPressed,
      fontWeight: FontWeight.w500,
    );
  }
}
