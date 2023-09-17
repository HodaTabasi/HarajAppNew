import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';

import '../../../../../widgets/custom_appbar.dart';

class StaticScreen extends StatefulWidget {
  const StaticScreen({Key? key}) : super(key: key);

  @override
  State<StaticScreen> createState() => _StaticScreenState();
}

class _StaticScreenState extends State<StaticScreen> {
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
      body: RawScrollbar(
        thumbColor: ColorResource.red,
        radius: Radius.circular(20.r),
        thickness: 2,
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
