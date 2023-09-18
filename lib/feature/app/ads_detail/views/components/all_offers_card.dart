part of ads_detail_buyer_view;

class AllOffersCard extends StatelessWidget {
  const AllOffersCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.posting,
    required this.status,
    required this.crossOnTab,
    required this.checkOnTab,
  });

  final String name;
  final String price;
  final String image;
  final String posting;
  final void Function() crossOnTab;
  final void Function() checkOnTab;
  final int status;

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
              backgroundImage: NetworkImage(image),
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
              //status 1 pending ,status 2 rejected,status 3 accepted
              if (status == 1)
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
                      onTap: checkOnTab,
                      child: AppSvgPicture(
                        assetName: IconsApp.check,
                      ),
                    ),
                  ],
                ),
              if (status == 2 || status == 3)
                Container(
                  height: 25.h,
                  width: 60.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: status == 2
                        ? ColorResource.mainColor.withOpacity(0.10)
                        : ColorResource.green.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: AppText(
                    //TODO: Make Lang Here
                    text: status == 2 ? "مرفوضة" : "متاحة",
                    color: status == 2
                        ? ColorResource.mainColor
                        : ColorResource.green,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
