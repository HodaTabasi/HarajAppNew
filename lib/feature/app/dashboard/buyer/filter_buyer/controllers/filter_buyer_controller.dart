import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FilterBuyerController extends GetxController {
  static FilterBuyerController get to => Get.find<FilterBuyerController>();

  RxBool loading = true.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString title = "Production Year".obs;

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.overlayContext!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1993),
      lastDate: DateTime(2201),
      initialDatePickerMode: DatePickerMode.year, // Set the mode to year
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      title.value = DateFormat.y().format(picked);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
