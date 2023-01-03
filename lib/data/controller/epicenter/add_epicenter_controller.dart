import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:enivronment/data/network/polluation_sources_service.dart';
import 'package:enivronment/data/network/region_service.dart';
import 'package:enivronment/domain/model/polluation_sources/polluation_sources_model.dart';
import 'package:enivronment/presentation/resources/color_manager.dart';
import 'package:enivronment/presentation/resources/strings_manager.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../app/constants.dart';
import '../../../rejon_model.dart';

class AddEpicenterController extends GetxController {
  String description = Constants.empty;
  double epicenterSize = Constants.emptyDouble;
  String reason = Constants.empty;
  RxBool loading = true.obs;
  final polluationSourcesIds = <int>[].obs;
  final load = true.obs;
  final allPolluationSources = <PolluationSourcesModel>[].obs;
  final items = <MultiSelectItem<PolluationSourcesModel>>[].obs;
  final regionText = 'Region'.tr.obs;
  final cityText = 'Cities'.tr.obs;
  final regionId = 0.obs;
  final cityId = 0.obs;
  final allregion = <CitiesModel>[].obs;
  final cities = <CitiesModel>[].obs;
  final servicess = RegionService();
  Completer<GoogleMapController> compeleteController = Completer();
  final markers = <Marker>{}.obs;
  final markLat = 0.0.obs;
  final markLong = 0.0.obs;
  final isClicked = false.obs;
  Marker mark = const Marker(
    markerId: MarkerId("0"),
  );
  final send = false.obs;

  @override
  Future<void> onInit() async {
    loading.value = true;
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
    await getAllPolluationSources();
    allregion.value = (await servicess.getRegion())!;
    loading.value = false;
  }

  void changeDescription(String? value) {
    description = value ?? Constants.empty;
    update();
  }

  void changeEpicenterSize(String? value) {
    epicenterSize = double.parse(value ?? "0.0");
    update();
  }

  void changeReason(String? value) {
    reason = value ?? Constants.empty;
    update();
  }

  List<File> imagesList = [];

  Future pickImagesFormGallery() async {
    try {
      List<XFile>? imagesFromGallery = await ImagePicker().pickMultiImage(
        maxHeight: 600,
        maxWidth: 600,
        imageQuality: 50,
      );

      for (var i = 0; i < imagesFromGallery!.length; i++) {
        imagesList.add(File(imagesFromGallery[i].path));

        update();
      }
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }

  final loadCities = false.obs;

  getCities() async {
    loadCities.value = true;
    cities.value = (await servicess.geCities(regionId.value))!;
    loadCities.value = false;
  }

  getAllPolluationSources() {
    PolluationSourcesServices.getPolluationSources().then((res) {
      //! success
      if (res.runtimeType == List<PolluationSourcesModel>) {
        loading.value = false;
        allPolluationSources.value = res;
        items.value = allPolluationSources
            .map((polluationSource) => MultiSelectItem<PolluationSourcesModel>(
                polluationSource, polluationSource.name))
            .toList();
      } else if (res == 500) {
        //!Server Error
        loading.value = false;
        Get.defaultDialog(
          title: AppStrings.serverErrorTitle,
          middleText: AppStrings.serverError,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      } else if (res == 400) {
        loading.value = false;
        Get.defaultDialog(
          title: AppStrings.error,
          middleText: AppStrings.errorMsg,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      }
    });
  }

  getSelectedData(List<PolluationSourcesModel> dataList) {
    for (var data in dataList) {
      polluationSourcesIds.value.add(data.id);
      print(polluationSourcesIds.length);
    }
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
      locationData = await location.getLocation();
      markLong.value = locationData!.longitude!;
      markLat.value = locationData!.latitude!;
      print(markLat.value);
      print(markLong.value);
      return locationData;
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
    isClicked.value = true;
    update();
  }
}
