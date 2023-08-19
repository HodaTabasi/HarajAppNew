part of ads_detail_seller_view;

class LineDetail extends StatelessWidget {
  const LineDetail({
    super.key,
    required this.detail,
    required this.result,
  });

  final String detail;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: detail,
                  color: ColorResource.gray,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  text: result,
                  color: ColorResource.mainFontColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
        AppDivider(
          height: 24.h,
          color: ColorResource.lightGray,
          thickness: 1,
        ),
      ],
    );
  }
}
