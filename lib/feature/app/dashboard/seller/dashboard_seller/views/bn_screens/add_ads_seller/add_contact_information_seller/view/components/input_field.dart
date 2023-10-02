part of add_contact_information_seller_view;

class InputField extends GetView<AddContactInformationSellerController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFomField(
          focusNode: FocusNode(),
          textController: controller.whatsappController,
          textInputType: TextInputType.number,
          title: context.localizations.contact_via_whats,
          radius: 6.r,
          prefixIcon: IconsApp.whatsapp,
          suffixIcon: AppSwitchButton(mapKey: 'whatsapp',),
          errorTitle: '',
          type: 'whatsapp',
        ),
        SizedBox(height: 20.h),
        AppTextFomField(
          focusNode: FocusNode(),
          textController: controller.facebookController,
          textInputType: TextInputType.emailAddress,
          title: context.localizations.contact_via_face,
          radius: 6.r,
          prefixIcon: IconsApp.facebookOld,
          suffixIcon: AppSwitchButton(mapKey: 'facebook',),
          errorTitle: "",
          type: 'facebook',
        )
      ],
    );
  }
}
