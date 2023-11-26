part of search_buyer_view;

class SearchResultBuyerScreen extends StatefulWidget {
  const SearchResultBuyerScreen({super.key});

  @override
  State<SearchResultBuyerScreen> createState() =>
      _SearchResultBuyerScreenState();
}

class _SearchResultBuyerScreenState extends State<SearchResultBuyerScreen> {
  final SearchBuyerController searchController =
  Get.find<SearchBuyerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.localizations.research_results,
        heightBackground: 180.h,
        showLeading: true,
        showSearch: false,
        showActions: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            RowDividerWidget(
              text: '${searchController.ads.length} ${context.localizations.ad}',
              lineColor: ColorResource.gray,
            ),
            Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsetsDirectional.symmetric(vertical: 16.h),
                      itemCount: searchController.ads.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:
                            17.h, // Add spacing between grid items.
                        crossAxisSpacing:
                            15.w, // Add spacing between grid items.
                        childAspectRatio: 160.w / 281.h, // Width on Height
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return  InkWell(
                          onTap: () {
                            Get.to(() =>  AdsDetailScreen(
                              productId: searchController.ads[index].id!,
                            ));},
                         child:AppAdsCarContainer(
                          nameCar: searchController.ads[index].car?.name??"no name",
                          gallery: searchController.ads[index].gallery,
                          priceCar: searchController.ads[index].price??"no price",
                          conditionCar: searchController.ads[index].mechanicalStatus?.name??"no status",
                          imageSeller: searchController.ads[index].store!.gallery![0].image??"",
                          sellerName: searchController.ads[index].store?.name??"no name ",
                          nameLocation: searchController.ads[index].address?.city?.name??"",
                         ));

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
          ],
        ),
      ),
    );
  }
}
