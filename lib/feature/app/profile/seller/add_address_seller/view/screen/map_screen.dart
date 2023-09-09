part of add_address_seller_view;

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  AddAddressSellerController addAddressSellerController =
      Get.find();
  String _currentAddress = '';
  // Position? _currentPosition;
  var camera;
  bool isLoading = false;

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();

  final ValueNotifier<CameraPosition> currentCameraPosition = ValueNotifier(
  const CameraPosition(target: LatLng(15.508457, 32.522854), zoom: 18));

  LatLng? center;


  onCameraMove(CameraPosition position) {
    print("On Camera Move method $position");

    currentCameraPosition.value = position;
  }

  onCameraIdle() {
    print("On Camera Idle method");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: GoogleMap(
                mapType: MapType.normal,
                padding: EdgeInsets.all(1.w),
                // initialCameraPosition:
                //     addAddressSellerController.initialCameraPosition(),
                onMapCreated: onMapCreated,
                markers: addAddressSellerController.markers,
                myLocationButtonEnabled: false,
                compassEnabled: false,
                minMaxZoomPreference: const MinMaxZoomPreference(8, 19),
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                scrollGesturesEnabled: true,
                mapToolbarEnabled: false,
                rotateGesturesEnabled: false,
                tiltGesturesEnabled: false,
                myLocationEnabled: true,
                onCameraMove: onCameraMove,
                onCameraIdle: onCameraIdle,
                initialCameraPosition: currentCameraPosition.value,

                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(
                          () => PanGestureRecognizer())),
                onTap: (argument) {
                 addAddressSellerController.center = argument;
                  addAddressSellerController.markers.clear();
                  addAddressSellerController.markers.add(Marker(
                    markerId: MarkerId(argument.toString()),
                    position: argument,
                    infoWindow: const InfoWindow(
                      //popup info
                      title: 'My Custom Title ',
                      snippet: 'My Custom Subtitle',
                    ),
                    icon: BitmapDescriptor.defaultMarker,
                  ));
                  _getAddressFromLatLng();
                  setState(() {});
                },
              ),

            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: CircleAvatar(
                radius: 15.r,
                backgroundColor: ColorResource.gray,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    size: 14.w,
                    color: ColorResource.mainColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SaveButton(
                  title: context.localizations.completed,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      addAddressSellerController.mapController = controller;
    });
  }

  Future<void> _getAddressFromLatLng() async {
    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    await placemarkFromCoordinates(addAddressSellerController.center!.latitude, addAddressSellerController.center!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        addAddressSellerController.currentAddress.value =
        '${place.street}, ${place.subLocality}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

}
