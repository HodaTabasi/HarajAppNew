library payment_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../../../../../../utils/prefs/shared_pref_controller.dart';
import '../../../../../../../../../../widgets/app_svg_picture.dart';
import '../../../../../../../../../../widgets/app_tab_bar.dart';
import '../../../../../../../../../../widgets/app_text.dart';
import '../../../../../../../../../../widgets/custom_appbar.dart';
import '../../../profile_seller/profile_part_seller/info_view/view/components/info_appbar_widget.dart';

part'../components/subscription_renewal_component.dart';
part'../components/expand_ads_limits_component.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}
class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
        child:  InfoAppBarWidget(text:context.localizations.payment_lbl),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SharedPrefController().type == 1
                ? TabBarComponent(
              tabTitles: [
                context.localizations.subscription_renewal,
                context.localizations.expand_ads_limits,
              ],
              tabViews: const [
                SubscriptionRenewalComponent(),
                ExpandAdsLimitsComponent(),
                // Other tab views
              ],
              height: 580.h,
            )
                : SizedBox(height: 630.h, child: SubscriptionRenewalComponent()),
          ],
        ),
      ),
    );

  }
}