part of home_chat_view;

class InputField extends GetView<HomeChatController> {
  @override
  Widget build(BuildContext context) {
    return AppTextFomField(
      focusNode: FocusNode(),
      textController: controller.searchController,
      textInputType: TextInputType.text,
      title: context.localizations.chat_search,
      radius: 6.r,
      prefixIcon: IconsApp.searchOutline,
      errorTitle: 'search Error Text',
      type: 'search',
    );
  }
}
