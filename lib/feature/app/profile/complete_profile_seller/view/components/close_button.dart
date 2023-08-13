part of complete_profile_seller_view;

class CloseButton extends StatefulWidget {
  const CloseButton({Key? key}) : super(key: key);

  @override
  State<CloseButton> createState() => _CloseButtonState();
}

class _CloseButtonState extends State<CloseButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: ColorResource.mainColor)));
  }
}
