import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/governorates_model/citiey_model.dart';
import 'package:haraj/utils/models/seller_info/address_model.dart';
import 'package:haraj/utils/models/seller_info/seller_user_model.dart';

import '../../../../../../utils/errors/error_const.dart';
import '../../../../../../utils/models/governorates_model/country.dart';
import '../../../../../../utils/models/governorates_model/governorate_model.dart';
import '../../../../../../utils/prefs/shared_pref_controller.dart';
import '../../../../../../utils/repository/complete_user_repo.dart';
import '../../../../../../utils/repository/general_repo.dart';
import '../use_case/complete_store_use_case.dart';
import '../use_case/get_governortates_use_case.dart';

class AddAddressSellerController extends GetxController {
  var responseMessage = "";

  static AddAddressSellerController get to =>
      Get.find<AddAddressSellerController>();

  RxBool loading = false.obs;

  late Position currentPosition;
  late GoogleMapController mapController;
  Set<Marker> markers = <Marker>{};
  RxString currentAddress = "".obs;
  LatLng? center;

  RxBool showEmirates = true.obs;
  String currentState = 'emirate';

  List<GovernorateModel> emirates = [];

  RxList<CityModel> cities = <CityModel>[].obs;

  RxList<Country> currentList = <Country>[].obs;

  int? cityId;
  int? emiraId;

  Rx<String?> city = "".obs;
  Rx<String?> emira = "".obs;

  int selectedRadio = 0;
  bool fromEditPage = false;


  Address get address => Address(
      lng: center?.longitude,
      lat: center?.latitude,
      street: nameStreetController.text,
      governorateId: emiraId,
    buildingNo: buildNumberController.text,
    postCode: postalCodeController.text,
    cityId: cityId
  );

  int getValue(index) {
    return showEmirates.value ? emirates[index].id! : cities[index].id!;
  }

  void toggleList(String title) {
    if (title != currentState) {
      currentState = title;
      showEmirates.toggle();
      selectedRadio = showEmirates.value ? emiraId ?? 0 : cityId ?? 0;
      currentList.value = showEmirates.value ? emirates : cities.value;
    }
  }

  late TextEditingController nameStreetController;
  late TextEditingController buildNumberController;
  late TextEditingController postalCodeController;

  putDataToTextField({SellerUserModel? user}) {
    if (user != null) {
      nameStreetController.text = user.store!.address!.street!;
      buildNumberController.text = user.store!.address!.buildingNo!;
      postalCodeController.text = user.store!.address!.postCode!;
      cityId = user.store!.address!.cityId!;
      emiraId = user.store!.address!.governorateId!;
      selectedRadio = emiraId ?? 0;
      city.value = user.store!.address!.city!.name;
      emira.value = user.store!.address!.governorate!.name;
      fromEditPage = true;
      center = LatLng(user.store!.address!.lng!, user.store!.address!.lng!);
    } else {
      nameStreetController = TextEditingController();
      buildNumberController = TextEditingController();
      postalCodeController = TextEditingController();
      getGovernorate();
      getData();
      fromEditPage = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    putDataToTextField();
  }

  @override
  void dispose() {
    nameStreetController.dispose();
    buildNumberController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }

  void clear() {
    nameStreetController.clear();
    buildNumberController.clear();
    postalCodeController.clear();
  }

  Future<bool?> performAddress() async {
    loading.value = true;
    if (checkData()) {
      return await completeAddress();
    }

  }

  Future<void> getGovernorate() async {
    return GetGovernorateUseCase(repository: Get.find<GeneralRepository>())
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
              emirates = response.data!;
              cities.value = emirates[0].cities!;
              currentList.value = emirates;
              // SharedPrefController().isCompleteAddress = false;
              // Get.to(() => AddAddressSellerScreen());
            }));
  }

  bool checkData() {
    if (nameStreetController.text.isNotEmpty &&
        buildNumberController.text.isNotEmpty &&
        postalCodeController.text.isNotEmpty) {
      return true;
    }
    Get.snackbar(
      'Requires',
      'Enter Required',
      backgroundColor: ColorResource.red,
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  Future<void> getData() async {
    loading.value = true;
    await determinePosition();
    setMarker(currentPosition.latitude, currentPosition.longitude);
    loading.value = false;
  }

  Future<void> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    if (!serviceEnabled) {
      debugPrint("Location in disable");
      permission = await Geolocator.requestPermission();
      return gitCurrentLocation();
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        debugPrint("Location in denied");
        permission = await Geolocator.requestPermission();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      debugPrint("Location in denied forever");
      await Geolocator.openAppSettings();
      return;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      debugPrint("Location in whileInUse or always");
      return gitCurrentLocation();
    }

    await gitCurrentLocation();
  }

  Future<void> gitCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    debugPrint('CurrentLocation 💯 =>$position');
    currentPosition = position;
  }

  Future<void> setMarker(double latitude, double longitude) async {
    markers.add(
      Marker(
        markerId: const MarkerId('my_current_location'),
        visible: true,
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(latitude, longitude),
        infoWindow: const InfoWindow(
          title: 'My Current Location',
        ),
      ),
    );
  }

  CameraPosition initialCameraPosition() {
    return CameraPosition(
      target: LatLng(currentPosition.latitude, currentPosition.longitude),
      zoom: 15,
    );
  }

  Future<bool> completeAddress() async {
    return await CompleteAddressUseCase(
            repository: Get.find<CompletePersonalInfoRepo>())
        .call(address)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
              loading.value = false;
              return false;
            }, (user) async {
              loading.value = false;
              if (fromEditPage) {
                Get.back();
                return false;
              } else {
                SharedPrefController().isCompleteAddress = true;
                return true;
              }

              // Get.to(() => AddAddressSellerScreen());
            }));
  }

  void selectId(int? value) {
    showEmirates.value ? emiraId = value! : cityId = value!;
  }
}
