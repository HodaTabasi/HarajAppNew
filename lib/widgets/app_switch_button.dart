import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/general/general_model.dart';

import '../feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/add_contact_information_seller/controllers/add_contact_information_seller_controller.dart';
import '../feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/controllers/add_ads_seller_controller.dart';

class AppSwitchButton extends StatefulWidget {
  String? mapKey;
  final bool? isSold;
  String? postId;
  final void Function(String postId)? onSold;
  AppSwitchButton({this.mapKey, this.isSold = false, this.postId, this.onSold});

  @override
  _AppSwitchButtonState createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  bool _isSwitchOn = false;

  @override
  void initState() {
    super.initState();
    // Set the initial switch state based on isSold
    _isSwitchOn = widget.isSold == true;
  }

  void _toggleSwitch(bool value) {
    setState(() {
      if (widget.mapKey != null) {
        switch(widget.mapKey){
          case 'facebook':
            AddContactInformationSellerController.to.facebook = value;
            break;
          case 'whatsapp':
            AddContactInformationSellerController.to.whatsApp = value;
            break;
          case 'phone':
            AddContactInformationSellerController.to.mobile = value;
            break;
          case 'chat':
            AddContactInformationSellerController.to.chat = value;
            break;
        }
        GeneralModel m = GeneralModel();
        if (value) {
          m.id = 1;
        } else {
          m.id = 0;
        }
        AddAdsSellerController.to.selectedData[widget.mapKey!] = m;
      }

      // If isSold is true, always keep the switch on and show the message
      if (widget.isSold == true) {
        _isSwitchOn = true;
        Get.snackbar(
          'Unfortunately',
          'The car is sold.',
          backgroundColor: ColorResource.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        // Check if the switch is toggled from false to true
        if (!_isSwitchOn && value && widget.onSold != null) {
          widget.onSold!(widget.postId!);
        }
        print(!_isSwitchOn);
        _isSwitchOn = !_isSwitchOn;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      // value: _isSwitchOn,
      value: widget.mapKey != null || widget.postId != null
          ? _isSwitchOn
          : widget.isSold!,
      onChanged: _toggleSwitch,
      activeColor: ColorResource.white, // Color when switch is on
      activeTrackColor:
          ColorResource.green, // Color of the switch track when switch is on
      inactiveThumbColor:
          ColorResource.white, // Color of the switch thumb when switch is off
      inactiveTrackColor:
          ColorResource.gray, // Color of the switch track when switch is off
      materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap, // Make the switch smaller
    );
  }
}
