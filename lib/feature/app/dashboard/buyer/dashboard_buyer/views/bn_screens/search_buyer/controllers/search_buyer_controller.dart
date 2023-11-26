import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/search_buyer/use_case/search_use_case.dart';
import 'package:haraj/feature/app/profile/seller/add_address_seller/controller/add_address_seller_controller.dart';
import 'package:haraj/utils/api_controller/general_api_controller.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';
import 'package:haraj/utils/repository/search_repo/search_repo.dart';

import '../../../../../../../../../utils/errors/error_const.dart';
import '../../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../../utils/models/ads_model/ads_model.dart';
import '../../../../../../../../../utils/models/car_properties/car_properties.dart';
import '../../../../../../../../../utils/models/general/general_model.dart';
import '../../../../../../../../../utils/models/governorates_model/citiey_model.dart';
import '../../../../../../../../../utils/models/meta/meta_model.dart';
import '../../../../../../seller/dashboard_seller/views/bn_screens/add_ads_seller/use_case/get_properties_use_case.dart';

class SearchBuyerController extends GetxController {
  static SearchBuyerController get to => Get.find<SearchBuyerController>();

  RxBool loading = false.obs;
  RxBool isFavorite = false.obs;
  RxBool isFavoriteLoading = false.obs;
  RxInt fuelId = 0.obs, cityId = 0.obs, governorateId = 0.obs, brandId = 0.obs;
  RxString keyword = "".obs;
  var responseMessage = "";
  RxList<Data> ads = <Data>[].obs;
  Meta meta = Meta();
  late ScrollController scrollController;
  List<CityModel> get selectedCities =>governorateId.value==0? [] :
  AddAddressSellerController.to.emirates.firstWhere((element) => element.id == governorateId.value).cities!;
  late TextEditingController keyWordController;




  Future<void> getIndexAds({ pageNumber = 1}) async {
    loading.value = true;
    return await SearchUseCase(repository: Get.find<SearchRepository>())
        .call(fuelId.value, cityId.value, governorateId.value, brandId.value, keyword.value, pageNumber)
        .then((value) => value.fold((failure) {
      responseMessage = mapFailureToMessage(failure);
      loading.value = false;
      Get.snackbar(
        'Requires',
        responseMessage,
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (response) async {
      ads.addAll(response.data ?? []);
      meta = response.meta!;
      loading.value = false;
    }));
  }


  late CarProperties carProperties = CarProperties();
  RxMap<String, GeneralModel> selectedData = {
    // "price":GeneralModel(),
    "brand_id": GeneralModel(),
    "car_id": GeneralModel(),
    "body_id": GeneralModel(),
    "mechanical_status_id": GeneralModel(),
    "standard_id": GeneralModel(),
    "general_status_id": GeneralModel(),
    "fuel_id": GeneralModel(),
    "gear_id": GeneralModel(),
    "driving_side_id": GeneralModel(),
    "seller_type_id": GeneralModel(),
    "technical_advantage_id": GeneralModel(),
    "seat_id": GeneralModel(),
    "cylinder_id": GeneralModel(),
    "door_id": GeneralModel(),
    "category_id": GeneralModel(),
    "engine_id": GeneralModel(),
    // "distance":GeneralModel(),
    "out_color": GeneralModel(),
    "in_color": GeneralModel(),
    "guarantee": GeneralModel(),
    "finance": GeneralModel(),
    "exportable": GeneralModel(),
  }.obs;

  @override
  void onInit() {
    keyWordController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    getCarProperties();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.removeListener(_listener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
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
  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (meta.currentPage! < meta.lastPage!) {
        getIndexAds(pageNumber: (meta.currentPage??0)+1);
      }
    }
  }
}
