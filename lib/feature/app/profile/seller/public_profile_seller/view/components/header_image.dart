part of public_profile_seller_view;

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        children: [
          AppBarWidget(),
          SizedBox(
            height: 8.h,
          ),
          CircleAvatar(
            radius: 40.r,
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
          ),
          SizedBox(
            height: 8.h,
          ),
          AppText(
            text: 'د.محمد محمد',
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



