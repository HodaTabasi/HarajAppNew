part of complete_store_seller_view;

class ImageProfile extends StatefulWidget {
  const ImageProfile({Key? key}) : super(key: key);

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  late ImagePicker picker;

  @override
  void initState() {
    picker = ImagePicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: CircleAvatar(
        radius: 50.r,
        backgroundColor: ColorResource.lightGray,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundColor: ColorResource.lightGray,
              backgroundImage: CompleteStoreSellerController.to.file != null
                  ? ResizeImage.resizeIfNeeded(
                      1024,
                      null,
                      FileImage(
                          File(CompleteStoreSellerController.to.file!.path)))
                  :  NetworkImage(CompleteStoreSellerController.to.imageUrl ??
                  'https://1.bp.blogspot.com/-kK7Fxm7U9o0/YN0bSIwSLvI/AAAAAAAACFk/aF4EI7XU_ashruTzTIpifBfNzb4thUivACLcBGAsYHQ/s1280/222.jpg'),
            ),
            InkWell(
              onTap: () async {
                CompleteStoreSellerController.to.file =
                    await picker.pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: ColorResource.mainColor,
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 24.w,
                  color: ColorResource.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
