import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class TabBarComponent extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;
  final double height;

  const TabBarComponent({
    required this.tabTitles,
    required this.tabViews,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  State<TabBarComponent> createState() => _TabBarComponentState();
}

class _TabBarComponentState extends State<TabBarComponent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabTitles.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorResource.white,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              border:
                  Border.all(color: ColorResource.lightGrey), // Add border here
              boxShadow: [
                BoxShadow(
                  color: ColorResource.lightGrey,
                  blurRadius: 10.r,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: TabBar(
            isScrollable: false,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            controller: _tabController,
            onTap: (value) {
              // Handle tab selection if needed
            },
            indicator: BoxDecoration(
              color: ColorResource.mainColor,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              boxShadow: [
                BoxShadow(
                  color: ColorResource.lightGrey,
                  blurRadius: 10.r,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: ColorResource.white,
            unselectedLabelColor: ColorResource.gray,
            labelStyle:
                TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600),
            unselectedLabelStyle:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
            tabs: widget.tabTitles.map((title) => Tab(text: title)).toList(),
          ),
        ),
        SizedBox(
          height: widget.height,
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}
