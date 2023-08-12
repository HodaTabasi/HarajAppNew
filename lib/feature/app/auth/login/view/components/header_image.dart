part of login_view;

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppImage(
      imageName: ImagesApp.background,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
