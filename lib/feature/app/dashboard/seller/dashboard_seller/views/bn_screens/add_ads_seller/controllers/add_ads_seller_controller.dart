import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/use_case/add_ads_seller_use_case.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/use_case/get_properties_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../utils/models/car_properties/car_properties.dart';
import '../../../../../../../../../utils/models/general/general_model.dart';
import '../../../../../../../../../utils/models/seller_info/image.dart';

class AddAdsSellerController extends GetxController {
  static AddAdsSellerController get to => Get.find<AddAdsSellerController>();

  RxBool loading = true.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString title = "Production Year".obs;
  final ImagePicker picker = ImagePicker();
  List<XFile>? imageFileList = [];
  RxList<MyImage>? imageGalaryList = <MyImage>[].obs;

  void makeImageGallery() {
    for(var file in imageFileList!){
      imageGalaryList?.add(MyImage(1, file.path,true));
    }
    imageFileList?.clear();
    update();
  }

  void updateSelected(int index, bool value) {
    imageGalaryList![index].isSelected = value;
    update();
  }

  deleteImageFromGallery(){
    imageGalaryList?.removeWhere((element) => element.isSelected!);
    update();
  }

  late PageController pageController;
  int currentPage = 0;

  late TextEditingController carPriceController;
  late TextEditingController kilometerController;
  late TextEditingController carDetailsController;

  late CarProperties carProperties =CarProperties();
  Map<String , GeneralModel> selectedData =
  {
    "price":GeneralModel(),
    "brand_id":GeneralModel(),
    "car_id":GeneralModel(),
    "body_id":GeneralModel(),
    "mechanical_status_id":GeneralModel(),
    "standard_id":GeneralModel(),
    "general_status_id":GeneralModel(),
    "fuel_id":GeneralModel(),
    "gear_id":GeneralModel(),
    "driving_side_id":GeneralModel(),
    "seller_type":GeneralModel(),
    "technical_advantage_id":GeneralModel(),
    "seat_id":GeneralModel(),
    "cylinder_id":GeneralModel(),
    "door_id":GeneralModel(),
    "category_id":GeneralModel(),
    "engine_id":GeneralModel(),
    "distance":GeneralModel(),
    "out_color":GeneralModel(),
    "in_color":GeneralModel(),
    "guarantee":GeneralModel(),
    "finance":GeneralModel(),
    "exportable":GeneralModel(),
  };

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
      makeImageGallery();

      debugPrint(
          'Selected image from gallery💯: ${imageFileList!.length.toString()}');
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    carPriceController = TextEditingController();
    kilometerController = TextEditingController();
    carDetailsController = TextEditingController();
    getCarProperties();
    // addStoreAds();
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
        .call(imageGalaryList!,selectedData,carPriceController.text,title.value,kilometerController.text,carDetailsController.text)
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

  getCarProperties() async {
    return GetPropertiesUseCase(repository: Get.find<AdsRepository>())
        .call()
        .then((value) => value.fold((failure) {
      responseMessage = mapFailureToMessage(failure);
      Get.snackbar(
        'Requires',
        responseMessage,
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (response) async {
          carProperties = response;
          print("gfgh ${carProperties.brands}");
    }));
  }
}
