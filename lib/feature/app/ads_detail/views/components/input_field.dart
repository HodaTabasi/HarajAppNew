part of ads_detail_buyer_view;

class InputField extends GetView<AdsDetailController> {
  @override
  Widget build(BuildContext context) {
    return AppTextFomField(
      textController: controller.newPriceController,
      textInputType: TextInputType.number,
      title: context.localizations.new_price_dirhams,
      radius: 6.r,
      prefixIcon: IconsApp.price,
      focusNode: FocusNode(),
      errorTitle: GeneralGetxController.to.emailErrorText.value,
      type: 'new price',
    );
  }
}
