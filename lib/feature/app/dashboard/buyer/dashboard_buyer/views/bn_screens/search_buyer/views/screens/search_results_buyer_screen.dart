part of search_buyer_view;

class SearchResultBuyerScreen extends StatefulWidget {
  const SearchResultBuyerScreen({super.key});

  @override
  State<SearchResultBuyerScreen> createState() =>
      _SearchResultBuyerScreenState();
}

class _SearchResultBuyerScreenState extends State<SearchResultBuyerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.localizations.research_results,
        heightBackground: 180.h,
        showLeading: true,
        showSearch: true,
        showActions: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            RowDividerWidget(
              text: '010 ${context.localizations.ad}',
              lineColor: ColorResource.gray,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.to(() => AdsDetailBuyerScreen());
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsetsDirectional.symmetric(vertical: 16.h),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:
                            17.h, // Add spacing between grid items.
                        crossAxisSpacing:
                            15.w, // Add spacing between grid items.
                        childAspectRatio: 160.w / 281.h, // Width on Height
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return const AppAdsCarContainer(
                          nameCar: 'بوغاتي شيرون',
                          imageCar: ImagesApp.imageSwiper,
                          priceCar: '5000 درهم',
                          conditionCar: 'ممتازة',
                          imageSeller: ImagesApp.imageSwiper,
                          sellerName: 'معرض النور لبيع السيارات',
                          nameLocation: 'دبي',
                        );
                      },
                    ),
                    DoneButton(
                      //TODO:Make Lang Here
                      title: 'حفظ النتائج',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
