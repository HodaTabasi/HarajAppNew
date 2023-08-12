part of login_view;

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions(
      {Key? key,
      required this.title,
      required this.onTitle,
      required this.onPressed,
      required this.textAlign})
      : super(key: key);

  final String title;
  final String onTitle;
  final void Function() onPressed;
  final TextAlign textAlign;

  @override
  State<TermsAndConditions> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: widget.textAlign,
      // textAlign: TextAlign.end,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: widget.title,
          // text: 'By Continuing you agree to our',
          style: TextStyle(
            color: ColorResource.darkBlue,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextSpan(
          text: widget.onTitle,
          // text: 'Terms & Conditions Privacy\n Polices',
          style: TextStyle(
            color: ColorResource.red,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          recognizer: TapGestureRecognizer()..onTap = widget.onPressed,
          // ..onTap = () {
          //   // showDialog(
          //   //     context: context,
          //   //     builder: ((BuildContext context) {
          //   //       return _TermsAndConditionsDailog();
          //   //     }));
          // },
        ),
      ]),
    );
  }
}
