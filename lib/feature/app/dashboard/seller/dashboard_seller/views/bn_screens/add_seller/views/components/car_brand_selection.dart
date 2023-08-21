part of add_seller_view;

class CarBrandSelection extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final void Function(int? value)? onChange;
  final String? logo;

  const CarBrandSelection({
    Key? key,
    required this.title,
    this.value = 0,
    this.groupValue = 0,
    this.onChange,
    this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        logo!.isNotEmpty
            ? Container(
                height: 48.h,
                width: 48.w,
                alignment: Alignment.center,
                color: ColorResource.transparent,
                child: Image.network(logo!),
              )
            : const SizedBox(),
        SizedBox(width: 10.w),
        AppText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorResource.mainFontColor,
        ),
        const Spacer(),
        Radio(
          fillColor: MaterialStateColor.resolveWith(
              (states) => ColorResource.mainColor),
          value: value,
          groupValue: groupValue,
          onChanged: onChange,
        ),
      ],
    );
  }
}
