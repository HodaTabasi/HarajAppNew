import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/widgets/app_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double imageHeight;
  final bool showSearch;
  final TextEditingController? searchController;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.imageHeight,
    this.showSearch = false,
    this.searchController,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppImage(
          imageName: ImagesApp.appBarBackground, // Replace with your image name
          width: double.infinity,
          height: imageHeight,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: Text(title),
            ),
            if (showSearch)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
