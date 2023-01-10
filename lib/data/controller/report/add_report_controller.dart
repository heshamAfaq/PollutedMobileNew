import 'dart:developer';
import 'dart:io';

import 'package:enivronment/data/controller/report/ground_water_controller.dart';
import 'package:enivronment/data/controller/report/residential_area_controller.dart';
import 'package:enivronment/data/controller/report/vegetation_controller.dart';
import 'package:enivronment/data/network/add_report_service.dart';
import 'package:enivronment/data/network/governorate_service.dart';
import 'package:enivronment/data/network/industrial_activities_service.dart';
import 'package:enivronment/data/network/industrial_polluation_sources_service.dart';
import 'package:enivronment/data/network/land_form_service.dart';
import 'package:enivronment/data/network/polluation_sources_service.dart';
import 'package:enivronment/data/network/pollutant_place_service.dart';
import 'package:enivronment/data/network/pollutant_reactivities_service.dart';
import 'package:enivronment/data/network/potential_pollutants_service.dart';
import 'package:enivronment/data/network/region_service.dart';
import 'package:enivronment/data/network/surface_water_service.dart';
import 'package:enivronment/data/network/surrounding_buildings_service.dart';
import 'package:enivronment/data/network/weather_service.dart';
import 'package:enivronment/domain/model/epicenter/epicenter_model.dart';
import 'package:enivronment/domain/model/industrial_polluation_sources/industrial_polluation_sources_model.dart';
import 'package:enivronment/domain/model/land_form/land_form_model.dart';
import 'package:enivronment/domain/model/list_model.dart';
import 'package:enivronment/domain/model/polluation_sources/polluation_sources_model.dart';
import 'package:enivronment/domain/model/pollutant_place/pollutant_place_model.dart';
import 'package:enivronment/domain/model/pollutant_reactivities/pollutant_reactivities_model.dart';
import 'package:enivronment/domain/model/potential_pollutants/potential_pollutants_model.dart';
import 'package:enivronment/domain/model/report/add_report_model.dart';
import 'package:enivronment/domain/model/report_industrial_activities/report_industrial_activities_model.dart';
import 'package:enivronment/domain/model/surface_water/surface_water_model.dart';
import 'package:enivronment/domain/model/surrounding_buildings/surrounding_buildings_model.dart';
import 'package:enivronment/domain/model/weather/weather_model.dart';
import 'package:enivronment/presentation/resources/color_manager.dart';
import 'package:enivronment/presentation/resources/strings_manager.dart';
import 'package:enivronment/rejon_model.dart';
import 'package:enivronment/responsible_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../app/constants.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../domain/model/ReportModel.dart';

class AddReportController extends GetxController {
  final send = false.obs;
  final polluationDescription = "".obs;
  final epicenterSize = 0.0.obs;
  final polluationSize = 0.0.obs;
  final firstLoading = false.obs;

  //!===============================
  final temperature = '0.0'.obs;
  final Windspeed = '0.0'.obs;
  final Sunrise = ''.obs;
  final WinddirectionId = 0.obs;
  final relativehumidity = '0.0'.obs;
  final salinity = '0.0'.obs;
  final totalDissolvedSolids = '0.0'.obs;
  final totalSuspendedSolids = '0.0'.obs;
  final pH = '0.0'.obs;
  final turbidity = '0.0'.obs;
  final electricalConnection = '0.0'.obs;
  final dissolvedOxygen = '0.0'.obs;
  final totalOrganicCarbon = '0.0'.obs;
  final volatileOrganicMatter = '0.0'.obs;
  final ozone = '0.0'.obs;
  final allKindsOfCarbon = '0.0'.obs;
  final nitrogenDioxide = '0.0'.obs;
  final sulfurDioxide = '0.0'.obs;
  final pM25 = '0.0'.obs;
  final pM10 = '0.0'.obs;
  final SecoundCarpone = '0.0'.obs;
  final FirstCarpone = '0.0'.obs;
  final WaterTemperature = '0.0'.obs;
  final epicenterLenght = 0.0.obs;
  final epicenterDepth = 0.0.obs;
  final epicenterWidth = 0.0.obs;
  final epicenterVolume = 0.0.obs;

  final responsibleText = "choose Competent authority".tr.obs;
  final responsibleId = 0.obs;
  final plantsList = <String>[].obs;
  final underGroundList = <String>[].obs;
  final pollution = <String>[].obs;
  final mediumPollution = <String>[].obs;
  final industralActivity = <String>[].obs;
  final medium = <String>[].obs;
  final potentialcontaminants = <String>[].obs;
  final water = false.obs;
  final air = false.obs;
  final earth = false.obs;

  // final surroundingBuildingsIds = <int>[].obs;
  // final allSurroundingBuildings = <SurroundingBuildingsModel>[].obs;
  // final items = <MultiSelectItem<SurroundingBuildingsModel>>[].obs;
  final residentialArea = false.obs;
  final sunRise = false.obs;
  final plants = false.obs;
  final underGround = false.obs;

  addPlaces(bool v) {
    residentialArea.value = v;
  }

  addVeg(bool v) {
    plants.value = v;
  }

  addPlants(bool v) {
    plants.value = v;
  }

  addSunRise(bool v) {
    sunRise.value = v;
  }

  addUnderGround(bool v) {
    underGround.value = v;
  }

  clear() {
    epicenterSize.value = 0.0;
  }

