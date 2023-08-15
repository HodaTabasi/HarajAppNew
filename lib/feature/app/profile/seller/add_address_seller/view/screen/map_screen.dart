part of add_address_seller_view;

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  AddAddressSellerController addAddressSellerController =
      Get.put(AddAddressSellerController());

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
                initialCameraPosition:
                    addAddressSellerController.initialCameraPosition(),
                onMapCreated: onMapCreated,
                markers: addAddressSellerController.markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                compassEnabled: false,
                // onTap: onTapMap,
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
                child: DoneButton(
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
}
