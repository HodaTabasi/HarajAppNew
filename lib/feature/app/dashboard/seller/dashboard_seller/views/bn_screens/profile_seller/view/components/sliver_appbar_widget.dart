part of public_profile_seller_view;

class SliverAppBarWidget extends StatelessWidget {
  SliverAppBarWidget({
    super.key,
    required this.opacity,
  });

  double opacity;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 334.0.h,
      toolbarHeight: 100.h,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title:  AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: opacity,
          child: Stack(
            children: [
              AppSvgPicture(
                assetName: IconsApp.tabBar,
                width: MediaQuery.of(context).size.width,
              ),
              const AppBarWidget(),
            ],
          ),
        ),
        background: Stack(
          children: [
            PositionedDirectional(
                start: 0.w,
                end: 0.w,
                top: 0.h,
                child: AppSvgPicture(
                  assetName: IconsApp.background,
                  fit: BoxFit.fill,
                )),
            PositionedDirectional(
                child: HeaderWidget())
          ],
        ),
      ),
    );
  }
}