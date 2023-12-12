part of favorite_buyer_view;

class SavedSearchComponent extends StatefulWidget {
  const SavedSearchComponent({super.key});

  @override
  State<SavedSearchComponent> createState() => _SavedSearchComponentState();
}

class _SavedSearchComponentState extends State<SavedSearchComponent> {
  final SearchResultsController controller = Get.put(SearchResultsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.searchResults.isNotEmpty) {
        return  Column(
          children: [
            SizedBox(height: 10.h),
            RowDividerWidget(
              text: '${controller.searchResults.length} ${context.localizations.result}',
              lineColor: ColorResource.gray,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 15.h),
                itemCount: controller.searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      if(SearchBuyerController.isPut){
                        SearchBuyerController.to.showNoResultBtn.value = false ;
                        SearchBuyerController.to.keyword.value = controller.searchResults[index].content??"";
                        SearchBuyerController.to.getIndexAds().then((value) => Get.to(() => const SearchResultBuyerScreen()));
                      }
                      },
                    child: AppSearchResultContainer(
                      title: controller.searchResults[index].content??"",
                      subTitle: "",
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
      else {
        return const Center(
          child: Text('No data'),
        );
      }
    });
  }
}
