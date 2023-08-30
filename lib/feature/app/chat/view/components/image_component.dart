part of home_chat_view;

class ImageComponent extends StatefulWidget {
  ImageComponent({
    super.key,
    required this.height,
    required this.width,
    required this.image,
  });

  double height;
  double width;
  String image;

  @override
  State<ImageComponent> createState() => _ImageComponentState();
}

class _ImageComponentState extends State<ImageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        // border: Border.all(color: ColorResource.red, width: 1.w),
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
