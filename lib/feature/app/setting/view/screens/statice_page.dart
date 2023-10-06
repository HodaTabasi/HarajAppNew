import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/feature/app/setting/controller/setting_getx_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';

import '../../../../../widgets/custom_appbar.dart';

class StaticScreen extends StatefulWidget {
  final String title ;
  const StaticScreen(this.title, {Key? key}) : super(key: key);

  @override
  State<StaticScreen> createState() => _StaticScreenState();
}

class _StaticScreenState extends State<StaticScreen> {
  late String htmlData;
  late String myTitle;
  @override
  void initState() {
    getData();
    super.initState();
  }
  void getData() {
    switch(widget.title){
      case 'about_us':
        htmlData = SettingGetXController.to.settingModel?.aboutUs ?? '';
        myTitle = 'من نحن';
        break;
      case 'about_app':
        htmlData = SettingGetXController.to.settingModel?.aboutApp ?? '';
        myTitle = 'حول التطبيق';
        break;
      case 'privacy':
        htmlData = SettingGetXController.to.settingModel?.privacy ?? '';
        myTitle = 'سياسة الخصوصية';
        break;
      case 'usage_conditions':
        htmlData = SettingGetXController.to.settingModel?.usageConditions ?? '';
        myTitle = 'الشروط والاحكام';
        break;
    }
    print(SettingGetXController.to.settingModel);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: myTitle,
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
          child: Html(
            data: htmlData,
          ),
        ),
      ),
    );
  }


}
