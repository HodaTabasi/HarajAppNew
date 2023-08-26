part of offer_buyer_view;

class BottomSheetBody extends StatefulWidget {
  final String headTitle;
  final String buttonTitle;

  const BottomSheetBody(
      {super.key, required this.headTitle, required this.buttonTitle});

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
        AppCarContainer(
          nameCar: 'بوغاتي شيرون',
          imageCar:
              "https://www.pixel4k.com/wp-content/uploads/2019/01/bugatti-chiron-4k_1546362064.jpg.webp",
          priceCar: '5000 درهم',
          conditionCar: 'ممتازة',
          showCar: 'زائر',
          postingTime: 'قبل ساعة',
          showLocation: false,
          showSeller: true,
          sellerName: "محمود محمود",
          imageSeller:
              "https://t4.ftcdn.net/jpg/02/44/15/93/360_F_244159328_RMi7Md6rmrXMuVCZp9dQWp9r1UoIcVYt.jpg",
          showOfferedPrice: true,
          offerPrice: "49999",
          discountPrice: "550000",
          showStatus: false,
          menuItem: [
            AppPopupMenuItem(
              value: 1,
              iconAsset: IconsApp.edit,
              title: context.localizations.edit,
              iconColor: ColorResource.mainColor,
            ),
            AppPopupMenuItem(
              value: 2,
              iconAsset: IconsApp.remove,
              title: context.localizations.delete,
              iconColor: ColorResource.mainColor,
            ),
          ],
          onSelected: (value) {
            // Handle selection for this usage
            debugPrint('Selected value:💯 $value');
            switch (value) {
              case 1:
                Get.bottomSheet(
                    AppBottomSheet(
                      body: BottomSheetBody(
                        headTitle: '',
                        buttonTitle: '',
                      ),
                      height: 500.h,
                    ),
                    enterBottomSheetDuration: const Duration(milliseconds: 500),
                    exitBottomSheetDuration: const Duration(milliseconds: 400));
                break;
              case 2:
                break;
              // Add more cases as needed
            }
          },
        ),
        InputField(),
        SendEditButton(
          title: widget.buttonTitle,
          onPressed: () {},
        ),
      ],
    );
  }
}