  // void getAllSurroundingBuildings() {
  //   SurroundingBuildingsService.getAllSurroundingBuildingss().then((res) {
  //     //! success
  //     if (res.runtimeType == List<SurroundingBuildingsModel>) {
  //       loading.value = false;
  //       allSurroundingBuildings.value = res;
  //       items.value = allSurroundingBuildings
  //           .map((surroundingBuildings) =>
  //               MultiSelectItem<SurroundingBuildingsModel>(
  //                   surroundingBuildings, surroundingBuildings.name))
  //           .toList();
  //     } else if (res == 500) {
  //       //!Server Error
  //       loading.value = false;
  //       Get.defaultDialog(
  //         title: AppStrings.serverErrorTitle,
  //         middleText: AppStrings.serverError,
  //         onConfirm: () => Get.back(),
  //         confirmTextColor: ColorManager.white,
  //         buttonColor: ColorManager.error,
  //         backgroundColor: ColorManager.white,
  //       );
  //     } else if (res == 400) {
  //       loading.value = false;
  //       Get.defaultDialog(
  //         title: AppStrings.error,
  //         middleText: AppStrings.errorMsg,
  //         onConfirm: () => Get.back(),
  //         confirmTextColor: ColorManager.white,
  //         buttonColor: ColorManager.error,
  //         backgroundColor: ColorManager.white,
  //       );
  //     }
  //   });
  // }

  // void getSelectedData(List<SurroundingBuildingsModel> dataList) {
  //   for (var data in dataList) {
  //     surroundingBuildingsIds.add(data.id);
  //   }
  //   update();
  // }
  final hardness = '0.0'.obs;
  final acidity = '0.0'.obs;
  final addServices = AddReportService();
  final underGroundWater = <CitiesModel>[].obs;
  final groundWaterText = 'Choose the type of groundwater'.tr.obs;
  final waterGroundId = 0.obs;
  final plantList = <CitiesModel>[].obs;
  final plantText = 'Choose the type of vegetation'.tr.obs;
  final plantId = 0.obs;
  final semanticPollution = <CitiesModel>[].obs;
  final semanticPollutionText = 'اختيار دلالات التلوث'.tr.obs;
  final semanticPollutionId = 0.obs;
  final surroundedMediums = <CitiesModel>[].obs;
  final surroundedMediumsList = [].obs;
  final plantListList = [].obs;
  final underGroundWaterList = [].obs;
  final semanticPollutionList = [].obs;
  final surroundingBuildingsList = [].obs;

  final surroundedMediumsText =
      'Select the medium that has been contaminated'.tr.obs;
  final surroundedMediumsId = 0.obs;
  final natureOfEpicenter = <CitiesModel>[].obs;
  final natureOfEpicenterText = 'choose natural Region'.tr.obs;
  final natureOfEpicenterId = 0.obs;
  final surroundingBuildings = <CitiesModel>[].obs;
  final surroundingBuildingsText = 'choose buildings'.tr.obs;
  final surroundingBuildingsId = 0.obs;
  final getAllWindDirection = <CitiesModel>[].obs;
  final getAllWindDirectionText = 'choose wind direction'.tr.obs;
  final getAllWindDirectionId = 0.obs;
  // final listDistance = <ReportBuildingss>[].obs;
  final distanceOfList = <ReportBuildingss>[].obs;
  final ActvitesList = <ReportIndustrialActivitiesss>[].obs;
  final adddistanceOfList = <ReportBuildings>[].obs;
  TextEditingController distanceController = TextEditingController();
  final load = false.obs;
  final listOfsurroundedMediums = <int>[].obs;
  final listOfsemanticPollution = <int>[].obs;
  final listunderGroundWater = <int>[].obs;
  final listpollutantPlaces = <int>[].obs;
  final listPlantPlaces = <int>[].obs;
  final listsurroundingBuildings = <int>[].obs;
  final listsurroundingBuildingsDistance = <double>[].obs;
  final listofTrues = <bool>[false].obs;
  final listOfPollutions = <String>[].obs;

  addsurroundedMediumsList(
    int index,
    int id,
    String label,
  ) {
    if (surroundedMediumsList[index] == true) {
      print(surroundedMediumsList[index]);

      print("f");
      listOfsurroundedMediums.add(id);
      mediumPollution.add(label);

      listofTrues.add(surroundedMediumsList[index]);
      print(id);
      print(listOfsurroundedMediums.length);
    } else {
      print(water.value);
      print(earth.value);
      print(air.value);
      print("remove");
      listOfsurroundedMediums.removeWhere((item) => item.isEqual(id));
      mediumPollution.removeWhere((item) => item == (label));
      listofTrues.removeWhere((item) => (surroundedMediumsList[index]));
      print(listOfsurroundedMediums.length);
    }
  }

  final distance = 0.0.obs;

  // addsurroundingBuildingsList(
  //   int index,
  //   int id,
  //   double distance,
  //   String name,
  // ) {
  //   if (surroundingBuildingsList[index] == true) {
  //     print("Added");
  //     listDistance
  //         .add(ReportBuildingss(surroundingBuildingId: id, distance: distance));
  //     distanceOfList.add(ReportBuildings(
  //         surroundingBuildingId: id,
  //         distance: distance,
  //         surroundingBuilding: SurroundingBuilding(id: id, name: name)));
  //   } else {
  //     print("remove");
  //     listDistance.removeWhere((item) => item.surroundingBuildingId == id);
  //     distanceOfList.removeWhere((item) => item.surroundingBuildingId == id);
  //     listDistance.forEach((element) {
  //       print(element.toJson());
  //     });
  //   }
  // }

  final surroundingBuildingId = 0.obs;
  final surroundingDistance = 0.0.obs;
  final surroundingName = "".obs;

  addBuildingsList(
    int id,
    double distance,
    String name,
    File file,
  ) {
    print("Added");
    print(file.path);
    // listDistance.add(ReportBuildingss(
    //     surroundingBuildingId: id, distance: distance, attachment: file));
    distanceOfList.add(ReportBuildingss(
        attachment: file,
        surroundingBuildingId: id,
        distance: distance,
        surroundingBuilding: SurroundingBuilding(id: id, name: name)));
  }

