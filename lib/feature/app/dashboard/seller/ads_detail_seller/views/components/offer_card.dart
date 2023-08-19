part of ads_detail_seller_view;

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.posting,
    required this.crossOnTab,
    required this.checkOnTab,
  });

  final String name;
  final String price;
  final String image;
  final String posting;
  final void Function() crossOnTab;
  final void Function() checkOnTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            height: 60.h,
            width: 60.w,
            child: CircleAvatar(
              radius: 40.r,
              backgroundColor: ColorResource.lightGray,
              backgroundImage: AssetImage(image),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: name,
                color: ColorResource.mainFontColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              AppText(
                text: price,
                color: ColorResource.mainFontColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              AppText(
                text: posting,
                color: ColorResource.gray,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: crossOnTab,
                    child: AppSvgPicture(
                      assetName: IconsApp.cross,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  InkWell(
                    onTap: crossOnTab,
                    child: AppSvgPicture(
                      assetName: IconsApp.check,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
