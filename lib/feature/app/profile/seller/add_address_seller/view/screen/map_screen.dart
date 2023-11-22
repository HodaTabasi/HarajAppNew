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

  GoogleMapController? mapController;

   CameraPosition currentCameraPosition = const CameraPosition(target: LatLng(15.508457, 32.522854), zoom: 18);

  LatLng? center;


  onCameraMove(CameraPosition position) {
    addAddressSellerController.center = position.target;
    addAddressSellerController.markers.clear();
    addAddressSellerController.markers.add(Marker(
      markerId: MarkerId(position.target.toString()),
      position: position.target,
      infoWindow: const InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    currentCameraPosition = position;
    setState(() {

    });
  }

  onCameraIdle() {
    _getAddressFromLatLng();
    print("On Camera Idle method");
  }
  @override
  void initState() {
    print('asdasd');
    print(addAddressSellerController.center);
    print('asdasd');
    if(addAddressSellerController.center != null){
      print(addAddressSellerController.center);
      currentCameraPosition = CameraPosition(target: addAddressSellerController.center!);
    }
    super.initState();
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
                myLocationButtonEnabled: true,
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

                initialCameraPosition: currentCameraPosition,
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(
                          () => PanGestureRecognizer())),
                onTap: (argument) {
                 mapController?.animateCamera(CameraUpdate.newLatLngZoom(
                     argument, 18));
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
      mapController = controller;
      addAddressSellerController.mapController = controller;
    });
    if(addAddressSellerController.center != null) {
      mapController?.animateCamera(CameraUpdate.newLatLngZoom(
        addAddressSellerController.center!, 18));
    }
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
      debugPrint(e.toString());
    });
  }

}