  addActivites(
    int id,
    double distance,
    String name,
    File file,
    String description,
  ) {
    print("Added");
    print(file.path);
    print(description);
    ActvitesList.add(ReportIndustrialActivitiesss(
        industrialActivityId: id,
        distance: distance,
        attachment: file,
        description: description,
    industrialActivity:IndustrialActivity(
      name: name
    ) ));
  }

  removeDiatance(int id) {
    print("remove");
    // listDistance.removeWhere((item) => item.surroundingBuildingId == id);
    distanceOfList.removeWhere((item) => item.surroundingBuildingId == id);
    // listDistance.forEach((element) {
    //   print(element.toJson());
    // });
  }

  removeActivites(int id) {
    print("remove");
    ActvitesList.removeWhere((item) => item.industrialActivityId == id);
  }

  final distanceMap = <int, double>{}.obs;
  final listOfDistances = [].obs;
  final semanticList = <String>[].obs;

  addsemanticPollutionList(int index, int id, String label) {
    if (semanticPollutionList[index] == true) {
      print("Added");
      listOfsemanticPollution.add(id);
      pollution.add(label);
      print(id);
      print(listOfsemanticPollution.length);
    } else {
      print("remove");
      listOfsemanticPollution.removeWhere((item) => item.isEqual(id));
      pollution.removeWhere((item) => item == (id));
      print(listOfsemanticPollution.length);
    }
  }

  addunderGroundWaterList(int index, int id, String label) {
    if (underGroundWaterList[index] == true) {
      print("Added");
      listunderGroundWater.add(id);
      underGroundList.add(label);
      print(id);
      print(listunderGroundWater.length);
    } else {
      print("remove");
      listunderGroundWater.removeWhere((item) => item.isEqual(id));
      underGroundList.removeWhere((item) => item == (label));
      print(listunderGroundWater.length);
    }
  }

