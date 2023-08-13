part of register_view;

class RegisterType extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final int value;
  final int groupValue;
  final void Function(int? value)? onChange;

  const RegisterType({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.value = 0,
    this.groupValue = 0,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: ColorResource.lightGray,
            child: AppSvgPicture(
              assetName: image,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorResource.mainFontColor,
              ),
              AppText(
                text: subTitle,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorResource.secondaryColor,
              ),
            ],
          ),
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
