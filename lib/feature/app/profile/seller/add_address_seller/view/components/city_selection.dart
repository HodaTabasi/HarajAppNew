part of add_address_seller_view;

class CitySelection extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final void Function(int? value)? onChange;

  const CitySelection({
    Key? key,
    required this.title,
    this.value = 0,
    this.groupValue = 0,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorResource.mainFontColor,
        ),
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
