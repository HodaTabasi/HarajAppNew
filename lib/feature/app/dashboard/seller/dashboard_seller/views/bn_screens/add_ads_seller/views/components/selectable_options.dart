part of add_ads_seller_view;

class SelectableOptions extends StatelessWidget {
  final String title;
  final List<String> options;
  final List<int> selectedIndices;
  final Function(int, int) onOptionSelected;

  SelectableOptions({
    required this.title,
    required this.options,
    required this.selectedIndices,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorResource.mainFontColor,
        ),
        SizedBox(height: 12.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSelectableContainer(
                  isSelected: selectedIndices[index] == 0,
                  onTap: () => onOptionSelected(index, 0),
                  label: options[index],
                ),
                AppSelectableContainer(
                  isSelected: selectedIndices[index] == 1,
                  onTap: () => onOptionSelected(index, 1),
                  label: options[index],
                ),
              ],
            );
          },
        ),
        AppDivider(
          height: 24.h,
          color: ColorResource.gray,
          thickness: 1,
        ),
      ],
    );
  }
}
