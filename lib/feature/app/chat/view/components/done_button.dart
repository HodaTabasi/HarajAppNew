part of home_chat_view;

class DoneButton extends StatefulWidget {
  const DoneButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.backgroundColor,
      required this.borderColor,
      required this.titleColor})
      : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final Color titleColor;
  final void Function() onPressed;

  @override
  State<DoneButton> createState() => _DoneButtonState();
}

class _DoneButtonState extends State<DoneButton> {
  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      title: widget.title,
      titleColor: widget.titleColor,
      fontSize: 15.sp,
      widthButton: double.infinity,
      heightButton: 50.h,
      radius: 5.r,
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
      onPressed: widget.onPressed,
      fontWeight: FontWeight.w500,
    );
  }
}
