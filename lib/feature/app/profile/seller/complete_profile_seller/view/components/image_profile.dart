part of complete_profile_seller_view;

class ImageProfile extends StatefulWidget {
  const ImageProfile({Key? key}) : super(key: key);

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: CircleAvatar(
        radius: 50.r,
        backgroundColor: ColorResource.lightGray,
        backgroundImage: const AssetImage(ImagesApp.person),
        child: Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: ColorResource.mainColor,
            child: Icon(Icons.camera_alt_rounded,
                size: 24.w, color: ColorResource.white),
          ),
        ),
      ),
    );
  }
}
