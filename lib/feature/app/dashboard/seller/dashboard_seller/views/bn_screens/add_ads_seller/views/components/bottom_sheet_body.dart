part of add_ads_seller_view;

class BottomSheetBody extends StatefulWidget {
  final int index;
  final String headerTitle;
  final String title;
  final String logo;
  final List<GeneralModel> list;

  const BottomSheetBody(
      {super.key,
      required this.index,
      required this.headerTitle,
      required this.title,
      required this.list,
      required this.logo});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  // int _selectedRadio = 0;


  void _handleRadioValueChange(int? value,GeneralModel model) {
    setState(() {
      // AddAdsSellerController.to.selectedData[widget.title]?.id = value!;
      AddAdsSellerController.to.selectedData[widget.title] = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.list);
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
        SizedBox(height: 16.h),
        AppText(
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
          text: widget.headerTitle,
          color: ColorResource.mainFontColor,
        ),
        AppDivider(
          color: ColorResource.secondaryColor,
          height: 24.h,
          thickness: 1.h,
        ),
        Flexible(
          child: ListView.builder(
            itemCount: widget.list.length,
            // itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CarBrandSelection(
                    value: widget.list[index].id ?? 0,
                    groupValue: AddAdsSellerController.to.selectedData[widget.title]?.id ?? 0,
                    onChange: (val)=>_handleRadioValueChange(val,widget.list[index]),
                    title: widget.list[index].name ??
                        widget.list[index].number.toString(),
                    // title: "بي ام دبليو",
                    // logo: widget.logo,
                    logo: "",
                  ),
                  AppDivider(
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
          title: context.localizations.completed,
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
