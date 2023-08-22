library search_buyer_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/search_buyer/controllers/search_buyer_controller.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';

// part '../components/accepted_ads_component.dart';

class SearchBuyerScreen extends GetView<SearchBuyerController> {
  final SearchBuyerController searchBuyerController =
      Get.put(SearchBuyerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: context.localizations.offers_submitted,
        heightBackground: 130.h,
        showLeading: false,
        showSearch: false,
        showActions: false,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [AppText(text: 'Search Screen')]),
      ),
    );
  }
}
