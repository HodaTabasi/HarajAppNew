part of add_address_seller_view;

class BottomSheet extends StatefulWidget {
  final String title;
  const BottomSheet({Key? key, required this.title}) : super(key: key);

  @override
  State<BottomSheet> createState() => _BottomSheetScState();
}

class _BottomSheetScState extends State<BottomSheet> {
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
            text: widget.title,
            // text: context.localizations.select_princedom,
            color: ColorResource.mainFontColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          // Wrap the scrollable part in a Flexible widget to take the remaining space
          Flexible(
            child: ListView.builder(
              itemCount: addAddressSellerController.currentList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CitySelection(
                      value: index,
                      groupValue: _selectedRadio,
                      onChange: _handleRadioValueChange,
                      title: addAddressSellerController.currentList[index],
                    ),
                    Divider(
                      height: 10.h,
                      color: ColorResource.lightGray,
                      thickness: 2,
                    ),
                  ],
                );
              },
            ),
          ),
          DoneButton(
            title: context.localizations.create,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
