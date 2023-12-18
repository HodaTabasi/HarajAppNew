part of login_view;

class HeaderLogo extends StatefulWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  State<HeaderLogo> createState() => _HeaderLogoState();
}

class _HeaderLogoState extends State<HeaderLogo> {
  @override
  Widget build(BuildContext context) {
    return AppSvgPicture(
      assetName: IconsApp.logo,
      height: 95.h,
      width: 131.w,
      matchTextDirection: false,
    );
  }
}
