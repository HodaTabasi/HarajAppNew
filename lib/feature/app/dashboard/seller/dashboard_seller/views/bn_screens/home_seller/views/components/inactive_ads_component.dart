part of home_seller_view;

class InActiveAdsComponent extends StatefulWidget {
  const InActiveAdsComponent({super.key});

  @override
  State<InActiveAdsComponent> createState() => _InActiveAdsComponentState();
}

class _InActiveAdsComponentState extends State<InActiveAdsComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowDividerWidget(
          text: '010 ${context.localizations.ad}',
          lineColor: ColorResource.gray,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return AppCarContainer(
                nameCar: 'بوغاتي شيرون',
                imageCar:
                    "https://www.pixel4k.com/wp-content/uploads/2019/01/bugatti-chiron-4k_1546362064.jpg.webp",
                priceCar: '5000 درهم',
                conditionCar: 'ممتازة',
                showCar: 'زائر',
                postingTime: 'قبل ساعة',
                menuItem: [
                  AppPopupMenuItem(
                    value: 1,
                    iconAsset: IconsApp.remove,
                    title: context.localizations.delete,
                    iconColor: ColorResource.red,
                  ),
                ],
                onSelected: (value) {
                  // Handle selection for this usage
                  debugPrint('Selected value:💯 $value');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
