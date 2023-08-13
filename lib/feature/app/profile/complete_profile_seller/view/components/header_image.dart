part of complete_profile_seller_view;

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppImage(
      imageName: ImagesApp.background,
      width: double.infinity,
      height: 654.h,
      fit: BoxFit.fill,
    );
  }
}
