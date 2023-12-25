part of forget_password_view;

class HeaderLogo extends StatefulWidget {
  bool showBack ;

   HeaderLogo({Key? key, required this.showBack});

  @override
  State<HeaderLogo> createState() => _HeaderLogoState();
}

class _HeaderLogoState extends State<HeaderLogo> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if(widget.showBack)
        const BackButton(),
        Center(
          child: AppSvgPicture(
            assetName: IconsApp.logo,
            height: 95.h,
            width: 131.w,
          ),
        ),
      ],
    );
  }
}
