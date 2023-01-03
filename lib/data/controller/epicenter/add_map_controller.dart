import 'dart:async';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddEpicenterMapCtrl extends GetxController {
  static AddEpicenterMapCtrl to = Get.find();
  Completer<GoogleMapController> compeleteController = Completer();
  final loading = true.obs;
  final markers = <Marker>{}.obs;
  final markLat = 0.0.obs;
  final markLong = 0.0.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    loading.value = true;
    await getLocation();
    markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(locationData!.latitude!, locationData!.longitude!),
        infoWindow: InfoWindow(
          title: 'current location'.tr,
        ),
        // icon: BitmapDescriptor.fromBytes(markerIcon),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    loading.value = false;
  }

  Marker mark = const Marker(
    markerId: MarkerId("0"),
  );
  bool isClicked = false;

  Future<void> animateCamera(LocationData location) async {
    final GoogleMapController controller = await compeleteController.future;
    CameraPosition cameraPostion = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(
          location.latitude!,
          location.longitude!,
        ),
        zoom: 16.4746);

    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPostion));
  }

  double calculateDistance(lat1, long1, lat2, long2) {
    var d1 = lat1 * (math.pi / 180.0);
    var num1 = long1 * (math.pi / 180.0);
    var d2 = lat2 * (math.pi / 180.0);
    var num2 = long2 * (math.pi / 180.0) - num1;
    var d3 = math.pow(math.sin((d2 - d1) / 2.0), 2.0) +
        math.cos(d1) * math.cos(d2) * math.pow(math.sin(num2 / 2.0), 2.0);
    return 6376500.0 * (2.0 * math.atan2(math.sqrt(d3), math.sqrt(1.0 - d3)));
  }

  void setMarker(LatLng location) {
    Marker newMarker = Marker(
        markerId: MarkerId(location.toString()),
        icon: BitmapDescriptor.defaultMarker,
        position: location,
        onTap: () {});
    mark = newMarker;
    update();
  }

  void clicked() {
    isClicked = true;
    update();
  }

  final Location location = Location();

  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  getLocation() async {
    if (permissionGranted == null || locationData == null) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      return locationData = await location.getLocation();
    }
  }

  addMarkers(double? lat, double? long) async {
    markers.assign(
      Marker(
        markerId: const MarkerId("2"),
        position: LatLng(lat!, long!),
        infoWindow: InfoWindow(
          title: 'Epicenter'.tr,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    return markers;
  }

  setEpicenterLocation(double lat, double long) {
    markLat.value = lat;
    markLong.value = long;
    print(markLat.value);
    update();
  }
}
