import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class AddAddressSellerController extends GetxController {
  static AddAddressSellerController get to =>
      Get.find<AddAddressSellerController>();

  RxBool loading = false.obs;

  late Position currentPosition;
  late GoogleMapController mapController;
  Set<Marker> markers = <Marker>{};

  RxBool showEmirates = true.obs;
  String currentState = 'emirate';

  List<String> emirates = [
    'أبو ظبي',
    'دبي',
    'الشارقة',
    'عجمان',
    'أم القيوين',
    'رأس الخيمة',
    'الفجيرة',
  ];

  List<String> cities = [
    'أبو ظبي',
    'دبي',
    'الشارقة',
    'عجمان',
    'أم القيوين',
    'رأس الخيمة',
    'الفجيرة',
    'خورفكان',
    'كلباء',
    'العين',
    'العذيبة',
    'الظفرة',
    'المدام',
    'الرويس',
    'حتا',
    'خدمة الزاهية',
    'دبا الفجيرة',
    'دبا الحصن',
    'المدينة الشيخ خليفة الطبية',
    'المدينة محمد بن زايد',
    'الوقن',
    'نعمة',
    'قدفع',
    'رأس الخور',
    'رماح',
    'شعب الينابيع',
    'ظفارة',
    'سلمة',
    'شحن',
    'صيدا',
    'صورفل',
    'تنورة',
    'ميناء زايد',
    'مطرح',
    'مرفأ خليفة',
    'زايد الصناعية',
    'مدينة زايد',
    'جبل علي',
    'جبل حفيت',
    'شحة',
    'وادي غلام',
    'يس',
    'ليوا',
    'كيمة',
    'واحة مدبي',
    'العزيزية',
  ];

  RxList<String> currentList = <String>[].obs;

  void toggleList(String title) {
    if (title != currentState) {
      currentState = title;
      showEmirates.toggle();
      currentList.value = showEmirates.value ? emirates : cities;
    }
  }

  late TextEditingController nameStreetController;
  late TextEditingController buildNumberController;
  late TextEditingController postalCodeController;

  @override
  void onInit() {
    super.onInit();
    nameStreetController = TextEditingController();
    buildNumberController = TextEditingController();
    postalCodeController = TextEditingController();
    getData();
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

  Future<void> performRegister() async {
    loading.value = true;
    if (checkData()) {
      // await completeProfile();
    }
    loading.value = false;
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
}
