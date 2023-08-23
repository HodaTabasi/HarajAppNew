part of filter_buyer_view;

class BottomSheetBody extends StatefulWidget {
  final int index;
  final String headerTitle;
  final String title;
  final String logo;
  final bool showCheckbox;

  const BottomSheetBody({
    super.key,
    required this.index,
    required this.headerTitle,
    required this.title,
    required this.logo,
    required this.showCheckbox,
  });

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  int _selectedRadio = 0;
  bool selectCheckbox = false; // Add a boolean flag for showing checkbox

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadio = value!;
    });
  }

  void _toggleCheckbox() {
    setState(() {
      selectCheckbox = !selectCheckbox;
    });
  }

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
            itemCount: widget.index,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  AppSelectionBottomSheet(
                    value: index,
                    groupValue: _selectedRadio,
                    onChange: _handleRadioValueChange,
                    title: widget.title,
                    logo: widget.logo,
                    showCheckbox: widget.showCheckbox,
                    // Pass the showCheckbox flag
                    selectCheckbox: selectCheckbox,
                    onChanged: (value) {
                      _toggleCheckbox();
                    },
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
