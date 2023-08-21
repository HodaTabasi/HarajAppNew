part of add_seller_view;

class PageTimeLine extends StatefulWidget {
  const PageTimeLine({super.key});

  @override
  State<PageTimeLine> createState() => _PageTimeLineState();
}

class _PageTimeLineState extends State<PageTimeLine> {
  final AddSellerController addSellerController =
      Get.put(AddSellerController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeLineIndicator(
                selected: addSellerController.currentPage == 0, endMargin: 4.w),
            TimeLineIndicator(
                selected: addSellerController.currentPage == 1, endMargin: 4.w),
            TimeLineIndicator(
                selected: addSellerController.currentPage == 2, endMargin: 4.w),
            TimeLineIndicator(selected: addSellerController.currentPage == 3),
          ],
        ),
        SizedBox(height: 24.h),
        SizedBox(
          height: 382,
          child: PageView.builder(
            controller: addSellerController.pageController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                addSellerController.currentPage = value;
              });
            },
            itemCount: 4,
            // Set the total number of pages here
            itemBuilder: (context, index) {
              // Use index to decide which page content to display
              switch (index) {
                case 0:
                  return const TimeLineContent(body: AddSellerFirstPage());
                case 1:
                  return const TimeLineContent(body: AddSellerSecondPage());
                case 2:
                  return TimeLineContent(body: AddSellerThirdPage());
                case 3:
                  return TimeLineContent(body: AddSellerFourthPage());
                default:
                  return Container(); // Return an empty container for unknown index
              }
            },
          ),
        ),
      ],
    );
  }
}
