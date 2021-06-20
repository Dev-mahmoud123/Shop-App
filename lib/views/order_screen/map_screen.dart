import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/views/order_screen/widget/bottom_sheet_function.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng latLng;
  CameraPosition _cameraPosition;
  GoogleMapController _controller;
  TextEditingController locationController = TextEditingController();
  Set<Marker> _markers = {};
  List<Address> result = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraPosition = CameraPosition(target: LatLng(0.0, 0.0), zoom: 10.0);
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Map'),
        backgroundColor: defaultColor,
        actions: [
          TextButton(
            onPressed: () {
              displayBottomSheet(context);
            },
            child: Text(
              'Add Address',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          (latLng != null)
              ? GoogleMap(
                  initialCameraPosition: _cameraPosition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                    _controller.animateCamera(
                        CameraUpdate.newCameraPosition(_cameraPosition));
                  },
                  markers: _markers,
                )
              : Container(),
          Positioned(
            top: 50.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller: locationController,
                decoration: InputDecoration(
                  icon: Container(
                    margin: EdgeInsets.only(left: 20, top: 0),
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                  ),
                  hintText: "pick up",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getCurrentPosition() async {
    bool isServiceEnabled;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    // ignore: unrelated_type_equality_checks
    if (permission != PermissionStatus.granted) {
      permission = await Geolocator.requestPermission();
      // ignore: unrelated_type_equality_checks
      if (permission != PermissionStatus.granted) getLocation();
      return;
    }
    getLocation();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);

    setState(
      () {
        latLng = new LatLng(position.latitude, position.longitude);
        _cameraPosition = CameraPosition(target: latLng, zoom: 11.0);
        if (_controller != null) {
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
          _markers.add(
            Marker(
                markerId: MarkerId('a'),
                draggable: true,
                flat: true,
                visible: true,
                position: latLng,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                onDragEnd: (_currentLatLng) {
                  latLng = _currentLatLng;
                }),
          );
        }
      },
    );
    getCurrentAddress();
  }

  void getCurrentAddress() async {
    final coordinates = new Coordinates(latLng.latitude, latLng.longitude);
    result = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = result.first;
    if (first != null) {
      var address;
      address = first.featureName;
      address = '$address, ${first.subLocality}';
      address = '$address, ${first.subLocality}';
      address = '$address, ${first.locality}';
      address = '$address, ${first.countryName}';
      address = '$address, ${first.postalCode}';
      locationController.text = address;
    }
  }

}
