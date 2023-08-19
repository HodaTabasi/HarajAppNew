import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_popup_menu_item.dart';

class AppPopupMenuButton extends StatefulWidget {
  final List<AppPopupMenuItem> menuItems;
  final void Function(int) onSelected;

  AppPopupMenuButton({required this.menuItems, required this.onSelected});

  @override
  State<AppPopupMenuButton> createState() => _AppPopupMenuButtonState();
}

class _AppPopupMenuButtonState extends State<AppPopupMenuButton> {
  int? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      offset: const Offset(20, 40),
      shadowColor: ColorResource.gray,
      color: ColorResource.white,
      surfaceTintColor: ColorResource.white,
      iconSize: 20.w,
      elevation: 1,
      padding: EdgeInsets.zero,
      initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      onSelected: widget.onSelected,
      icon: const Icon(
        Icons.more_vert_rounded,
        color: ColorResource.black,
      ),
      itemBuilder: (context) {
        return widget.menuItems.map((item) {
          return item; // Return each CustomPopupMenuItem instance
        }).toList();
      },
    );
  }
}
