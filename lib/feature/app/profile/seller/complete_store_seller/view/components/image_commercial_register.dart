part of complete_store_seller_view;

class ImageCommercialRegister extends StatefulWidget {
  const ImageCommercialRegister({Key? key}) : super(key: key);

  @override
  State<ImageCommercialRegister> createState() => _ImageCommercialRegisterState();
}

class _ImageCommercialRegisterState extends State<ImageCommercialRegister> {
  late ImagePicker picker;

  @override
  void initState() {
    picker = ImagePicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.h,
      margin: EdgeInsetsDirectional.symmetric(vertical: 13.r,horizontal: 25.r),
      decoration: BoxDecoration(
        border: Border.all(color: ColorResource.gray,width: 0.3),
        borderRadius: BorderRadius.circular(15.r),
        color: ColorResource.white
      ),
      child: InkWell(
        onTap: () async {
          CompleteStoreSellerController.to.fileComm =
          await picker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
        child: Image(
          image: CompleteStoreSellerController.to.fileComm != null
              ? ResizeImage.resizeIfNeeded(
              1024,
              null,
              FileImage(
                  File(CompleteStoreSellerController.to.fileComm!.path)))
              :  NetworkImage(CompleteStoreSellerController.to.imageUrlComm ??
              'https://cdn-icons-png.flaticon.com/512/126/126477.png') ,

        height: CompleteStoreSellerController.to.fileComm != null ?100.h:50.h,width: CompleteStoreSellerController.to.fileComm != null?100.w:50.w,),
      ),
    );
  }
}
