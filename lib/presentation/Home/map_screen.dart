import 'dart:async';

import 'package:enivronment/data/controller/epicenter/all_epicenter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AllEpicenterController>(
      builder: (controller) {
        return Obx(() => GoogleMap(
              mapType: MapType.hybrid,
              polylines: Set<Polyline>.of(controller.polylines.value.values),
              markers: Set<Marker>.of(controller.markerss.value),
              initialCameraPosition: CameraPosition(
                target: LatLng(controller.locationData!.latitude!,
                    controller.locationData!.longitude!),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ));
      },
    ), floatingActionButton: GetBuilder<AllEpicenterController>(
      builder: (con) {
        return FloatingActionButton(
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
        );
      },
    ));
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
