part of add_seller_view;

// TODO: THIS IS TEXT FILED JUST FOR TEST

class CustomeTextFiled extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final IconButton? suffixIcon;
  final int maxLine;
  late FontWeight? fontWeight;
  late double? fontSize;
  TextAlign? textAlign;
  Color fontColor;
  final double radius;
  final String errorText;
  late double? errorFontSize;
  late FontWeight? errorFontWeight;
  Color errorFontColor;

  CustomeTextFiled({
    required this.textEditingController,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLine = 1,
    required this.radius,
    required this.fontColor,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    required this.fontSize,
    this.errorText = '',
    this.errorFontSize = 0,
    this.errorFontWeight = FontWeight.normal,
    this.errorFontColor = ColorResource.transparent,
  });

  @override
  State<CustomeTextFiled> createState() => _CustomeTextFiledState();
}

class _CustomeTextFiledState extends State<CustomeTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText,
      maxLines: widget.maxLine,
      decoration: InputDecoration(
        border: getBorder(borderColor: ColorResource.lightGray),
        enabledBorder: getBorder(borderColor: ColorResource.lightGray),
        focusedBorder: getBorder(borderColor: ColorResource.lightGray),
        labelText: widget.hintText,
        labelStyle: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.fontColor),
        hintMaxLines: 1,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }

  OutlineInputBorder getBorder({Color borderColor = ColorResource.gray}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius),
        borderSide: BorderSide(
          color: borderColor,
          width: 1.w,
        ));
  }
}
