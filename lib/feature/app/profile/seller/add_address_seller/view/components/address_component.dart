part of add_address_seller_view;

class AddressComponent extends StatelessWidget {
  final String title;
  final String image;
  final void Function() onPressed;

  const AddressComponent({
    Key? key,
    required this.title,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: ColorResource.fillgrey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            AppSvgPicture(
              assetName: image,
            ),
            SizedBox(width: 16.w),
            VerticalDivider(
              width: 0.5.r,
              color: ColorResource.dividerVirticalColor,
            ),
            SizedBox(width: 10.w),
            AppText(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorResource.borderGray1,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.w,
            ),
          ],
        ),
      ),
    );
  }
}
