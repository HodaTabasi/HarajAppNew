part of ads_detail_buyer_view;

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.name,
    required this.subName,
    required this.image,
    required this.posting,
    required this.onTab,
  });

  final String name;
  final String subName;
  final String image;
  final String posting;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            height: 50.h,
            width: 50.w,
            child: CircleAvatar(
              radius: 35.r,
              backgroundColor: ColorResource.lightGray,
              backgroundImage: NetworkImage(image),
            ),
          ),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: name,
                color: ColorResource.mainColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 10.h),
              AppText(
                text: subName,
                color: ColorResource.gray,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: ColorResource.gray,
                    size: 18.w,
                  ),
                  AppText(
                    text: posting,
                    color: ColorResource.gray,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
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
