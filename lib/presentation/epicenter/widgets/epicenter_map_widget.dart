import 'dart:async';
import 'package:enivronment/data/controller/epicenter/add_epicenter_controller.dart';
import 'package:enivronment/data/controller/epicenter/add_map_controller.dart';
import 'package:enivronment/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EpiCenterMapScreen extends StatefulWidget {
  const EpiCenterMapScreen({super.key});

  @override
  State<EpiCenterMapScreen> createState() => EpiCenterMapScreenState();
}

class EpiCenterMapScreenState extends State<EpiCenterMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEpicenterController>(
      builder: (con) {
        return Scaffold(
            body: Obx(() => con.loading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GoogleMap(
                        mapType: MapType.hybrid,
                        markers: Set<Marker>.of(con.markers.value),
                        initialCameraPosition: CameraPosition(
                          target: LatLng(con.locationData!.latitude!,
                              con.locationData!.longitude!),
                          zoom: 14.4746,
                        ),
                        onTap: (location) {
                          con.addMarkers(location.latitude, location.longitude);
                          con.setEpicenterLocation(
                              location.latitude, location.longitude);
                          print(location);
                          con.setMarker(location);
                          con.clicked();
                        },
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              print(con.markLat.value);
                              print(con.markLong.value);
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorManager.secondary),
                              child: Center(
                                  child: Obx(
                                () => Text(
                                  (con.markLat.value ==
                                              con.locationData!.latitude &&
                                          con.markLong.value ==
                                              con.locationData!.longitude)
                                      ? "current location".tr
                                      : "Add location".tr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                            ),
                          )),
                    ],
                  )),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorManager.lightPrimary,
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        bearing: 192.8334901395799,
                        target: LatLng(con.locationData!.latitude!,
                            con.locationData!.longitude!),
                        tilt: 59.440717697143555,
                        zoom: 19.151926040649414)));
              },
              child: const Icon(Icons.directions),
            ));
      },
    );
  }

// Future<void> _goToTheLake() async {
//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(controller.locationData!.latitude!, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414)));
// }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../../../../app/current_location_controller.dart';
// import '../../../../data/controller/epicenter/add_epicenter_controller.dart';
// import '../../../../data/controller/epicenter/add_map_controller.dart';
// import '../../resources/color_manager.dart';
// import '../../resources/font_manager.dart';
// import '../../resources/size_manager.dart';
// import '../../resources/styles_manager.dart';
// import '../../resources/values_manager.dart';
//
// // ignore: must_be_immutable
// class EpiCenterMapScreen extends StatelessWidget {
//   const EpiCenterMapScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final currentLocation = Get.put(CurrentLocationController());
//     return GetBuilder<AddEpicenterMapCtrl>(
//         init: AddEpicenterMapCtrl(),
//         builder: (mapCtrl) {
//           return GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: LatLng(
//                   currentLocation.currentLat, currentLocation.currentLong),
//               zoom: 20,
//             ),
//             mapType: MapType.satellite,
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             onTap: (location) {
//               mapCtrl.setMarker(location);
//               mapCtrl.clicked();
//             },
//             markers: mapCtrl.mark.markerId == const MarkerId("0")
//                 ? {}
//                 : {mapCtrl.mark},
//
//             onMapCreated: (GoogleMapController controller) {
//               mapCtrl.compeleteController.complete(controller);
//             },
//           );
//         });
//   }
// }
