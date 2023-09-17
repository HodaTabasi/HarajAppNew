part of public_profile_seller_view;

class HeaderWidget extends GetView<ProfileSellerController> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        children: [
          const AppBarWidget(),
          SizedBox(
            height: 8.h,
          ),
          CircleAvatar(
            radius: 40.r,
            backgroundImage: NetworkImage(controller.userModel?.data!.avatar !=
                null
                ? controller.userModel?.data!.avatar ?? ''
                : "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
          ),
          SizedBox(
            height: 8.h,
          ),
          AppText(
            text: '${controller.userModel?.data!.name}',
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
          SizedBox(
            height: 16.h,
          ),
          HeaderUserInfo()
        ],
      ),
    );
  }
}



