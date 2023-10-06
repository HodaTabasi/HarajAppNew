import 'package:get/get.dart';
import 'package:haraj/utils/repository/general_repo.dart';

import '../../../../utils/errors/error_const.dart';
import '../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../utils/models/setting/setting.dart';
import '../use_case/get_setting_use_case.dart';

class SettingGetXController extends GetxController{
  var responseMessage = "";
  SettingModel? settingModel;

  static SettingGetXController get to => Get.find<SettingGetXController>();

  @override
  void onInit() {
    super.onInit();
    getSetting();
  }

  getSetting(){
    return GetSettingUseCase(repository: Get.find<GeneralRepository>())
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
          settingModel = response;
    }));
  }
}