part of add_address_seller_view;

class BackButton extends StatefulWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  State<BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
                color: ColorResource.mainColor)));
  }
}
