part of gallery_buyer_view;

class HeaderImage extends StatelessWidget {
  HeaderImage({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 50.r,
        backgroundColor: ColorResource.lightGray,
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
