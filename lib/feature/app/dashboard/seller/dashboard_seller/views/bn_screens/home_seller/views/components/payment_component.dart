part of home_seller_view;

class PaymentComponent extends StatefulWidget {
  const PaymentComponent({super.key});

  @override
  State<PaymentComponent> createState() => _PaymentComponentState();
}

class _PaymentComponentState extends State<PaymentComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(const PaymentScreen());
      },
      child: Container(
        width: 160.w,
        height: 60.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ColorResource.mainColor.withOpacity(0.10),
        ),
        child: AppText(
          text: context.localizations.payment_lbl,
          color: ColorResource.mainColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
