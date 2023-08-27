part of favorite_buyer_view;

class SavedSearchComponent extends StatefulWidget {
  const SavedSearchComponent({super.key});

  @override
  State<SavedSearchComponent> createState() => _SavedSearchComponentState();
}

class _SavedSearchComponentState extends State<SavedSearchComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        RowDividerWidget(
          text: '010 ${context.localizations.ad}',
          lineColor: ColorResource.gray,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 15.h),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // Get.to(() => AdsDetailBuyerScreen());
                },
                child: AppFavoriteContainer(
                  title: "توسان أكسنت 2022",
                  subTitle: "50",
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