  addPlantList(int index, int id, String label) {
    if (plantListList[index] == true) {
      print("Added");

      listPlantPlaces.add(id);
      plantsList.add(label);
      print(id);
      print(listPlantPlaces.length);
      print(plantsList.length);
    } else {
      print("remove");
      listPlantPlaces.removeWhere((item) => item.isEqual(id));
      plantsList.removeWhere((item) => item == (label));
      print(listPlantPlaces.length);
      print(plantsList.length);
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    load.value = true;
    super.onInit();
    await getLocation();
    await getAllLandForm();
    // await getAllPollutantReactivities();
    await getPollutantPlace();
    underGroundWater.value = (await addServices.getAllUnderGroundWater())!;
    plantList.value = (await addServices.getAllPlants())!;
    semanticPollution.value = (await addServices.semanticPollution())!;
    surroundedMediums.value = (await addServices.surroundedMediums())!;
    natureOfEpicenter.value = (await addServices.natureOfEpicenter())!;
    surroundingBuildings.value = (await addServices.getSurroundingBuildings())!;
    getAllWindDirection.value = (await addServices.getAllWindDirection())!;
    allIndustrialActivities.value =
        (await IndustrialActivityServices.getAllIndustrialActivities());
    // groundWaterText.value = underGroundWater.first.name;
    // plantText.value = plantList.first.name;
    // semanticPollutionText.value = semanticPollution.first.name;
    // surroundedMediumsText.value = surroundedMediums.first.name;
    // natureOfEpicenterText.value = natureOfEpicenter.first.name;
    // getAllWindDirectionText.value = getAllWindDirection.first.name;
    // surroundingBuildingsText.value = surroundingBuildings.first.name;
    surroundedMediumsList.value = List.filled(surroundedMediums.length, false);
    // listofTrues.value=List.filled(surroundedMediums.length, false);
    semanticPollutionList.value = List.filled(semanticPollution.length, false);
    underGroundWaterList.value = List.filled(underGroundWater.length, false);
    plantListList.value = List.filled(plantList.length, false);
    surroundingBuildingsList.value =
        List.filled(surroundingBuildings.length, false);
    await getSurfaceWater();
    // await getWeather();
    allregion.value = (await servicess.getRegion())!;
    responsibleAuthoritiesModel.value = (await servicess.getResponsible())!;

    // getAllSurroundingBuildings();
    getAllpotentialPollutants();
    getAllPolluationSources();
    // getAllIndustrialPolluationSource();
    getAllIndustrialActivities();
    load.value = false;
  }

  void changeExtentOfPolluationDescription(String? value) {
    polluationDescription.value = value!;
    print(polluationDescription.value);
  }

  void changeEpicenterSize(String? value) {
    epicenterSize.value = double.parse(value ?? "0.0");
    update();
  }

  void changePolluationSize(String? value) {
    polluationSize.value = double.parse(value ?? "0.0");
    update();
  }

  void changetemperature(String? value) {
    temperature.value = value ?? "0.0";
    update();
  }

  void changesalinity(String? value) {
    salinity.value = value ?? "0.0";
    update();
  }

  void changetotalDissolvedSolids(String? value) {
    totalDissolvedSolids.value = value ?? "0.0";
    update();
  }

  void changetotalSuspendedSolids(String? value) {
    totalSuspendedSolids.value = value ?? "0.0";
    update();
  }

  void changepH(String? value) {
    pH.value = value ?? "0.0";
    update();
  }

  void changeturbidity(String? value) {
    turbidity.value = value ?? "0.0";
    update();
  }

  void changeelectricalConnection(String? value) {
    electricalConnection.value = value ?? "0.0";
    update();
  }

  void changedissolvedOxygen(String? value) {
    dissolvedOxygen.value = value ?? "0.0";
    update();
  }

  void changetotalOrganicCarbon(String? value) {
    totalOrganicCarbon.value = value ?? "0.0";
    update();
  }

  void changevolatileOrganicMatter(String? value) {
    volatileOrganicMatter.value = value ?? "0.0";
    update();
  }

  void changeozone(String? value) {
    ozone.value = value ?? "0.0";
    update();
  }

  void changeallKindsOfCarbon(String? value) {
    allKindsOfCarbon.value = value ?? "0.0";
    update();
  }

  void changenitrogenDioxide(String? value) {
    nitrogenDioxide.value = value ?? "0.0";
    update();
  }

  void changesulfurDioxide(String? value) {
    sulfurDioxide.value = value ?? "0.0";
    update();
  }

  void changepM25(String? value) {
    pM25.value = value ?? "0.0";
    update();
  }

  void changepM10(String? value) {
    pM10.value = value ?? "0.0";
    update();
  }

  final charcter = ResidentialAreaRadio.yes.obs;

  void onChange(ResidentialAreaRadio value) {
    charcter.value = value;
    update();
  }

  final char = VegetationRadio.yes.obs;

  void onChangeChar(VegetationRadio value) {
    char.value = value;
    update();
  }

  final chars = GroundWaterRadio.yes.obs;

  void onChangeChars(GroundWaterRadio value) {
    chars.value = value;
    update();
  }

  final potentialPollutantsIds = <int>[].obs;
  final allpotentialPollutants = <PotentialPollutantsModel>[].obs;
  final itemsPollutants = <MultiSelectItem<PotentialPollutantsModel>>[].obs;

  void getAllpotentialPollutants() {
    PotentialPollutantsService.getAllPotentialPollutants().then((res) {
      //! success
      if (res.runtimeType == List<PotentialPollutantsModel>) {
        loading.value = false;
        allpotentialPollutants.value = res;
        itemsPollutants.value = allpotentialPollutants
            .map((potentialPollutants) =>
                MultiSelectItem<PotentialPollutantsModel>(
                    potentialPollutants, potentialPollutants.name))
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

  void getSelectedDataPollutants(List<PotentialPollutantsModel> dataList) {
    for (var data in dataList) {
      potentialPollutantsIds.add(data.id);
    }
    update();
  }

  final polluationSourcesIds = <int>[].obs;
  final allPolluationSources = <PolluationSourcesModel>[].obs;
  final itemsPolluationSources =
      <MultiSelectItem<PolluationSourcesModel>>[].obs;

  void getAllPolluationSources() {
    PolluationSourcesServices.getPolluationSources().then((res) {
      //! success
      if (res.runtimeType == List<PolluationSourcesModel>) {
        loading.value = false;
        allPolluationSources.value = res;
        itemsPolluationSources.value = allPolluationSources
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

  getSelectedDataPolluationSources(List<PolluationSourcesModel> dataList) {
    for (var data in dataList) {
      polluationSourcesIds.add(data.id);
      print(polluationSourcesIds.length);
    }
    update();
  }

  //
  // final industrialPolluationSourceIds = <int>[].obs;
  //
  // final allIndustrialPolluationSource =
  //     <IndustrialPolluationSourcesModel>[].obs;
  // final itemsIndustrialPolluationSource =
  //     <MultiSelectItem<IndustrialPolluationSourcesModel>>[].obs;
  //
  // void getAllIndustrialPolluationSource() {
  //   IndustrialPolluationSourceServices.getAllIndustrialPolluationSource()
  //       .then((res) {
  //     //! success
  //     if (res.runtimeType == List<IndustrialPolluationSourcesModel>) {
  //       loading.value = false;
  //       allIndustrialPolluationSource.value = res;
  //       itemsIndustrialPolluationSource.value = allIndustrialPolluationSource
  //           .map((industrialPolluationSource) =>
  //               MultiSelectItem<IndustrialPolluationSourcesModel>(
  //                   industrialPolluationSource,
  //                   industrialPolluationSource.name))
  //           .toList();
  //     } else if (res == 500) {
  //       //!Server Error
  //       loading.value = false;
  //       Get.defaultDialog(
  //         title: AppStrings.serverErrorTitle,
  //         middleText: AppStrings.serverError,
  //         onConfirm: () => Get.back(),
  //         confirmTextColor: ColorManager.white,
  //         buttonColor: ColorManager.error,
  //         backgroundColor: ColorManager.white,
  //       );
  //     } else if (res == 400) {
  //       loading.value = false;
  //       Get.defaultDialog(
  //         title: AppStrings.error,
  //         middleText: AppStrings.errorMsg,
  //         onConfirm: () => Get.back(),
  //         confirmTextColor: ColorManager.white,
  //         buttonColor: ColorManager.error,
  //         backgroundColor: ColorManager.white,
  //       );
  //     }
  //   });
  // }
  //
  // void getSelectedDataIndustrialPolluationSource(
  //     List<IndustrialPolluationSourcesModel> dataList) {
  //   for (var data in dataList) {
  //     industrialPolluationSourceIds.add(data.id);
  //   }
  //   update();
  // }

  final industrialActivitiesIds = <ReportIndustrialActivitiess>[].obs;
  final allIndustrialActivities = <IndustrialActivitiesModel>[].obs;
  final allIndustrialActivitiesText =
      "Choose the type of industrial activity".tr.obs;
  final allIndustrialActivitiesId = 0.obs;
  final allIndustrialActivitiesDescription = "".obs;
  final allIndustrialActivitiesDistance = 0.0.obs;
  final itemsindustrialActivities =
      <MultiSelectItem<IndustrialActivitiesModel>>[].obs;

  void getAllIndustrialActivities() {
    IndustrialActivityServices.getAllIndustrialActivities().then((res) {
      //! success
      if (res.runtimeType == List<IndustrialActivitiesModel>) {
        loading.value = false;
        allIndustrialActivities.value = res;
        itemsindustrialActivities.value = allIndustrialActivities
            .map((industrialActivity) =>
                MultiSelectItem<IndustrialActivitiesModel>(
                    industrialActivity, industrialActivity.name))
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

  // void getSelectedDataindustrialActivities(
  //     List<IndustrialActivitiesModel> dataList) {
  //   for (var data in dataList) {
  //     industrialActivitiesIds.add(data.id);
  //   }
  //   update();
  // }

  final listIgnoriedPhotos = <int>[].obs;
  final listOfImages = <String>[].obs;

  remove(String id) {
    print("Chemical control remove");
    listOfImages.removeWhere((item) => item == id);
    print(listOfImages.length);
  }

  removeImages(File path) {
    print("Chemical control remove");
    imagesList.removeWhere((item) => item == path);
    print(listOfImages.length);
  }

  UpdateReport({
    required int epicenterId,
    int? reportId,
    String? extentOfPolluationDescription,
    String? pm25,
    String? pm10,
    String? temperature,
    String? salinity,
    String? totalDissolvedSolids,
    String? totalSuspendedSolids,
    String? pH,
    String? turbidity,
    String? electricalConnection,
    String? dissolvedOxygen,
    String? totalOrganicCarbon,
    String? volatileOrganicMatter,
    String? ozone,
    // String? allKindsOfCarbon,
    String? nitrogenDioxide,
    String? sulfurDioxide,
    String? hardness,
    String? humidity,
    // String? acidity,
    String? windSpeed,
    String? epicenterWidth,
    String? epicenterLenght,
    String? epicenterDepth,
    String? waterTemperature,
    String? firstCarpone,
    String? secoundCarpone,
    required BuildContext context,
  }) async {
    // if (residentialArea.isFalse) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('you must add Residential Area '.tr)));
    // } else if (underGround.isFalse) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text('you must add Sun Rise'.tr)));
    // } else if (locationData!.latitude == Constants.emptyDouble &&
    //     locationData!.latitude == Constants.emptyDouble) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('please choose location of HotSpot'.tr)));
    // }
    // else if (sunRise.isTrue && listPlantPlaces.isEmpty) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text("you must add plants".tr)));
    // } else if (plants.isTrue && listunderGroundWater.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("must add under ground water".tr)));
    // }
    if (landFormId.value.isEqual(0)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('please enter Land Form'.tr)));
    } else if (getAllWindDirectionId.value.isEqual(0)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("you must add Wind direction".tr)));
    } else if (responsibleId.value == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("ResponsibleAuthorities".tr)));
    } else if (surfaceWaterId.value.isEqual(0)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("please select Surface Water".tr)));
    } else if (pollutantPlaceId.value.isEqual(0)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("please Enter Pollutant Places".tr)));
    } else if (listOfsemanticPollution.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("you must add connotations of pollution".tr)));
    } else if (listOfsurroundedMediums.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("you must add medium that has been contaminated".tr)));
    } else if (natureOfEpicenterId.value.isEqual(0)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("you must The nature of the area".tr)));
    } else if (cityId.value == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('please enter city'.tr)));
    } else if (polluationDescription.value == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please enter Description'.tr)));
    }
    // else if (imagesList.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('please enter HotSpot Images'.tr)));
    // }
    else if (ActvitesList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('please enter Industrial Activites'.tr)));
    } else if (polluationSourcesIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Contaminated media should be introduced'.tr)));
    } else if (potentialPollutantsIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please Enter Potential Pollutants '.tr)));
    } else if (distanceOfList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please Enter Surrounding Buildings '.tr)));
    } else if (epicenterWidth!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('you must enter width'.tr)));
    } else if (epicenterDepth!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('you must enter depth'.tr)));
    } else if (temperature!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You must enter the temperature".tr)));
    } else if (humidity!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("you must relative humidity".tr)));
    } else if (windSpeed!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("you must add Wind speed".tr)));
    } else if (salinity!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Salinity must be entered".tr)));
    } else if (totalDissolvedSolids!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("TDS should be included".tr)));
    } else if (totalSuspendedSolids!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Total suspended solids must be entered".tr)));
    } else if (pH!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("pH is required".tr)));
    } else if (turbidity!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Turbidity must be introduced".tr)));
    } else if (electricalConnection!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Electrical connection must be entered".tr)));
    } else if (dissolvedOxygen!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Dissolved oxygen must be introduced".tr)));
    } else if (volatileOrganicMatter!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Volatile organic matter should be included".tr)));
    } else if (ozone!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Ozone must be included".tr)));
    }
    // else if (allKindsOfCarbon!.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("All types of carbon must be entered".tr)));
    // }
    else if (nitrogenDioxide!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Nitrogen dioxide must be included".tr)));
    } else if (sulfurDioxide!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sulfur dioxide should be included".tr)));
    } else if (pm25!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("PM25 is required".tr)));
    } else if (pm10!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("PM10 is required".tr)));
    } else if (hardness!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("hardness".tr)));
    }
    // else if (acidity!.isEmpty) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text("acidity".tr)));
    // }
    else if (firstCarpone!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("FirstCarpone Required".tr)));
    } else if (secoundCarpone!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("SecoundCarpone Required".tr)));
    } else if (waterTemperature!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("WaterTemperature Required".tr)));
    } else {
      adddistanceOfList.clear();
      plantsList.clear();
      underGroundList.clear();
      listOfPollutions.clear();
      semanticList.clear();
      send.value = true;
      await addServices.UpdateReport(
        Report(
            FirstCarpone: firstCarpone,
            SecoundCarpone: secoundCarpone,
            WaterTemperature: waterTemperature,
            // Acidity: acidity,
            WindSpeed: windSpeed,
            NatureOfEpicenterId: natureOfEpicenterId.value,
            SunRise: sunRise.value,
            Humidity: humidity,
            EpicenterWidth: epicenterWidth,
            EpicenterLenght: epicenterLenght,
            EpicenterDepth: epicenterDepth,
            WindDirectionId: getAllWindDirectionId.value,
            IgnoriedPhotos: listIgnoriedPhotos,
            ReportPlantIds: listPlantPlaces,
            ReportSemanticPollutionIds: listOfsemanticPollution,
            ReportSurroundedMediumIds: listOfsurroundedMediums,
            ReportUndergroundWaterIds: listunderGroundWater,
            hardness: hardness,
            extentOfPolluationDescription: extentOfPolluationDescription!,
            photos: imagesList,
            lat: locationData!.latitude!,
            long: locationData!.longitude!,
            hasResidentialArea: residentialArea.value,
            hasVegetation: plants.value,
            hasGroundWater: underGround.value,
            epicenterId: epicenterId,
            cityId: cityId.value,
            landFormId: landFormId.value,
            pollutantPlaceId: pollutantPlaceId.value,
            surfaceWaterId: surfaceWaterId.value,
            reportIndustrialActivitiesIds: ActvitesList,
            reportPolluationSourcesIds: polluationSourcesIds,
            reportPotentialPollutantsIds: potentialPollutantsIds,
            reportSurroundingBuildingsIds: distanceOfList,
            temperature: temperature,
            salinity: salinity,
            totalDissolvedSolids: totalDissolvedSolids,
            totalSuspendedSolids: totalSuspendedSolids,
            pH: pH,
            turbidity: turbidity,
            electricalConnection: electricalConnection,
            dissolvedOxygen: dissolvedOxygen,
            totalOrganicCarbon: totalOrganicCarbon,
            volatileOrganicMatter: volatileOrganicMatter,
            ozone: ozone,
            // allKindsOfCarbon: allKindsOfCarbon,
            nitrogenDioxide: nitrogenDioxide,
            sulfurDioxide: sulfurDioxide,
            pM25: pm25,
            pM10: pm10,
            responsibleAuthorityId: responsibleId.value),
        reportId,
      );
      send.value = false;
      underGroundList.clear();
      plantsList.clear();
    }
  }

  sendReport(int epicenterId, BuildContext context) async {
    try {
      // if (residentialArea.isTrue) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('you must add Residential Area '.tr)));
      // } else if (sunRise.isTrue) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text('you must add Sun Rise'.tr)));
      // }
      if (locationData!.latitude == Constants.emptyDouble &&
          locationData!.latitude == Constants.emptyDouble) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('please choose location of HotSpot'.tr)));
      } else if (plants.isTrue && listPlantPlaces.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("you must add plants".tr)));
      } else if (underGround.isTrue && listunderGroundWater.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("must add under ground water".tr)));
      } else if (landFormId.value.isEqual(0)) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('please enter Land Form'.tr)));
      } else if (getAllWindDirectionId.value.isEqual(0)) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("you must add Wind direction".tr)));
      } else if (responsibleId.value == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("ResponsibleAuthorities".tr)));
      } else if (surfaceWaterId.value.isEqual(0)) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("please select Surface Water".tr)));
      } else if (pollutantPlaceId.value.isEqual(0)) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("please Enter Pollutant Places".tr)));
      } else if (listOfsemanticPollution.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("you must add connotations of pollution".tr)));
      } else if (listOfsurroundedMediums.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("you must add medium that has been contaminated".tr)));
      } else if (natureOfEpicenterId.value.isEqual(0)) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("you must The nature of the area".tr)));
      } else if (cityId.value == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('please enter city'.tr)));
      } else if (polluationDescription.value == '') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please enter Description'.tr)));
      } else if (imagesList.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('please enter HotSpot Images'.tr)));
      } else if (ActvitesList.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('please enter Industrial Activites'.tr)));
      } else if (polluationSourcesIds.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Contaminated media should be introduced'.tr)));
      } else if (potentialPollutantsIds.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please Enter Potential Pollutants '.tr)));
      } else if (distanceOfList.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please Enter Surrounding Buildings '.tr)));
      } else if (epicenterWidth.value == 0.0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('you must enter width'.tr)));
      } else if (epicenterDepth.value == 0.0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('you must enter depth'.tr)));
      } else if (temperature.value == '') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("You must enter the temperature".tr)));
      } else if (relativehumidity.value == '') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("you must relative humidity".tr)));
      } else if (Windspeed.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("you must add Wind speed".tr)));
      } else if (salinity.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Salinity must be entered".tr)));
      } else if (totalDissolvedSolids.value == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("TDS should be included".tr)));
      } else if (totalSuspendedSolids.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Total suspended solids must be entered".tr)));
      } else if (pH.value == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("pH is required".tr)));
      } else if (turbidity.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Turbidity must be introduced".tr)));
      } else if (electricalConnection.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Electrical connection must be entered".tr)));
      } else if (dissolvedOxygen.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Dissolved oxygen must be introduced".tr)));
      } else if (volatileOrganicMatter.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Volatile organic matter should be included".tr)));
      } else if (ozone.value == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Ozone must be included".tr)));
      }
      // else if (allKindsOfCarbon.value == "") {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text("All types of carbon must be entered".tr)));
      // }
      else if (nitrogenDioxide.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Nitrogen dioxide must be included".tr)));
      } else if (sulfurDioxide.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Sulfur dioxide should be included".tr)));
      } else if (pM25.value == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("PM25 is required".tr)));
      } else if (pM10.value == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("PM10 is required".tr)));
      } else if (FirstCarpone.value == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("FirstCarpone Required".tr)));
      } else if (SecoundCarpone.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("SecoundCarpone Required".tr)));
      } else if (WaterTemperature.value == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("WaterTemperature Required".tr)));
      } else if (hardness.value.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("hardness".tr)));
      }
      // else if (acidity.value.isEqual(0.0)) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text("acidity".tr)));
      // }
      else {
        adddistanceOfList.clear();
        plantsList.clear();
        underGroundList.clear();
        listOfPollutions.clear();
        semanticList.clear();
        send.value = true;
        await addServices.add(Report(
          FirstCarpone: FirstCarpone.value,
          SecoundCarpone: SecoundCarpone.value,
          WaterTemperature: WaterTemperature.value,
          // Acidity: acidity.value.toString(),
          WindSpeed: Windspeed.value,
          EpicenterDepth: epicenterDepth.value.toString(),
          EpicenterLenght: epicenterLenght.value.toString(),
          EpicenterWidth: epicenterWidth.value.toString(),
          extentOfPolluationDescription: polluationDescription.value,
          photos: imagesList,
          lat: locationData!.latitude!,
          long: locationData!.longitude!,
          SunRise: sunRise.value,
          hasResidentialArea: residentialArea.value,
          hasVegetation: plants.value,
          hasGroundWater: underGround.value,
          epicenterId: epicenterId,
          cityId: cityId.value,
          landFormId: landFormId.value,
          pollutantPlaceId: pollutantPlaceId.value,
          surfaceWaterId: surfaceWaterId.value,
          reportPolluationSourcesIds: polluationSourcesIds,
          reportPotentialPollutantsIds: potentialPollutantsIds,
          reportSurroundingBuildingsIds: distanceOfList,
          temperature: temperature.value,
          // salinity: salinity.value,
          totalDissolvedSolids: totalDissolvedSolids.value,
          totalSuspendedSolids: totalSuspendedSolids.value,
          pH: pH.value,
          turbidity: turbidity.value,
          electricalConnection: electricalConnection.value,
          dissolvedOxygen: dissolvedOxygen.value,
          totalOrganicCarbon: totalOrganicCarbon.value,
          volatileOrganicMatter: volatileOrganicMatter.value,
          ozone: ozone.value,
          // allKindsOfCarbon: allKindsOfCarbon.value,
          nitrogenDioxide: nitrogenDioxide.value,
          sulfurDioxide: sulfurDioxide.value,
          pM25: pM25.value,
          pM10: pM10.value,
          hardness: hardness.value.toString(),
          responsibleAuthorityId: responsibleId.value,
          Humidity: relativehumidity.value,
          WindDirectionId: getAllWindDirectionId.value,
          NatureOfEpicenterId: natureOfEpicenterId.value,
          ReportPlantIds: listPlantPlaces,
          ReportSemanticPollutionIds: listOfsemanticPollution,
          ReportSurroundedMediumIds: listOfsurroundedMediums,
          ReportUndergroundWaterIds: listunderGroundWater,
          reportIndustrialActivitiesIds: ActvitesList,
        ));
        send.value = false;
      }
    } catch (e) {}
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
      // location.getLocation().then((currentLocation) {
      //   _lat = currentLocation.latitude;
      //   _long = currentLocation.longitude;
      //   update();
      // });
    }
  }

  final loading = true.obs;
  RxString landFormText = "choose natural land".tr.obs;
  final landFormId = 0.obs;

  void onTapSelected(BuildContext con, int id, String name) {
    landFormId.value = id;
    print(landFormId.value);
    Navigator.pop(con);
    landFormText.value = name;
    update();
  }

  List<LandFormModel> allLandForm = [];

  getAllLandForm() {
    AllLandForm.getAllLandForm().then((res) {
      //! success
      if (res.runtimeType == List<LandFormModel>) {
        loading.value = false;
        allLandForm = res;
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

  // RxString pollutantReactivitiesText = "Pollutant Reactivities".tr.obs;
  // RxInt pollutantReactivitiesId = 0.obs;
  //
  // void onTapSelectedReactive(BuildContext con, int id, String name) {
  //   pollutantReactivitiesId.value = id;
  //   Navigator.pop(con);
  //   pollutantReactivitiesText.value = name;
  //   update();
  // }

  // List<PollutantReactivitiesModel> allPollutantReactivities = [];

  // getAllPollutantReactivities() {
  //   PollutantReactivitiesService.getAllPollutantReactivities().then((res) {
  //     //! success
  //     if (res.runtimeType == List<PollutantReactivitiesModel>) {
  //       loading.value = false;
  //       allPollutantReactivities = res;
  //     } else if (res == 500) {
  //       //!Server Error
  //       loading.value = false;
  //       Get.defaultDialog(
  //         title: AppStrings.serverErrorTitle,
  //         middleText: AppStrings.serverError,
  //         onConfirm: () => Get.back(),
  //         confirmTextColor: ColorManager.white,
  //         buttonColor: ColorManager.error,
  //         backgroundColor: ColorManager.white,
  //       );
  //     } else if (res == 400) {
  //       loading.value = false;
  //       Get.defaultDialog(
  //         title: AppStrings.error,
  //         middleText: AppStrings.errorMsg,
  //         onConfirm: () => Get.back(),
  //         confirmTextColor: ColorManager.white,
  //         buttonColor: ColorManager.error,
  //         backgroundColor: ColorManager.white,
  //       );
  //     }
  //   });
  // }

  RxString pollutantPlaceText =
      "choose Description of the site of contamination".tr.obs;
  final pollutantPlaceId = 0.obs;

  void onTapSelectedPlace(BuildContext con, int id, String name) {
    pollutantPlaceId.value = id;
    Navigator.pop(con);
    pollutantPlaceText.value = name;
    update();
  }

  List<PollutantPlaceModel> allPollutantPlace = [];

  getPollutantPlace() {
    PollutantPlaceService.getPollutantPlace().then((res) {
      //! success
      if (res.runtimeType == List<PollutantPlaceModel>) {
        loading.value = false;
        allPollutantPlace = res;
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

  RxString surfaceWaterText = "choose type of water".tr.obs;
  RxInt surfaceWaterId = 0.obs;

  onTapSelectedSurface(BuildContext con, int id, String name) {
    surfaceWaterId.value = id;
    Navigator.pop(con);
    surfaceWaterText.value = name;
    update();
  }

  List<SurfaceWaterModel> allSurfaceWater = [];

  getSurfaceWater() {
    SurfaceWaterService.getSurfaceWater().then((res) {
      //! success
      if (res.runtimeType == List<SurfaceWaterModel>) {
        loading.value = false;
        allSurfaceWater = res;
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

  RxString weatherText = "Weather".tr.obs;
  RxInt weatherId = 0.obs;

  onTapSelectedWeather(BuildContext con, int id, String name) {
    weatherId.value = id;
    Navigator.pop(con);
    weatherText.value = name;
    update();
  }

  List<WeatherModel> allWeather = [];

  getWeather() {
    WeatherService.getWeather().then((res) {
      //! success
      if (res.runtimeType == List<WeatherModel>) {
        loading.value = false;
        allWeather = res;
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

  // RxString governorateText = 'Governorate'.tr.obs;
  final governorateText = 'Cities'.tr.obs;

  RxInt governorateId = 0.obs;

  void onTapSelectedGovernorate(BuildContext con, int id, String name) {
    governorateId.value = id;
    Navigator.pop(con);
    governorateText.value = name;
    update();
  }

  List<GovernorateModel> allGovernorate = [];

  getAllGovernorate(int regionId) {
    GovernorateService.getGovernorate(regionId).then((res) {
      //! success
      if (res.runtimeType == List<GovernorateModel>) {
        loading.value = false;
        allGovernorate = res;
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

  final regionText = 'Region'.tr.obs;
  final cityText = 'Cities'.tr.obs;
  final regionId = 0.obs;
  final cityId = 0.obs;
  final allregion = <CitiesModel>[].obs;
  final responsibleAuthoritiesModel = <ResponsibleAuthoritiesModel>[].obs;
  final cities = <CitiesModel>[].obs;
  final servicess = RegionService();

  onTapSelectedcity(BuildContext con, int id, String name) {
    regionId.value = id;
    Navigator.pop(con);
    regionId.value = id;
    update();
  }

  getCities() async {
    cities.value = (await servicess.geCities(regionId.value))!;
  }

  final imagesList = <File>[].obs;
  final pick = false.obs;

  Future pickImagesFormGallery() async {
    pick.value = true;
    try {
      List<XFile>? imagesFromGallery = await ImagePicker().pickMultiImage(
        maxHeight: 600,
        maxWidth: 600,
        imageQuality: 25,
      );
      for (var i = 0; i < imagesFromGallery!.length; i++) {
        imagesList.add(File(imagesFromGallery[i].path));
        print(imagesList[i].path);
        update();
      }
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }

  List<dynamic> selectedPlayer = [];
  var selectedPlayerValue = ''.obs;
  final _picker = ImagePicker();
  final _image = ''.obs;
  final _imageIndustrail = ''.obs;

  String get images => _image.value;

  String get imageIndustrail => _imageIndustrail.value;

  selectImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) _image.value = image.path;
    } catch (e) {
      print(e.toString());
    }
  }

  selectImageIndustrail() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) _imageIndustrail.value = image.path;
    } catch (e) {
      print(e.toString());
    }
  }
}
class ReportBuildingss {
  ReportBuildingss({
    this.surroundingBuildingId,
    this.surroundingBuilding,
    this.distance,
    this.attachment,});

  ReportBuildingss.fromJson(dynamic json) {
    surroundingBuildingId = json['surroundingBuildingId'];
    surroundingBuilding = json['surroundingBuilding'] != null ? SurroundingBuilding.fromJson(json['surroundingBuilding']) : null;
    distance = json['distance'];
    attachment = json['attachment'];
  }
  int? surroundingBuildingId;
  SurroundingBuilding? surroundingBuilding;
  double? distance;
  File? attachment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['surroundingBuildingId'] = surroundingBuildingId;
    if (surroundingBuilding != null) {
      map['surroundingBuilding'] = surroundingBuilding?.toJson();
    }
    map['distance'] = distance;
    map['attachment'] = attachment;
    return map;
  }

}
class ReportIndustrialActivitiesss {
  ReportIndustrialActivitiesss({
    this.attachment,
    this.description,
    this.distance,
    this.industrialActivityId,
    this.industrialActivity,});

  ReportIndustrialActivitiesss.fromJson(dynamic json) {
    attachment = json['attachment'];
    description = json['description'];
    distance = json['distance'];
    industrialActivityId = json['industrialActivityId'];
    industrialActivity = json['industrialActivity'] != null ? IndustrialActivity.fromJson(json['industrialActivity']) : null;
  }
  File? attachment;
  String? description;
  double? distance;
  int? industrialActivityId;
  IndustrialActivity? industrialActivity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attachment'] = attachment;
    map['description'] = description;
    map['distance'] = distance;
    map['industrialActivityId'] = industrialActivityId;
    if (industrialActivity != null) {
      map['industrialActivity'] = industrialActivity?.toJson();
    }
    return map;
  }

}
