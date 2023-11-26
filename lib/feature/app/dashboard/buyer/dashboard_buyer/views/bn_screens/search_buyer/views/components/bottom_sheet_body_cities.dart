part of '../screens/search_buyer_screen.dart';

class BottomSheetBodyCities extends StatefulWidget {
  final int index;
  final String headerTitle;
  final String title;
  final String logo;
  final List<CityModel> list;

  const BottomSheetBodyCities(
      {super.key,
        required this.index,
        required this.headerTitle,
        required this.title,
        required this.list,
        required this.logo});

  @override
  State<BottomSheetBodyCities> createState() => _BottomSheetBodyCities();
}

class _BottomSheetBodyCities extends State<BottomSheetBodyCities> {
  // int _selectedRadio = 0;


  void _handleRadioValueChange(int? value,CityModel model) {
    setState(() {
      SearchBuyerController.to.cityId.value = value!;
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
                    groupValue: SearchBuyerController.to.cityId.value?? 0,
                    onChange: (val)=>_handleRadioValueChange(val,widget.list[index]),
                    title: widget.list[index].name ??
                        widget.list[index].id.toString(),
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
