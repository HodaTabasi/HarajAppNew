part of search_buyer_view;

class NoResults extends StatefulWidget {
  const NoResults({super.key});

  @override
  State<NoResults> createState() => _NoResultsState();
}

class _NoResultsState extends State<NoResults> {
  final SearchBuyerController searchController =
  Get.find<SearchBuyerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResource.grayColor,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSvgPicture(
                width: 200.w,
                height: 200.h,
                assetName: IconsApp.noResults),
            SizedBox(height: 15.h),
            Container(
              alignment: Alignment.center,
              child: AppText(
                text: context.localizations.no_results_lbl,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: ColorResource.gray,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 15.h),
        Obx(() {
          if(searchController.showNoResultBtn.value) {
            return Container(
              padding: EdgeInsets.all(40.h),
              child: AppElevatedButton(
                backgroundColor: Colors.white,
                borderColor: ColorResource.mainColor,
                onPressed: (){
                  Navigator.pop(context);
                },
                title: context.localizations.edit_filter_lbl,
                heightButton: 50.h,
                widthButton: MediaQuery.of(context).size.width-90,
                titleColor: ColorResource.mainColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                radius: 8,
              ),
            );
          } else {
           return SizedBox(height: 0.h);
          }
        })

          ]
      ),
    );
  }
}