part of offer_view;

class BottomSheetBody extends StatefulWidget {
  final String headTitle;
  final String buttonTitle;

  final String nameCar;
  final String imageCar;
  final String conditionCar;
  final String sellerName;
  final String imageSeller;
  final String offerPrice;
  final String discountPrice;
  final void Function() sendNewOfferButton;

  const BottomSheetBody(
      {super.key,
      required this.headTitle,
      required this.buttonTitle,
      required this.nameCar,
      required this.imageCar,
      required this.conditionCar,
      required this.sellerName,
      required this.imageSeller,
      required this.offerPrice,
      required this.discountPrice,
      required this.sendNewOfferButton});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: ColorResource.lightGray,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close_rounded,
                size: 14.w,
                color: ColorResource.mainColor,
              ),
            ),
          ),
        ),
        AppText(
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
          text: widget.headTitle,
          color: ColorResource.mainFontColor,
        ),
        AppDivider(
          color: ColorResource.secondaryColor,
          height: 25.h,
          thickness: 1.h,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: AppCarContainer(
              nameCar: widget.nameCar,
              imageCar: widget.imageCar,
              priceCar: '',
              conditionCar: widget.conditionCar,
              showCar: '',
              postingTime: '',
              showLocation: false,
              showSeller: true,
              sellerName: widget.sellerName,
              imageSeller: widget.imageSeller,
              showOfferedPrice: true,
              offerPrice: widget.offerPrice,
              discountPrice: widget.discountPrice,
              showStatus: true,
              menuItem: const [],
              onSelected: (value) {},
            ),
          ),
        ),
        InputField(),
        SendEditButton(
          title: widget.buttonTitle,
          onPressed: widget.sendNewOfferButton,
        ),
      ],
    );
  }
}
