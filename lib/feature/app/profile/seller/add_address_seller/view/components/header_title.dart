part of add_address_seller_view;

class HeaderTitle extends StatefulWidget {
  const HeaderTitle({Key? key}) : super(key: key);

  @override
  State<HeaderTitle> createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const BackButton(),
        Center(
          child: AppText(
            color: ColorResource.mainFontColor,
            text: context.localizations.add_address,
            fontWeight: FontWeight.w800,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
