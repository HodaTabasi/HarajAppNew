import 'package:get/get.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';

class LanguageGetxController extends GetxController {
  static LanguageGetxController get to => Get.find<LanguageGetxController>();
  RxString language = 'en'.obs;

  @override
  void onInit() {
    language.value = SharedPrefController().language;
    super.onInit();
  }

  void changeLanguage() {
    language.value = language.value == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(language: language.value);
  }
}
