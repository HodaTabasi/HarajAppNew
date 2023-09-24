import 'package:flutter/material.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/general/general_model.dart';

import '../feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/controllers/add_ads_seller_controller.dart';

class AppSwitchButton extends StatefulWidget {
  String? mapKey;
  final bool? isSold;
  AppSwitchButton({this.mapKey,this.isSold = false});

  @override
  _AppSwitchButtonState createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  bool _isSwitchOn = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitchOn = value;
      if(widget.mapKey != null){
        GeneralModel m = GeneralModel();
        if(_isSwitchOn){
          m.id = 1;
        }else {
          m.id = 0;
        }
        AddAdsSellerController.to.selectedData[widget.mapKey!] = m;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      // value: _isSwitchOn,
      value: widget.mapKey!= null?_isSwitchOn:widget.isSold!,
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
