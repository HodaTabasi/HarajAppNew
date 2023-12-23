library home_chat_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/chat/controller/chat_controller.dart';
import 'package:haraj/feature/app/chat/controller/chat_details_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/models/offer/client_model.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/models/seller_info/store_model.dart';
import 'package:haraj/widgets/app_body_container.dart';
import 'package:haraj/widgets/app_chat_car_container.dart';
import 'package:haraj/widgets/app_chat_card.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_tab_bar.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';
import 'package:haraj/widgets/row_divider_widget.dart';

import '../../../../../utils/prefs/shared_pref_controller.dart';

part '../components/background_dismissible.dart';
part '../components/chat_component.dart';
part '../components/done_button.dart';
part '../components/image_component.dart';
part '../components/input_field.dart';
part '../components/requests_component.dart';
part '../components/welcome_message.dart';
part '../screen/chat_screen.dart';

class HomeChatScreen extends GetView<HomeChatController> {
  final HomeChatController homeChatController = Get.put(HomeChatController());

  @override
  Widget build(BuildContext context) {
    homeChatController.getIndexChats(pageNumber: 1);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        heightBackground: 180.h,
        title: context.localizations.chat,
        showLeading: false,
        showActions: false,
        showSearch: false,
        showSwiper: false,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // InputField(),
            // controller.seller == 'seller'
            // SharedPrefController().type == 1
            //     ? TabBarComponent(
            //         tabTitles: [
            //           context.localizations.chat,
            //           context.localizations.requests,
            //         ],
            //         tabViews: const [
            //           ChatComponent(),
            //           RequestsComponent(),
            //           // Other tab views
            //         ],
            //         height: 580.h,
            //       )
            //     :
            SizedBox(height: 630.h, child: ChatComponent()),
          ],
        ),
      ),
    );
  }
}
