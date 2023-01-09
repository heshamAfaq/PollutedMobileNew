//
// import 'package:get/get.dart';
//
// import '../../../domain/model/epicenter/epicenter_model.dart';
// import '../../../presentation/resources/color_manager.dart';
// import '../../../presentation/resources/strings_manager.dart';
// import '../../network/all_epicenter_service.dart';
//
// class AllEpicenterController extends GetxController {
//   RxBool loading = true.obs;
//   RxList<dynamic> allEpicenter = [].obs;
//   @override
//   void onInit() {
//     getAllEpicenter(1);
//     super.onInit();
//   }
//
//   void getAllEpicenter(int pageNo) async{
//      loading.value = false;
//     AllEpicenterServices.getAllEpicenter(pageNo).then((res) {
//       //! success
//       if (res.runtimeType == List<EpicenterModel>) {
//         loading.value = false;
//         allEpicenter.value = res;
//         update();
//       } else if (res == 500) {
//         //!Server Error
//         loading.value = false;
//         Get.defaultDialog(
//           title: AppStrings.serverErrorTitle,
//           middleText: AppStrings.serverError,
//           onConfirm: () => Get.back(),
//           confirmTextColor: ColorManager.white,
//           buttonColor: ColorManager.error,
//           backgroundColor: ColorManager.white,
//         );
//           update();
//       } else if (res == 400) {
//         loading.value = false;
//         Get.defaultDialog(
//           title: AppStrings.error,
//           middleText: AppStrings.errorMsg,
//           onConfirm: () => Get.back(),
//           confirmTextColor: ColorManager.white,
//           buttonColor: ColorManager.error,
//           backgroundColor: ColorManager.white,
//         );
//           update();
//       }
//     });
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:enivronment/app/constants.dart';
import 'package:enivronment/controller/internet_controller.dart';
import 'package:enivronment/data/controller/epicenter/nearst_epicenters_controller.dart';
import 'package:enivronment/data/network/nearst_epicenter_service.dart';
import 'package:enivronment/data/network/region_service.dart';
import 'package:enivronment/domain/model/EpicintersModel.dart';
import 'package:enivronment/domain/model/ReportModel.dart';
import 'package:enivronment/domain/model/ReportsModels.dart';
import 'package:enivronment/domain/model/epicenter_model.dart';
import 'package:enivronment/presentation/Home/map_screen.dart';
import 'package:enivronment/presentation/resources/size_manager.dart';
import 'package:enivronment/presentation/resources/styles_manager.dart';
import 'package:enivronment/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../../rejon_model.dart';
import '../../network/all_epicenter_service.dart';

class AllEpicenterController extends GetxController {
  final nearstEpicenterServices = NearstEpicenterServices();
  final servicess = RegionService();
  final services = AllEpicenterServices();
  final loading = true.obs;
  final allEpicenter = <EpicenterDataModel>[].obs;
  final totalItem = '1'.obs;
  EpicintersModel? epicintersModel;
  EpicintersModel? epicintersModelReport;
  final listEpicenters = <Epicenters>[].obs;
  final listReports = <Epicenters>[].obs;
  final pageNumber = 1.obs;
  final allregion = <CitiesModel>[].obs;
  final allCities = <CitiesModel>[].obs;
  final allCities2 = <CitiesModel>[].obs;
  final load = true.obs;
  final listNearest = <EpicenterDataModel>[].obs;
  final number = 0.obs;
  final status = 0.obs;
  final cityId = 0.obs;
  final cityId2 = 0.obs;
  final cityName = "City".tr.obs;
  final cityName2 = "City".tr.obs;
  final loadCity = false.obs;
  final loadCity2 = false.obs;

