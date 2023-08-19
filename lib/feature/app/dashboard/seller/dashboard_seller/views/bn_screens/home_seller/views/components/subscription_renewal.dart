part of home_seller_view;

class SubscriptionRenewal extends StatefulWidget {
  const SubscriptionRenewal({super.key});

  @override
  State<SubscriptionRenewal> createState() => _SubscriptionRenewalState();
}

class _SubscriptionRenewalState extends State<SubscriptionRenewal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 48.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorResource.mainColor.withOpacity(0.10),
      ),
      child: AppText(
        text: context.localizations.subscription_renewal,
        color: ColorResource.mainColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
