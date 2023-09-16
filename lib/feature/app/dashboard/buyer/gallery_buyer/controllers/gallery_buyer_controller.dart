import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haraj/feature/app/dashboard/buyer/gallery_buyer/use_case/store_post_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/repository/store_repo/store_repo.dart';

class GalleryBuyerController extends GetxController {
  GalleryBuyerController({required this.storeId}); // Add this constructor
  final int storeId; // Add this line to store the productId

  static GalleryBuyerController get to => Get.find<GalleryBuyerController>();

  RxBool loading = false.obs;

  late Position currentPosition;
  late GoogleMapController mapController;
  Set<Marker> markers = <Marker>{};

  var responseMessage = "";
  RxList<PostModel> storePost = <PostModel>[].obs;
  Meta meta = Meta();
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    getData();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    getStorePost();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (meta.currentPage! < meta.lastPage!) {
        getStorePost(pageNumber: meta.currentPage);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getData() async {
    loading.value = true;
    await determinePosition();
    // setMarker(currentPosition.latitude, currentPosition.longitude);
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

  Future<void> setMarker(
      String markerId, String title, double latitude, double longitude) async {
    markers.add(
      Marker(
        markerId: MarkerId(markerId),
        visible: true,
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
          title: title,
        ),
      ),
    );
  }

  CameraPosition initialCameraPosition(double latitude, double longitude) {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15,
    );
  }

  Future<void> getStorePost({pageNumber = 1}) async {
    loading.value = true;
    return StorePostShowUseCase(repository: Get.find<StoreRepository>())
        .call(storeId, pageNumber)
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
              storePost.addAll(response.data ?? []);
              meta = response.meta!;
              loading.value = false;
            }));
  }
}
