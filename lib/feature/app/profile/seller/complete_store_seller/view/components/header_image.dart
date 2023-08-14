part of complete_store_seller_view;

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppImage(
      imageName: ImagesApp.background,
      width: double.infinity,
      height: 730.h,
      fit: BoxFit.fill,
    );
  }
}