  // final AllEpicenterModel allEpicenterModel = AllEpicenterModel(epicenterModel: [], totalItems: '');
  openMapDirection(double lat, double long) async {
    final availableMaps = await MapLauncher.installedMaps;
    for (var map in availableMaps) {
      map.showDirections(
          origin: Coords(locationData!.latitude!, locationData!.longitude!),
          directionsMode: DirectionsMode.driving,
          destination: Coords(lat, long),
          waypoints: []);
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    await getLocation();
    loading.value = true;
    print("success");
    epicintersModel = await services.getEpicenters(status: 0,pageNum: 1);
    listEpicenters.assignAll(epicintersModel!.epicenters!);
    allregion.value = (await servicess.getRegion())!;
    // regionText.value = allregion.first.name;
    print(listEpicenters.length);
    loading.value = false;

    // getNearest();
  }

  ReportModel? reportModel;

  getEpicenters(int id) async {
    reportModel = await services.getEpicentersbyId(id);
  }

  getAllCities(int id) async {
    loadCity.value = true;
    allCities.value = (await servicess.geCities(id))!;
    loading.value = false;
  }

  getAllCities2(int id) async {
    loadCity2.value = true;
    allCities2.value = (await servicess.geCities(id))!;
    loadCity2.value = false;
  }

  final loadReports = false.obs;

  getReports() async {
    loadReports.value = true;
    pageNumber2.value = 1;
    epicintersModelReport =
        await services.getEpicenters(pageNum: pageNumber2.value, status: 4);
    listReports.assignAll(epicintersModelReport!.epicenters!);
    loadReports.value = false;
  }

  getNearest() async {
    InternetConnectionController.to.checkInternet().then((value) async {
      if (value == true) {
        load.value = true;
        status.value = 2;
        listNearest.value =
            (await nearstEpicenterServices.getNearstEpicenterList(
                status.value,
                locationData!.latitude!,
                locationData!.longitude!,
                number.value))!;
        setMarker(listNearest.value);
        load.value = false;
      } else {
        load.value = true;
        status.value = 2;

        var prefs = await SharedPreferences.getInstance();
        // List json = jsonDecode(prefs.getString(Constants.epcintersMarkers)!);
        listNearest.addAll(
            jsonDecode(prefs.getString(Constants.epcintersMarkers)!).toList());

        print(listNearest);
        // setMarker(listNearest.value);
        load.value = false;
      }
    });
  }

  final pageNumber2 = 1.obs;

  // changPageNum(int pageNum) async {
  //   loading.value = true;
  //   // update();
  //   pageNumber.value = pageNum;
  //   epicintersModel =
  //       await services.getEpicenters(pageNumber.value, regionId.value, 0);
  //   update();
  //   loading.value = false;
  //   // print("donia");
  //   // print(pageNumber.value);
  // }

  // changPageNum2(int pageNum) async {
  //   loadReports.value = true;
  //   pageNumber2.value = pageNum;
  //   epicintersModelReport =
  //       await services.getEpicenters(pageNumber2.value, regionId2.value, 4);
  //   loadReports.value = false;
  //   update();
  // }

  void getAllEpicenter(
    int pageNumber,
    int regionId,
  ) async {
    // print("getAllEpicenter:$pageNumber");
    // print(loading.value);

    AllEpicenterServices.getAllEpicenter(pageNumber, regionId).then((res) {
      print("getAllEpicenter:$pageNumber");
      //! success
      if (res[0].runtimeType == List<EpicenterDataModel>) {
        print('object');
        allEpicenter.value = res[0];
        totalItem.value = res[1];

        // print('totalItem= $totalItem');
      } else if (res == 500) {
        //!Server Error
        Get.defaultDialog(
          title: AppStrings.serverErrorTitle,
          middleText: AppStrings.serverError,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      } else if (res == 400) {
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

  final regionText = 'Region'.tr.obs;
  final regionText2 = 'Region'.tr.obs;
  final regionId = 1.obs;
  final regionId2 = 1.obs;

  Future<void> onTapSelected(BuildContext con, int id, String name) async {
    loading.value = true;
    regionId.value = id;
    regionText.value = name;
    epicintersModel = await services.getEpicenters(
        pageNum: pageNumber.value, regionId: regionId.value, status: 0);
    listEpicenters.assignAll(epicintersModel!.epicenters!);

    update();

    loading.value = false;
  }

  final RefreshController refreshController = RefreshController();
  final RefreshController refreshController2 = RefreshController();

  Future<void> onTapSelected2(BuildContext con, int id, String name) async {
    loadReports.value = true;
    regionId2.value = id;
    regionText2.value = name;
    epicintersModelReport = await services.getEpicenters(
        status: 4, regionId: regionId2.value, pageNum: pageNumber2.value);
    listReports.assignAll(epicintersModelReport!.epicenters!);
    update();

    loadReports.value = false;
  }

  loadMore() async {
    if (listEpicenters.isNotEmpty) {
      pageNumber.value++;
      epicintersModel = await services.getEpicenters(
        pageNum: pageNumber.value,
        status: 0,
      );
      listEpicenters.addAll(epicintersModel!.epicenters!);
      print("loading");
      print(pageNumber.value);
    } else {
      print("no subcategories");
    }
  }

  loadMore2() async {
    if (listEpicenters.isNotEmpty) {
      pageNumber2.value++;
      epicintersModelReport = await services.getEpicenters(
        pageNum: pageNumber2.value,
        status: 4,
      );
      listReports.addAll(epicintersModelReport!.epicenters!);
      print("loading");
      print(pageNumber2.value);
    } else {
      print("no subcategories");
    }
  }

  final nearstEpicenter = <EpicenterDataModel>[].obs;

  void getNearstEpicenter(int status, double lat, double long) {
    print("getNearstEpicenter");
    NearstEpicenterServices.getNearstEpicenter(status, lat, long).then((res) {
      print(res);
      //! success
      if (res.runtimeType == List<EpicenterDataModel>) {
        update();
        nearstEpicenter.value = res;
        setMarker(nearstEpicenter.value);
      } else if (res == 500) {
        //!Server Error

        update();
        Get.defaultDialog(
          title: AppStrings.serverErrorTitle,
          middleText: AppStrings.serverError,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      } else if (res == 400) {
        update();
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

  Set<Marker> markers = {};
  Completer<GoogleMapController> compeleteController = Completer();

  void setMarker(
    List<EpicenterDataModel> allEpicenter,
  ) {
    markers.clear();
    for (var i = 0; i < allEpicenter.length; i++) {
      if (status.value == 0) {
        markers.add(Marker(
            markerId: MarkerId("${allEpicenter[i].lat}${allEpicenter[i].long}"),
            position: LatLng(allEpicenter[i].lat, allEpicenter[i].long),
            icon: BitmapDescriptor.defaultMarker,
            onTap: () {
              Get.defaultDialog(
                title: "HotSpot Details".tr,
                content: Text(
                  [
                    "${"Creation Date ".tr} : ${DateTime.parse(allEpicenter[i].creationDate)}",
                    "\n",
                    "${"Description ".tr} : ${allEpicenter[i].description}",
                    "\n",
                    "${"Reason ".tr} : ${allEpicenter[i].reason}",
                    "\n",
                    "${"Size ".tr} : ${allEpicenter[i].size} meter",
                    "\n",
                    "${"Status ".tr} : ${allEpicenter[i].status == 0 ? 'probability'.tr : allEpicenter[i].status == 1 ? 'confirmed'.tr : allEpicenter[i].status == 2 ? 'rejected'.tr : 'delayed'.tr}",
                    "\n"
                  ].join(""),
                  overflow: TextOverflow.ellipsis,
                  style: getSemiBoldStyle(color: ColorManager.secondary),
                ),
                confirm: InkWell(
                  onTap: () async {
                    final availableMaps = await MapLauncher.installedMaps;
                    for (var map in availableMaps) {
                      map.showDirections(
                          origin: Coords(locationData!.latitude!,
                              locationData!.longitude!),
                          directionsMode: DirectionsMode.driving,
                          destination:
                              Coords(allEpicenter[i].lat, allEpicenter[i].long),
                          waypoints: []);
                      // await createPolylines(
                      //     allEpicenter[i].lat, allEpicenter[i].long);
                      // await addMarkers(allEpicenter[i].lat, allEpicenter[i].long);
                    }
                    // Get.to(() =>
                    //     const MapSample()); // openMap(allEpicenter[i].lat, allEpicenter[i].long);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth! / MediaSize.m3,
                    height: SizeConfig.screenHeight! / MediaSize.m20,
                    decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius:
                            BorderRadius.circular(BorderRadiusValues.br8)),
                    child: Text(
                      "go to HotSpot".tr,
                      style: getSemiBoldStyle(color: ColorManager.white),
                    ),
                  ),
                ),
              );
            }));
      } else if (status.value == 1) {
        markers.add(Marker(
            markerId: MarkerId("${allEpicenter[i].lat}${allEpicenter[i].long}"),
            position: LatLng(allEpicenter[i].lat, allEpicenter[i].long),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            onTap: () {
              Get.defaultDialog(
                title: "HotSpot Details".tr,
                content: Text(
                  [
                    "${"Creation Date ".tr} : ${DateTime.parse(allEpicenter[i].creationDate)}",
                    "\n",
                    "${"Description ".tr} : ${allEpicenter[i].description}",
                    "\n",
                    "${"Reason ".tr} : ${allEpicenter[i].reason}",
                    "\n",
                    "${"Size ".tr} : ${allEpicenter[i].size} meter",
                    "\n",
                    "${"Status ".tr} : ${allEpicenter[i].status == 0 ? 'probability'.tr : allEpicenter[i].status == 1 ? 'confirmed'.tr : allEpicenter[i].status == 2 ? 'rejected'.tr : 'delayed'.tr}",
                    "\n"
                  ].join(""),
                  overflow: TextOverflow.ellipsis,
                  style: getSemiBoldStyle(color: ColorManager.secondary),
                ),
                confirm: InkWell(
                  onTap: () async {
                    final availableMaps = await MapLauncher.installedMaps;
                    for (var map in availableMaps) {
                      map.showDirections(
                          origin: Coords(locationData!.latitude!,
                              locationData!.longitude!),
                          directionsMode: DirectionsMode.driving,
                          destination:
                              Coords(allEpicenter[i].lat, allEpicenter[i].long),
                          waypoints: []);
                    }
                    // await createPolylines(
                    //     allEpicenter[i].lat, allEpicenter[i].long);
                    // await addMarkers(allEpicenter[i].lat, allEpicenter[i].long);
                    //
                    // Get.to(() => MapSample()); //
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth! / MediaSize.m3,
                    height: SizeConfig.screenHeight! / MediaSize.m20,
                    decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius:
                            BorderRadius.circular(BorderRadiusValues.br8)),
                    child: Text(
                      "go to HotSpot".tr,
                      style: getSemiBoldStyle(color: ColorManager.white),
                    ),
                  ),
                ),
              );
            }));
      } else {
        markers.add(Marker(
            markerId: MarkerId("${allEpicenter[i].lat}${allEpicenter[i].long}"),
            position: LatLng(allEpicenter[i].lat, allEpicenter[i].long),
            icon: allEpicenter[i].reportId == 0
                ? BitmapDescriptor.defaultMarker
                : BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
            onTap: () {
              Get.defaultDialog(
                title: "HotSpot Details".tr,
                content: Text(
                  [
                    "${"Creation Date ".tr} : ${DateTime.parse(allEpicenter[i].creationDate)}",
                    "\n",
                    "${"Description ".tr} : ${allEpicenter[i].description}",
                    "\n",
                    "${"Reason ".tr} : ${allEpicenter[i].reason}",
                    "\n",
                    "${"Size ".tr} : ${allEpicenter[i].size} meter",
                    "\n",
                    "${"Status ".tr} : ${allEpicenter[i].status == 0 ? 'probability'.tr : allEpicenter[i].status == 1 ? 'confirmed'.tr : allEpicenter[i].status == 2 ? 'rejected'.tr : 'delayed'.tr}",
                    "\n"
                  ].join(""),
                  overflow: TextOverflow.ellipsis,
                  style: getSemiBoldStyle(color: ColorManager.secondary),
                ),
                confirm: InkWell(
                  onTap: () async {
                    final availableMaps = await MapLauncher.installedMaps;
                    for (var map in availableMaps) {
                      map.showDirections(
                          origin: Coords(locationData!.latitude!,
                              locationData!.longitude!),
                          directionsMode: DirectionsMode.driving,
                          destination:
                              Coords(allEpicenter[i].lat, allEpicenter[i].long),
                          waypoints: []);
                    }
                    // await createPolylines(
                    //     allEpicenter[i].lat, allEpicenter[i].long);
                    // await addMarkers(allEpicenter[i].lat, allEpicenter[i].long);
                    // Get.to(() => MapSample()); //
                    // openMap(allEpicenter[i].lat, allEpicenter[i].long);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth! / MediaSize.m3,
                    height: SizeConfig.screenHeight! / MediaSize.m20,
                    decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius:
                            BorderRadius.circular(BorderRadiusValues.br8)),
                    child: Text(
                      "go to HotSpot".tr,
                      style: getSemiBoldStyle(color: ColorManager.white),
                    ),
                  ),
                ),
              );
            }));
      }

      update();
    }
    print("object15");
    print(markers);
  }

  Future<void> openMap(double lat, double long) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    if (await canLaunchUrl(Uri.parse(googleMapUrl))) {
      await launchUrl(Uri.parse(googleMapUrl));
    } else {
      throw 'could not open map';
    }
  }

  final Location location = Location();

  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  double? _lat;
  double? _long;

  double get currentLat => _lat ?? 0.0;

  double get currentLong => _long ?? 0.0;

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

  final charcter = NearstEpicenterRadio.all.obs;

  Future<void> onRadioChange(NearstEpicenterRadio value) async {
    load.value = true;
    if (value == NearstEpicenterRadio.notVisited) {
      charcter.value = value;
      status.value = 0;
      update();
      listNearest.value = (await nearstEpicenterServices.getNearstEpicenterList(
          status.value,
          locationData!.latitude!,
          locationData!.longitude!,
          number.value))!;
      setMarker(listNearest.value);
      // getNearstEpicenter(0, locationData!.latitude!, locationData!.longitude!);
    }
    if (value == NearstEpicenterRadio.visited) {
      charcter.value = value;
      status.value = 1;
      update();
      listNearest.value = (await nearstEpicenterServices.getNearstEpicenterList(
          status.value,
          locationData!.latitude!,
          locationData!.longitude!,
          number.value))!;
      setMarker(listNearest.value);

      // getNearstEpicenter(1, locationData!.latitude!, locationData!.longitude!);
    }
    if (value == NearstEpicenterRadio.all) {
      charcter.value = value;
      status.value = 2;
      update();
      listNearest.value = (await nearstEpicenterServices.getNearstEpicenterList(
          status.value,
          locationData!.latitude!,
          locationData!.longitude!,
          number.value))!;
      setMarker(listNearest.value);

      // getNearstEpicenter(2, locationData!.latitude!, locationData!.longitude!);
    }
    load.value = false;
  }

  final dropdownvalue = 'All'.obs;
  final items = ['All', '10', '20', '30'].obs;

  onSelect() async {
    load.value = true;
    if (dropdownvalue.value == 'All') {
      number.value = 0;
      listNearest.value = (await nearstEpicenterServices.getNearstEpicenterList(
          status.value,
          locationData!.latitude!,
          locationData!.longitude!,
          number.value))!;
      print(listNearest.length);
      setMarker(listNearest.value);
    } else if (dropdownvalue.value == "10") {
      number.value = 10;
      listNearest.value = (await nearstEpicenterServices.getNearstEpicenterList(
          status.value,
          locationData!.latitude!,
          locationData!.longitude!,
          number.value))!;
      print(dropdownvalue.value);
      print(listNearest.length);
      setMarker(listNearest.value);
    } else if (dropdownvalue.value == "20") {
      number.value = 20;
      listNearest.value = (await nearstEpicenterServices.getNearstEpicenterList(
          status.value,
          locationData!.latitude!,
          locationData!.longitude!,
          number.value))!;
      print(dropdownvalue.value);
      print(listNearest.length);
      setMarker(listNearest.value);
    } else if (dropdownvalue.value == "30") {
      number.value = 30;
      listNearest.value = (await nearstEpicenterServices.getNearstEpicenterList(
          status.value,
          locationData!.latitude!,
          locationData!.longitude!,
          number.value))!;
      print(listNearest.length);
      print(dropdownvalue.value);
      setMarker(listNearest.value);
    }
    load.value = false;
  }

  late PolylinePoints polylinePoints;
  final polylineCoordinates = <LatLng>[].obs;
  final polylines = <PolylineId, Polyline>{}.obs;
  final markerss = <Marker>{}.obs;

  createPolylines(double? lat, double? long) async {
    polylines.clear();
    polylineCoordinates.clear();
    print("create");
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBGOAVKbeA0MiN6NfGm8Z0y5LtE7cgdCo4",
      PointLatLng(locationData!.latitude!, locationData!.longitude!),
      PointLatLng(lat!, long!),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        print(polylineCoordinates);
      }
    }

    PolylineId id = const PolylineId('poly');

    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.cyanAccent,
      points: polylineCoordinates,
      width: 3,
    );

    polylines.value[id] = polyline;
  }

  addMarkers(double? lat, double? long) async {
    markerss.clear();
    markerss.add(
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
    markerss.add(
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

  IconData paginationNext = Icons.keyboard_arrow_left_rounded;
  IconData paginationPervious = Icons.keyboard_arrow_right_rounded;

  void changeButtonDirection(String localeDirection) {
    if (localeDirection == 'ar') {
      paginationNext = Icons.keyboard_arrow_left_rounded;
      paginationPervious = Icons.keyboard_arrow_right_rounded;
      update();
    } else if (localeDirection == 'en') {
      paginationNext = Icons.keyboard_arrow_right_rounded;
      paginationPervious = Icons.keyboard_arrow_left_rounded;
      update();
    }
  }
}
