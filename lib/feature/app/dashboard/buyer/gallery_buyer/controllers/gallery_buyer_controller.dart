import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GalleryBuyerController extends GetxController {
  static GalleryBuyerController get to => Get.find<GalleryBuyerController>();

  RxBool loading = true.obs;

  late Position currentPosition;
  late GoogleMapController mapController;
  Set<Marker> markers = <Marker>{};

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
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
