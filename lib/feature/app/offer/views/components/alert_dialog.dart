part of offer_view;

class RemoveAlertDialog extends StatefulWidget {
  const RemoveAlertDialog({super.key, required this.removeOfferButton});
  final void Function() removeOfferButton;

  @override
  State<RemoveAlertDialog> createState() => _RemoveAlertDialogState();
}

class _RemoveAlertDialogState extends State<RemoveAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorResource.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Container(
          width: double.infinity,
          height: 200.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundColor: ColorResource.lightGray,
                  child: AppSvgPicture(
                    assetName: IconsApp.trash,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              AppText(
                textAlign: TextAlign.start,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                text: context.localizations.confirm_delete_offer,
                color: ColorResource.mainFontColor,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: SendEditButton(
                      title: context.localizations.yess,
                      onPressed: widget.removeOfferButton,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: SendEditButton(
                      title: context.localizations.noo,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
