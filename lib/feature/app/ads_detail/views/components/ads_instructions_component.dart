part of ads_detail_buyer_view;

class AdsInstructionsComponent extends StatefulWidget {
  const AdsInstructionsComponent({super.key, required this.id});
  final int id;

  @override
  State<AdsInstructionsComponent> createState() =>
      _AdsInstructionsComponentState();
}

class _AdsInstructionsComponentState extends State<AdsInstructionsComponent> {
  late AdsDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.instructionModel.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5.r,
                      backgroundColor: ColorResource.gray,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: AppText(
                        text: controller.instructionModel[index].name!,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorResource.mainFontColor,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
