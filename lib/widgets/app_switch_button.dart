import 'package:flutter/material.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class AppSwitchButton extends StatefulWidget {
  @override
  _AppSwitchButtonState createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  bool _isSwitchOn = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitchOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitchOn,
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
