import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/use_case/add_ads_seller_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddAdsSellerController extends GetxController {
  static AddAdsSellerController get to => Get.find<AddAdsSellerController>();

  RxBool loading = true.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString title = "Production Year".obs;
  final ImagePicker picker = ImagePicker();
  List<XFile>? imageFileList = [];

  late PageController pageController;
  int currentPage = 0;

  late TextEditingController carPriceController;
  late TextEditingController kilometerController;

  var responseMessage = "";

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.overlayContext!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1993, 1),
      lastDate: DateTime(2201),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      title.value = DateFormat.yMMMd().format(picked);
    }
  }

  void selectImages() async {
    final List<XFile> selectedImages = await picker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      // Calculate how many more images can be added to reach the limit of 10.
      final remainingSlots = 10 - imageFileList!.length;

      // Only add as many images as there are remaining slots.
      imageFileList!.addAll(selectedImages.take(remainingSlots));

      debugPrint(
          'Selected image from gallery💯: ${imageFileList!.length.toString()}');
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    carPriceController = TextEditingController();
    kilometerController = TextEditingController();
    addStoreAds();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    carPriceController.dispose();
    kilometerController.dispose();
    super.dispose();
  }

  void clear() {
    carPriceController.clear();
    kilometerController.clear();
  }

  Future<void> addStoreAds() async {
    return AddAdsSellerUseCase(repository: Get.find<AdsRepository>())
        .call(
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "1",
          "2023",
          "1",
          "1500",
          "1",
          "1",
          "details",
          "true",
          "true",
          "true",
          "0592659279",
          "facebook",
          "true",
          "true",
          "true",
          "true",
        )
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              print("mmm Add Ads Detail Buyer Controller 💯=>  ");
            }));
  }
}
