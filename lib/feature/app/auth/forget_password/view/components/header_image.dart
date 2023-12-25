part of forget_password_view;

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppImage(
      imageName: ImagesApp.background,
      width: double.infinity,
      height: 550.h,
      fit: BoxFit.fill,
    );
  }
}
