part of add_address_seller_view;

class BottomSheetSuccess extends StatefulWidget {
  const BottomSheetSuccess({Key? key}) : super(key: key);

  @override
  State<BottomSheetSuccess> createState() => _BottomSheetSuccessState();
}

class _BottomSheetSuccessState extends State<BottomSheetSuccess> {
  AddAddressSellerController addAddressSellerController =
      Get.put(AddAddressSellerController());

  int _selectedRadio = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadio = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 631.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
            bottomLeft: Radius.circular(0.r),
            bottomRight: Radius.circular(0.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: ColorResource.lightGray,
              child: AppSvgPicture(
                assetName: IconsApp.character,
              ),
            ),
          ),
          SizedBox(height: 18.h),
          AppText(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            text: context.localizations.congratulations,
            color: ColorResource.green,
          ),
          SizedBox(height: 18.h),
          AppText(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            text: context.localizations.register_successfully,
            color: ColorResource.mainFontColor,
          ),
          AppDivider(
            color: ColorResource.secondaryColor,
            height: 20.h,
            thickness: 1.h,
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: ColorResource.mainColor,
            value: 1,
            groupValue: _selectedRadio,
            onChanged: _handleRadioValueChange,
            title: AppText(
              text: context.localizations.approve,
              color: ColorResource.mainFontColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.start,
            ),
          ),
          AppDivider(
            color: ColorResource.secondaryColor,
            height: 20.h,
            thickness: 1.h,
          ),
          CustomRichText(
            mainText: context.localizations.pay_subscription,
            greenText: '100',
            secondaryText: context.localizations.sr,
            secondGreenText: '50',
            additionalText: context.localizations.thousands_of_customers,
            mainTextColor: ColorResource.mainFontColor,
            greenTextColor: ColorResource.green,
            secondaryTextColor: ColorResource.secondaryColor,
            fontSize: 15.0, // Set the desired font size
          ),
          const Spacer(),
          DoneButton(
            title: context.localizations.accept,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
