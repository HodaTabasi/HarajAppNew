part of add_contact_information_seller_view;

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
      margin: EdgeInsets.only(top: 12.h),
      child: CircleAvatar(
        radius: 50.r,
        backgroundColor: ColorResource.lightGray,
        child: AppSvgPicture(
          assetName: IconsApp.addNewCommunication,
          height: 50.h,
          width: 70.w,
        ),
      ),
    );
  }
}
