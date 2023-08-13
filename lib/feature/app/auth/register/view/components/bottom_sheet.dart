part of register_view;

class BottomSheet extends StatefulWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  CompleteProfileBuyerController completeProfileBuyerController =
      Get.put(CompleteProfileBuyerController());

  int _selectedRadio = 0;
  bool isSelected = false;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadio = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.h,
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
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
                radius: 45.r,
                backgroundColor: ColorResource.lightGray,
                child: AppSvgPicture(assetName: IconsApp.questionMark)),
          ),
          SizedBox(height: 15.h),
          AppText(
            text: context.localizations.select_account_type,
            color: ColorResource.mainFontColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          Divider(
            height: 35.h,
            color: ColorResource.lightGray,
            thickness: 2,
          ),
          RegisterType(
            value: 0,
            groupValue: _selectedRadio,
            onChange: _handleRadioValueChange,
            title: context.localizations.seller_account,
            subTitle: context.localizations.subscription_pay,
            image: IconsApp.vendorAccount,
          ),
          Divider(
            height: 35.h,
            color: ColorResource.lightGray,
            thickness: 2,
          ),
          RegisterType(
            value: 1,
            groupValue: _selectedRadio,
            onChange: _handleRadioValueChange,
            title: context.localizations.buyer_account,
            subTitle: context.localizations.no_subscription_pay,
            image: IconsApp.buyerAccount,
          ),
          Divider(
            height: 35.h,
            color: ColorResource.lightGray,
            thickness: 2,
          ),
          RegisterButton(
            title: context.localizations.create,
            onPressed: () {
              Get.offAll(CompleteProfileBuyerScreen());
            },
          ),
        ],
      ),
    );
  }
}
