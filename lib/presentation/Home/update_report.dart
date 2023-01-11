import 'dart:io';

import 'package:enivronment/app/constants.dart';
import 'package:enivronment/domain/model/ReportModel.dart';
import 'package:enivronment/domain/model/polluation_sources/polluation_sources_model.dart';
import 'package:enivronment/domain/model/report/add_report_model.dart';
import 'package:enivronment/domain/model/report_industrial_activities/report_industrial_activities_model.dart';
import 'package:enivronment/presentation/report/widget/report_divider_widget.dart';
import 'package:enivronment/presentation/report/widget/report_text_field_widget.dart';
import 'package:enivronment/presentation/widget/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../app/shared_widgets/bubbled_loader_widget.dart';
import '../../app/shared_widgets/label_widget.dart';
import '../../data/controller/report/add_report_controller.dart';
import '../../domain/model/potential_pollutants/potential_pollutants_model.dart';
import '../../rejon_model.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class UpdateReportScreen extends StatefulWidget {
  const UpdateReportScreen({
    Key? key,
    this.report,
    this.epicenterId,
  }) : super(key: key);

  final int? epicenterId;

  // final int? reportId;
  // final Epicenters? report;
  final ReportModel? report;

  @override
  State<UpdateReportScreen> createState() => _UpdateReportScreenState();
}

class _UpdateReportScreenState extends State<UpdateReportScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController controllerEpcinter = TextEditingController();

  TextEditingController controllerPolutionSize = TextEditingController();
  TextEditingController controllerotherNote = TextEditingController();
  TextEditingController controllertempreture = TextEditingController();
  TextEditingController controllerSunrise = TextEditingController();
  TextEditingController controllerWindspeed = TextEditingController();
  TextEditingController controllerrelativehumidity = TextEditingController();
  TextEditingController controllersalinity = TextEditingController();
  TextEditingController controlletotalSuspendedSolids = TextEditingController();
  TextEditingController controllepH = TextEditingController();
  TextEditingController controlleturbidity = TextEditingController();
  TextEditingController controlleelectricalConnection = TextEditingController();
  TextEditingController controllerdissolvedOxygen = TextEditingController();
  TextEditingController controllertotalOrganicCarbon = TextEditingController();
  TextEditingController controllerozone = TextEditingController();
  TextEditingController controllerallKindsOfCarbon = TextEditingController();
  TextEditingController controllernitrogenDioxide = TextEditingController();
  TextEditingController controllersulfurDioxide = TextEditingController();
  TextEditingController controllerpM25 = TextEditingController();
  TextEditingController controllerpM10 = TextEditingController();
  TextEditingController controllerHardness = TextEditingController();
  TextEditingController controllerAcidity = TextEditingController();
  TextEditingController controllerWidth = TextEditingController();
  TextEditingController controllerHeight = TextEditingController();
  TextEditingController controllerDepth = TextEditingController();
  TextEditingController controllerVolume = TextEditingController();
  TextEditingController controllerWaterTemperature = TextEditingController();
  TextEditingController controllerFirstCarpone = TextEditingController();
  TextEditingController controllerSecoundCarpone = TextEditingController();
  TextEditingController controllervolatileOrganicMatter =
      TextEditingController();
  TextEditingController controllertotalDissolvedSolids =
      TextEditingController();
  final reportCtrl = Get.put(AddReportController());

  load() {
    reportCtrl.sunRise.value = widget.report!.report == null
        ? reportCtrl.sunRise.value
        : widget.report!.report!.sunRise!;
    reportCtrl.underGround.value = widget.report!.report == null
        ? reportCtrl.underGround.value
        : widget.report!.report!.hasGroundWater!;
    reportCtrl.plants.value = widget.report!.report == null
        ? reportCtrl.plants.value
        : widget.report!.report!.hasVegetation!;
    reportCtrl.residentialArea.value = widget.report!.report == null
        ? reportCtrl.residentialArea.value
        : widget.report!.report!.hasResidentialArea!;
    reportCtrl.landFormId.value = widget.report!.report == null
        ? reportCtrl.landFormId.value
        : widget.report!.report!.landForm!.id!;
    reportCtrl.getAllWindDirectionId.value = widget.report!.report == null ||
            widget.report!.report!.windDirection == null
        ? reportCtrl.getAllWindDirectionId.value
        : widget.report!.report!.windDirection!.id!;
    reportCtrl.getAllWindDirectionText.value = widget.report!.report == null ||
            widget.report!.report!.windDirection == null
        ? reportCtrl.getAllWindDirectionText.value
        : widget.report!.report!.windDirection!.name!;
    reportCtrl.responsibleText.value = widget.report!.report == null
        ? reportCtrl.responsibleText.value
        : widget.report!.report!.responsibleAuthority!.name!;
    reportCtrl.surfaceWaterId.value = widget.report!.report == null
        ? reportCtrl.surfaceWaterId.value
        : widget.report!.report!.surfaceWater!.id!;
    reportCtrl.surfaceWaterText.value = widget.report!.report == null
        ? reportCtrl.surfaceWaterText.value
        : widget.report!.report!.surfaceWater!.name!;
    reportCtrl.pollutantPlaceId.value = widget.report!.report == null
        ? reportCtrl.pollutantPlaceId.value
        : widget.report!.report!.pollutantPlace!.id!;
    reportCtrl.pollutantPlaceText.value = widget.report!.report == null
        ? reportCtrl.pollutantPlaceText.value
        : widget.report!.report!.pollutantPlace!.name!;
    reportCtrl.cityId.value = widget.report!.report == null
        ? reportCtrl.cityId.value
        : widget.report!.city!.id!;
    reportCtrl.cityText.value = widget.report!.report == null
        ? reportCtrl.cityText.value
        : widget.report!.city!.name!;
    reportCtrl.regionId.value = widget.report!.report == null
        ? reportCtrl.regionId.value
        : widget.report!.city!.governorate!.regionId!;
    reportCtrl.regionText.value = widget.report!.report == null
        ? reportCtrl.regionText.value
        : widget.report!.city!.governorate!.name!;

    controllerHardness.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.hardness.toString();
    controllerWidth.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.epicenterWidth.toString();
    controllerAcidity.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.acidity.toString();

    controllerHeight.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.epicenterLenght.toString();
    controllerDepth.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.epicenterDepth.toString();

    controllerotherNote.text = widget.report!.report == null
        ? ""
        : widget.report!.report!.extentOfPolluationDescription.toString();
    controllerrelativehumidity.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.humidity.toString();
    controllerWindspeed.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.windSpeed.toString();
    controllerWaterTemperature.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.waterTemperature.toString();
    controllerSecoundCarpone.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.secoundCarpone.toString();
    controllerFirstCarpone.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.firstCarpone.toString();
    double x = double.parse(controllerWidth.text) *
        double.parse(
            controllerDepth.text.isEmpty ? "1.0" : controllerDepth.text) *
        double.parse(
            controllerHeight.text.isEmpty ? "1.0" : controllerHeight.text);
    controllerVolume.text = x.toString();
    controllertempreture.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.temperature.toString();
    controllersalinity.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.salinity.toString();
    controllertotalDissolvedSolids.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.totalDissolvedSolids.toString();
    controlletotalSuspendedSolids.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.totalSuspendedSolids.toString();
    controllepH.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.ph.toString();
    controlleturbidity.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.turbidity.toString();
    controlleelectricalConnection.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.electricalConnection.toString();
    controllerdissolvedOxygen.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.dissolvedOxygen.toString();
    controllertotalOrganicCarbon.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.totalOrganicCarbon.toString();
    controllervolatileOrganicMatter.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.volatileOrganicMatter.toString();
    controllerozone.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.ozone.toString();
    // controllerallKindsOfCarbon.text = widget.report!.report == null
    //     ? "0.0"
    //     : widget.report!.report!.allKindsOfCarbon.toString();
    controllernitrogenDioxide.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.nitrogenDioxide.toString();
    controllersulfurDioxide.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.sulfurDioxide.toString();
    controllerpM25.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.pM25.toString();
    controllerpM10.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.pM10.toString();
    controllerHardness.text = widget.report!.report == null
        ? "0.0"
        : widget.report!.report!.hardness.toString();

    reportCtrl.responsibleId.value = widget.report!.report == null
        ? reportCtrl.responsibleId.value
        : widget.report!.report!.responsibleAuthority!.id!;
    reportCtrl.natureOfEpicenterId.value = widget.report!.report == null
        ? reportCtrl.natureOfEpicenterId.value
        : widget.report!.report!.natureOfEpicenter!.id!;
    reportCtrl.natureOfEpicenterText.value = widget.report!.report == null
        ? reportCtrl.natureOfEpicenterText.value
        : widget.report!.report!.natureOfEpicenter!.name!;

    if (widget.report!.report == null) {
      reportCtrl.ActvitesList.value = [];
    } else {
      for (int i = 0;
          i < widget.report!.report!.reportIndustrialActivities!.length;
          i++) {
        reportCtrl.ActvitesList.add(ReportIndustrialActivitiesss(
            industrialActivityId: widget.report!.report!
                .reportIndustrialActivities![i].industrialActivityId,
            description: widget
                .report!.report!.reportIndustrialActivities![i].description,
            distance:
                widget.report!.report!.reportIndustrialActivities![i].distance,
            attachment: null,
            industrialActivity: IndustrialActivity(
              name: widget.report!.report!.reportIndustrialActivities![i]
                  .industrialActivity!.name,
            )));
        print(widget.report!.report!.reportIndustrialActivities![i]
            .industrialActivity!.id!);
      }
    }
    // if (widget.report!.report == null) {
    //   reportCtrl.industralActivity.value = [];
    // } else {
    //   reportCtrl.industralActivity.clear();
    //   for (int i = 0;
    //       i < widget.report!.report!.reportIndustrialActivities!.length;
    //       i++) {
    //     reportCtrl.industralActivity.add(widget.report!.report!
    //         .reportIndustrialActivities![i].industrialActivity!.name!);
    //     print(reportCtrl.industralActivity);
    //   }
    // }
    if (widget.report!.report == null) {
      reportCtrl.potentialPollutantsIds.value = [];
    } else {
      reportCtrl.potentialPollutantsIds.clear();
      for (int i = 0;
          i < widget.report!.report!.reportPotentialPollutants!.length;
          i++) {
        reportCtrl.potentialPollutantsIds.add(widget.report!.report!
            .reportPotentialPollutants![i].potentialPollutant!.id!);
        print(widget
            .report!.report!.reportPotentialPollutants![i].potentialPollutant);
      }
    }
    if (widget.report!.report == null) {
      reportCtrl.potentialcontaminants.value = [];
    } else {
      reportCtrl.potentialcontaminants.clear();
      for (int i = 0;
          i < widget.report!.report!.reportPotentialPollutants!.length;
          i++) {
        reportCtrl.potentialcontaminants.add(widget.report!.report!
            .reportPotentialPollutants![i].potentialPollutant!.name!);
      }
    }

    if (widget.report!.report == null) {
      print("plantsssssssss");
      reportCtrl.listPlantPlaces.value = [];
      print(reportCtrl.listPlantPlaces.length);
    } else {
      reportCtrl.listPlantPlaces.clear();
      for (int i = 0; i < widget.report!.report!.reportPlants!.length; i++) {
        reportCtrl.listPlantPlaces
            .add(widget.report!.report!.reportPlants![i].id!);
        print("plantsssssssss");
        print(reportCtrl.listPlantPlaces.length);
      }
    }
    if (widget.report!.report == null) {
      reportCtrl.plantsList.value = [];
      print(reportCtrl.plantsList.length);
    } else {
      reportCtrl.plantsList.clear();
      print("plants");
      for (int i = 0; i < widget.report!.report!.reportPlants!.length; i++) {
        reportCtrl.plantsList
            .add(widget.report!.report!.reportPlants![i].name!);
        print("plants");
        print(reportCtrl.plantsList.length);
      }
    }

    if (widget.report!.report == null) {
      reportCtrl.listOfsemanticPollution.value = [];
      print(reportCtrl.listOfsemanticPollution.length);
    } else {
      reportCtrl.listOfsemanticPollution.clear();
      for (int i = 0;
          i < widget.report!.report!.reportSemanticPollutions!.length;
          i++) {
        reportCtrl.listOfsemanticPollution
            .add(widget.report!.report!.reportSemanticPollutions![i].id!);
        print("listOfsemanticPollution");
        print(reportCtrl.listOfsemanticPollution.length);
      }
    }
    if (widget.report!.report == null) {
      reportCtrl.listOfsemanticPollution.value = [];
      print(reportCtrl.listOfsemanticPollution.length);
    } else {
      reportCtrl.pollution.clear();
      for (int i = 0;
          i < widget.report!.report!.reportSemanticPollutions!.length;
          i++) {
        reportCtrl.pollution
            .add(widget.report!.report!.reportSemanticPollutions![i].name!);
        print("pollution");
        print(reportCtrl.pollution.length);
      }
    }

    if (widget.report!.report == null) {
      reportCtrl.listOfImages.value = [];
      print(reportCtrl.listOfImages.length);
    } else {
      reportCtrl.listOfImages.clear();
      for (int i = 0; i < widget.report!.report!.reportPhotos!.length; i++) {
        print(widget.report!.report!.reportPhotos![i].photo!);
        reportCtrl.listOfImages
            .add(widget.report!.report!.reportPhotos![i].photo!);
        print(reportCtrl.listOfImages.length);
      }
    }

    if (widget.report!.report == null) {
      reportCtrl.polluationSourcesIds.value = [];
    } else {
      reportCtrl.polluationSourcesIds.clear();
      for (int i = 0;
          i < widget.report!.report!.reportPolluationSources!.length;
          i++) {
        reportCtrl.polluationSourcesIds.add(widget
            .report!.report!.reportPolluationSources![i].polluationSource!.id!);
        print(reportCtrl.polluationSourcesIds.length);
      }
    }
    if (widget.report!.report == null) {
      reportCtrl.medium.value = [];
    } else {
      reportCtrl.medium.clear();
      for (int i = 0;
          i < widget.report!.report!.reportPolluationSources!.length;
          i++) {
        reportCtrl.medium.add(widget.report!.report!.reportPolluationSources![i]
            .polluationSource!.name!);
        print(reportCtrl.medium.length);
      }
    }
    if (widget.report!.report == null) {
      reportCtrl.listunderGroundWater.value = [];
    } else {
      reportCtrl.listunderGroundWater.clear();
      for (int i = 0;
          i < widget.report!.report!.reportUndergroundWaters!.length;
          i++) {
        reportCtrl.listunderGroundWater
            .add(widget.report!.report!.reportUndergroundWaters![i].id!);
        print(reportCtrl.listunderGroundWater.length);
      }
    }
    if (widget.report!.report == null) {
      reportCtrl.underGroundList.value = [];
    } else {
      reportCtrl.underGroundList.clear();
      for (int i = 0;
          i < widget.report!.report!.reportUndergroundWaters!.length;
          i++) {
        reportCtrl.underGroundList
            .add(widget.report!.report!.reportUndergroundWaters![i].name!);
        print(reportCtrl.underGroundList.length);
      }
    }

    if (widget.report!.report == null) {
      reportCtrl.listOfsemanticPollution.value = [];
    } else {
      reportCtrl.listOfsemanticPollution.clear();
      for (int i = 0;
          i < widget.report!.report!.reportSemanticPollutions!.length;
          i++) {
        print(widget.report!.report!.reportSemanticPollutions!);
        reportCtrl.listOfsemanticPollution
            .add(widget.report!.report!.reportSemanticPollutions![i].id!);
        print(reportCtrl.listOfsemanticPollution.length);
      }
    }
    if (widget.report!.report == null) {
      reportCtrl.listOfsurroundedMediums.value = [];
    } else {
      reportCtrl.listOfsurroundedMediums.clear();
      for (int i = 0;
          i < widget.report!.report!.reportSurroundedMediums!.length;
          i++) {
        print(widget.report!.report!.reportSurroundedMediums!);
        reportCtrl.listOfsurroundedMediums
            .add(widget.report!.report!.reportSurroundedMediums![i].id!);
        print(reportCtrl.listOfsurroundedMediums.length);
      }
    }
    if (widget.report!.report == null) {
      reportCtrl.mediumPollution.value = [];
    } else {
      reportCtrl.mediumPollution.clear();
      for (int i = 0;
          i < widget.report!.report!.reportSurroundedMediums!.length;
          i++) {
        print(widget.report!.report!.reportSurroundedMediums!);
        reportCtrl.mediumPollution
            .add(widget.report!.report!.reportSurroundedMediums![i].name!);
        if (reportCtrl.mediumPollution[i] == "مياه") {
          reportCtrl.water.value = true;
        } else if (reportCtrl.mediumPollution[i] == "تربه") {
          reportCtrl.earth.value = true;
        } else if (reportCtrl.mediumPollution[i] == "هواء") {
          reportCtrl.air.value = true;
        }
        print(reportCtrl.mediumPollution.length);
      }
    }
    // if (widget.report!.report == null) {
    //   reportCtrl.listDistance.value = [];
    // } else {
    //   reportCtrl.listDistance.clear();
    //   for (int i = 0;
    //       i < widget.report!.report!.reportSurroundingBuildings!.length;
    //       i++) {
    //     print(widget.report!.report!.reportSurroundingBuildings!);
    //     reportCtrl.listDistance.add(ReportBuildings(
    //         distance:
    //             widget.report!.report!.reportSurroundingBuildings![i].distance,
    //         surroundingBuilding: SurroundingBuilding(name:widget.report!.report!
    //             .reportSurroundingBuildings![i].surroundingBuilding!.name!)));
    //     print(reportCtrl.listDistance.length);
    //   }
    // }
    if (widget.report!.report == null) {
      reportCtrl.distanceOfList.value = [];
    } else {
      reportCtrl.distanceOfList.clear();
      for (int i = 0;
          i < widget.report!.report!.reportSurroundingBuildings!.length;
          i++) {
        print(widget.report!.report!.reportSurroundingBuildings!);
        reportCtrl.distanceOfList.add(ReportBuildingss(
            surroundingBuildingId: widget.report!.report!
                .reportSurroundingBuildings![i].surroundingBuildingId,
            distance:
                widget.report!.report!.reportSurroundingBuildings![i].distance,
            surroundingBuilding: SurroundingBuilding(
                name: widget.report!.report!.reportSurroundingBuildings![i]
                    .surroundingBuilding!.name!)));
        print(reportCtrl.distanceOfList.length);
      }
    }

    reportCtrl.landFormText.value = widget.report!.report == null
        ? reportCtrl.landFormText.value
        : widget.report!.report!.landForm!.name!;
    reportCtrl.pollutantPlaceText.value = widget.report!.report == null
        ? reportCtrl.pollutantPlaceText.value
        : widget.report!.report!.pollutantPlace!.name!;
    reportCtrl.surfaceWaterText.value = widget.report!.report == null
        ? reportCtrl.surfaceWaterText.value
        : widget.report!.report!.surfaceWater!.name!;
    reportCtrl.changeExtentOfPolluationDescription(widget.report!.report == null
        ? ""
        : widget.report!.report!.extentOfPolluationDescription);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios),
                color: ColorManager.primary,
              ),
              title: Center(
                child: Text(
                  "update report".tr,
                  overflow: TextOverflow.clip,
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18),
                ),
              ),
            ),
            body: Obx(
              () => reportCtrl.load.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // LabelWidget(label: "HotSpot Size".tr),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       left: AppPadding.p12,
                            //       right: AppPadding.p12,
                            //       top: AppPadding.p12),
                            //   child: TextFormField(
                            //     controller: controllerEpcinter,
                            //     keyboardType: TextInputType.number,
                            //     cursorColor: ColorManager.secondary,
                            //     style: TextStyle(color: ColorManager.secondary),
                            //     decoration: InputDecoration(
                            //         border: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               width: AppSize.s2, color: ColorManager.secondary),
                            //           borderRadius: BorderRadius.circular(AppSize.s12),
                            //         ),
                            //         focusedBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               width: AppSize.s2, color: ColorManager.secondary),
                            //           borderRadius: BorderRadius.circular(AppSize.s12),
                            //         ),
                            //         hintStyle: TextStyle(
                            //             fontSize: FontSize.s12,
                            //             fontWeight: FontWeight.bold,
                            //             color: ColorManager.grey),
                            //         labelStyle: TextStyle(
                            //             fontSize: FontSize.s12,
                            //             fontWeight: FontWeight.bold,
                            //             color: ColorManager.secondary)),
                            //     onChanged: (val) async {
                            //       reportCtrl.epicenterSize.value = double.parse(val);
                            //       print(reportCtrl.epicenterSize.value);
                            //     },
                            //     validator: (value) {
                            //       if (value == null || value.isEmpty) {
                            //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //             content: Text("Please enter HotSpot Size".tr)));
                            //         return 'Please enter HotSpot Size'.tr;
                            //       }
                            //       if (!value.isNum) {
                            //         return 'Please enter Valid HotSpot Size'.tr;
                            //       }
                            //       if (value.length >= 12) {
                            //         return 'Please enter Valid HotSpot Size'.tr;
                            //       }
                            //       return null;
                            //     }, // enabledBorder: InputBorder.none,
                            //   ),
                            // ),
                            // //? divider
                            // const ReportDividerWidget(),
                            //!Polluation Size
                            // LabelWidget(label: "Polluation Size".tr),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       left: AppPadding.p12,
                            //       right: AppPadding.p12,
                            //       top: AppPadding.p12),
                            //   child: TextFormField(
                            //     controller: controllerPolutionSize,
                            //     keyboardType: TextInputType.number,
                            //     cursorColor: ColorManager.secondary,
                            //     style: TextStyle(color: ColorManager.secondary),
                            //     decoration: InputDecoration(
                            //         border: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               width: AppSize.s2,
                            //               color: ColorManager.secondary),
                            //           borderRadius:
                            //               BorderRadius.circular(AppSize.s12),
                            //         ),
                            //         focusedBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               width: AppSize.s2,
                            //               color: ColorManager.secondary),
                            //           borderRadius:
                            //               BorderRadius.circular(AppSize.s12),
                            //         ),
                            //         hintStyle: TextStyle(
                            //             fontSize: FontSize.s12,
                            //             fontWeight: FontWeight.bold,
                            //             color: ColorManager.grey),
                            //         labelStyle: TextStyle(
                            //             fontSize: FontSize.s12,
                            //             fontWeight: FontWeight.bold,
                            //             color: ColorManager.secondary)),
                            //     onChanged: (val) {
                            //       reportCtrl.polluationSize.value =
                            //           double.parse(val);
                            //       reportCtrl.changePolluationSize(val);
                            //       print(reportCtrl.polluationSize.value);
                            //     },
                            //
                            //     validator: (value) {
                            //       if (value == null || value.isEmpty) {
                            //         ScaffoldMessenger.of(context).showSnackBar(
                            //             SnackBar(
                            //                 content: Text(
                            //                     "Please enter Polluation Size"
                            //                         .tr)));
                            //         return 'Please enter Polluation Size'.tr;
                            //       }
                            //       if (!value.isNum) {
                            //         return 'Please enter Valid Polluation Size'.tr;
                            //       }
                            //       if (value.length >= 12) {
                            //         return 'Please enter Valid Polluation Size'.tr;
                            //       }
                            //       return null;
                            //     }, // enabledBorder: InputBorder.none,
                            //   ),
                            // ),
                            LabelWidget(
                                label: "Is there Residential Area ?".tr),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: true,
                                          groupValue:
                                              reportCtrl.residentialArea.value,
                                          toggleable: true,
                                          activeColor: ColorManager.secondary,
                                          onChanged: (bool? v) {
                                            reportCtrl.addPlaces(v!);
                                            print(v);
                                          },
                                        )),
                                    Text(
                                      'yes'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: false,
                                          groupValue:
                                              reportCtrl.residentialArea.value,
                                          toggleable: true,
                                          activeColor: ColorManager.secondary,
                                          onChanged: (bool? v) {
                                            reportCtrl.addPlaces(v!);
                                            print(v);
                                          },
                                        )),
                                    Text(
                                      'no'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            LabelWidget(label: "Sun rise".tr),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: true,
                                          groupValue: reportCtrl.sunRise.value,
                                          toggleable: true,
                                          activeColor: ColorManager.secondary,
                                          onChanged: (bool? v) {
                                            reportCtrl.addSunRise(v ?? false);
                                            print(v);
                                          },
                                        )),
                                    Text(
                                      'yes'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: false,
                                          groupValue: reportCtrl.sunRise.value,
                                          toggleable: true,
                                          activeColor: ColorManager.secondary,
                                          onChanged: (bool? v) {
                                            reportCtrl.addSunRise(v ?? false);
                                            print(v);
                                          },
                                        )),
                                    Text(
                                      'no'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ],
                                )
                              ],
                            ),

                            //? divider
                            const ReportDividerWidget(),
                            //!vegetation
                            LabelWidget(label: "Is there vegetation?".tr),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: true,
                                          groupValue: reportCtrl.plants.value,
                                          toggleable: true,
                                          activeColor: ColorManager.secondary,
                                          onChanged: (bool? v) {
                                            reportCtrl.addVeg(v!);
                                            print(v);
                                          },
                                        )),
                                    Text(
                                      'yes'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: false,
                                          groupValue: reportCtrl.plants.value,
                                          toggleable: true,
                                          activeColor: ColorManager.secondary,
                                          onChanged: (bool? v) {
                                            reportCtrl.addVeg(v!);
                                            print(v);
                                          },
                                        )),
                                    Text(
                                      'no'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Obx(() => reportCtrl.plants.value == true
                                ? Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: MultiSelectDialogField(
                                        listType: MultiSelectListType.LIST,
                                        chipDisplay: MultiSelectChipDisplay(
                                          textStyle: const TextStyle(
                                              color: Colors.white),
                                          chipColor: ColorManager.primary,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        buttonIcon: const Icon(
                                          Icons.arrow_drop_down_sharp,
                                          color: Colors.grey,
                                        ),
                                        buttonText: Text(
                                          reportCtrl.plantText.value,
                                          style: TextStyle(
                                            color: ColorManager.secondary,
                                            fontSize: 16,
                                          ),
                                        ),
                                        items: reportCtrl.plantList
                                            .map((player) =>
                                                MultiSelectItem<CitiesModel>(
                                                    player, player.name))
                                            .toList(),
                                        selectedColor: Colors.blue,
                                        searchable: true,
                                        onConfirm: (results) {
                                          reportCtrl.selectedPlayer = results;
                                          reportCtrl.selectedPlayerValue.value =
                                              "";
                                          reportCtrl.selectedPlayer
                                              .forEach((element) {
                                            reportCtrl.listPlantPlaces
                                                .add(element.id);
                                            print(element.id);
                                            reportCtrl
                                                    .selectedPlayerValue.value =
                                                "${reportCtrl.selectedPlayerValue.value} " +
                                                    element.name;
                                          });
                                        },
                                      ),
                                    ),
                                    // GestureDetector(
                                    //     onTap: () {
                                    //       showModalBottomSheet(
                                    //         context: context,
                                    //         builder: (ctx) => SizedBox(
                                    //             height: SizeConfig.screenHeight! /
                                    //                 MediaSize.m2_5,
                                    //             child: ListView.builder(
                                    //                 itemCount:
                                    //                     reportCtrl.plantList.length,
                                    //                 itemBuilder: (context, index) {
                                    //                   return Padding(
                                    //                     padding: const EdgeInsets
                                    //                             .symmetric(
                                    //                         horizontal:
                                    //                             AppPadding.p60,
                                    //                         vertical:
                                    //                             AppPadding.p16),
                                    //                     child: Container(
                                    //                       alignment:
                                    //                           Alignment.center,
                                    //                       height: SizeConfig
                                    //                               .screenHeight! /
                                    //                           MediaSize.m12,
                                    //                       decoration: BoxDecoration(
                                    //                           borderRadius:
                                    //                               BorderRadius.circular(
                                    //                                   BorderRadiusValues
                                    //                                       .br10),
                                    //                           border: Border.all(
                                    //                               width: AppSize.s1,
                                    //                               color:
                                    //                                   ColorManager
                                    //                                       .grey)),
                                    //                       child: Row(
                                    //                         children: [
                                    //                           Obx(() => Checkbox(
                                    //                               activeColor:
                                    //                                   ColorManager
                                    //                                       .primary,
                                    //                               value: reportCtrl
                                    //                                       .plantListList[
                                    //                                   index],
                                    //                               onChanged: (v) {
                                    //                                 reportCtrl
                                    //                                         .plantListList[
                                    //                                     index] = v;
                                    //                                 reportCtrl
                                    //                                         .plantId
                                    //                                         .value =
                                    //                                     reportCtrl
                                    //                                         .plantList[
                                    //                                             index]
                                    //                                         .id;
                                    //                                 reportCtrl.addPlantList(
                                    //                                     index,
                                    //                                     reportCtrl
                                    //                                             .plantId
                                    //                                             .value =
                                    //                                         reportCtrl
                                    //                                             .plantList[
                                    //                                                 index]
                                    //                                             .id,
                                    //                                     reportCtrl
                                    //                                         .plantList[
                                    //                                             index]
                                    //                                         .name);
                                    //                                 print(v);
                                    //                               })),
                                    //                           Flexible(
                                    //                             child: Text(
                                    //                                 reportCtrl
                                    //                                     .plantList[
                                    //                                         index]
                                    //                                     .name,
                                    //                                 style: getSemiBoldStyle(
                                    //                                     color: ColorManager
                                    //                                         .secondary)),
                                    //                           ),
                                    //                           Spacer(),
                                    //                           GestureDetector(
                                    //                             onTap: () {
                                    //                               Navigator.pop(
                                    //                                   context);
                                    //                             },
                                    //                             child: Container(
                                    //                                 width: 25,
                                    //                                 height: 25,
                                    //                                 color:
                                    //                                     ColorManager
                                    //                                         .primary,
                                    //                                 child: Icon(
                                    //                                   Icons.add,
                                    //                                   color: Colors
                                    //                                       .white,
                                    //                                 )),
                                    //                           ),
                                    //                         ],
                                    //                       ),
                                    //                     ),
                                    //                   );
                                    //                 })),
                                    //       );
                                    //     },
                                    //     child: Container(
                                    //       padding: const EdgeInsets.symmetric(
                                    //           horizontal: AppPadding.p10),
                                    //       margin: const EdgeInsets.only(
                                    //           right: AppMargin.m30,
                                    //           left: AppMargin.m30,
                                    //           top: AppMargin.m20),
                                    //       alignment: Alignment.centerRight,
                                    //       height: SizeConfig.screenHeight! /
                                    //           MediaSize.m16,
                                    //       decoration: BoxDecoration(
                                    //         border: Border.all(
                                    //             width: AppSize.s1,
                                    //             color: ColorManager.grey),
                                    //         borderRadius: BorderRadius.circular(
                                    //             BorderRadiusValues.br5),
                                    //       ),
                                    //       child: reportCtrl.load.value
                                    //           ? const BubbleLoader()
                                    //           : Row(
                                    //               mainAxisAlignment:
                                    //                   MainAxisAlignment.spaceAround,
                                    //               children: [
                                    //                 Text(reportCtrl.plantText.value,
                                    //                     textAlign: TextAlign.center,
                                    //                     style: getSemiBoldStyle(
                                    //                         color: ColorManager
                                    //                             .secondary)),
                                    //                 const Spacer(),
                                    //                 Icon(
                                    //                   Icons.arrow_drop_down,
                                    //                   color: ColorManager.secondary,
                                    //                   size: AppSize.s30,
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //     ))
                                  )
                                // Obx(() => GestureDetector(
                                //         onTap: () {
                                //           showModalBottomSheet(
                                //             context: context,
                                //             builder: (ctx) => SizedBox(
                                //                 height: SizeConfig.screenHeight! /
                                //                     MediaSize.m2_5,
                                //                 child: ListView.builder(
                                //                     itemCount:
                                //                         reportCtrl.plantList.length,
                                //                     itemBuilder: (context, index) {
                                //                       return InkWell(
                                //                         onTap: () {
                                //                           reportCtrl
                                //                                   .plantText.value =
                                //                               reportCtrl
                                //                                   .plantList[index]
                                //                                   .name;
                                //                           reportCtrl.plantId.value =
                                //                               reportCtrl
                                //                                   .plantList[index]
                                //                                   .id;
                                //                           Navigator.pop(context);
                                //                         },
                                //                         child: Padding(
                                //                           padding: const EdgeInsets
                                //                                   .symmetric(
                                //                               horizontal:
                                //                                   AppPadding.p60,
                                //                               vertical:
                                //                                   AppPadding.p16),
                                //                           child: Container(
                                //                             alignment:
                                //                                 Alignment.center,
                                //                             height: SizeConfig
                                //                                     .screenHeight! /
                                //                                 MediaSize.m12,
                                //                             decoration: BoxDecoration(
                                //                                 borderRadius:
                                //                                     BorderRadius.circular(
                                //                                         BorderRadiusValues
                                //                                             .br10),
                                //                                 border: Border.all(
                                //                                     width:
                                //                                         AppSize.s1,
                                //                                     color:
                                //                                         ColorManager
                                //                                             .grey)),
                                //                             child: Row(
                                //                               children: [
                                //                                 Obx(() => Checkbox(
                                //                                     activeColor:
                                //                                         ColorManager
                                //                                             .primary,
                                //                                     value: reportCtrl
                                //                                             .plantListList[
                                //                                         index],
                                //                                     onChanged: (v) {
                                //                                       reportCtrl
                                //                                               .plantListList[
                                //                                           index] = v;
                                //                                       reportCtrl
                                //                                               .plantId
                                //                                               .value =
                                //                                           reportCtrl
                                //                                               .plantList[
                                //                                                   index]
                                //                                               .id;
                                //                                       reportCtrl
                                //                                           .addPlantList(
                                //                                         index,
                                //                                         reportCtrl
                                //                                                 .plantId
                                //                                                 .value =
                                //                                             reportCtrl
                                //                                                 .plantList[index]
                                //                                                 .id,
                                //                                         reportCtrl
                                //                                             .plantList[
                                //                                                 index]
                                //                                             .name,
                                //                                       );
                                //                                       print(v);
                                //                                     })),
                                //                                 Flexible(
                                //                                   child: Text(
                                //                                       reportCtrl
                                //                                           .plantList[
                                //                                               index]
                                //                                           .name,
                                //                                       style: getSemiBoldStyle(
                                //                                           color: ColorManager
                                //                                               .secondary)),
                                //                                 ),
                                //                                 Spacer(),
                                //                                 GestureDetector(
                                //                                   onTap: () {
                                //                                     Navigator.pop(
                                //                                         context);
                                //                                   },
                                //                                   child: Container(
                                //                                       width: 25,
                                //                                       height: 25,
                                //                                       color: ColorManager
                                //                                           .primary,
                                //                                       child: Icon(
                                //                                         Icons.add,
                                //                                         color: Colors
                                //                                             .white,
                                //                                       )),
                                //                                 ),
                                //                               ],
                                //                             ),
                                //                           ),
                                //                         ),
                                //                       );
                                //                     })),
                                //           );
                                //         },
                                //         child: Container(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: AppPadding.p10),
                                //           margin: const EdgeInsets.only(
                                //               right: AppMargin.m30,
                                //               left: AppMargin.m30,
                                //               top: AppMargin.m20),
                                //           alignment: Alignment.centerRight,
                                //           height: SizeConfig.screenHeight! /
                                //               MediaSize.m16,
                                //           decoration: BoxDecoration(
                                //             border: Border.all(
                                //                 width: AppSize.s1,
                                //                 color: ColorManager.grey),
                                //             borderRadius: BorderRadius.circular(
                                //                 BorderRadiusValues.br5),
                                //           ),
                                //           child: reportCtrl.load.value
                                //               ? const BubbleLoader()
                                //               : Row(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment.spaceAround,
                                //                   children: [
                                //                     Text(reportCtrl.plantText.value,
                                //                         textAlign: TextAlign.center,
                                //                         style: getSemiBoldStyle(
                                //                             color: ColorManager
                                //                                 .secondary)),
                                //                     const Spacer(),
                                //                     Icon(
                                //                       Icons.arrow_drop_down,
                                //                       color: ColorManager.secondary,
                                //                       size: AppSize.s30,
                                //                     ),
                                //                   ],
                                //                 ),
                                //         )))
                                : const SizedBox()),

                            Obx(() => reportCtrl.plantsList.isNotEmpty &&
                                    reportCtrl.plants.isTrue
                                ? SizedBox(
                                    height: 45,
                                    child: ListView.builder(
                                      itemCount: reportCtrl.plantsList.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorManager.secondary
                                                  .withOpacity(
                                                      OpicityValue.o3)),
                                          child: Center(
                                            child: Text(
                                                reportCtrl.plantsList[index],
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                            const ReportDividerWidget(),

                            //!ground water
                            LabelWidget(label: "Is there ground water ?".tr),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: true,
                                          groupValue:
                                              reportCtrl.underGround.value,
                                          toggleable: true,
                                          activeColor: ColorManager.secondary,
                                          onChanged: (bool? v) {
                                            reportCtrl.addUnderGround(v!);
                                            print(v);
                                          },
                                        )),
                                    Text(
                                      'yes'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: false,
                                          groupValue:
                                              reportCtrl.underGround.value,
                                          toggleable: true,
                                          activeColor: ColorManager.secondary,
                                          onChanged: (bool? v) {
                                            reportCtrl.addUnderGround(v!);
                                            print(v);
                                          },
                                        )),
                                    Text(
                                      'no'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ],
                                )
                              ],
                            ),

                            Obx(() => reportCtrl.underGround.value
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: MultiSelectDialogField(
                                      listType: MultiSelectListType.LIST,
                                      chipDisplay: MultiSelectChipDisplay(
                                        textStyle: const TextStyle(
                                            color: Colors.white),
                                        chipColor: ColorManager.primary,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      buttonIcon: const Icon(
                                        Icons.arrow_drop_down_sharp,
                                        color: Colors.grey,
                                      ),
                                      buttonText: Text(
                                        reportCtrl.groundWaterText.value,
                                        style: TextStyle(
                                          color: ColorManager.secondary,
                                          fontSize: 16,
                                        ),
                                      ),
                                      items: reportCtrl.underGroundWater
                                          .map((player) =>
                                              MultiSelectItem<CitiesModel>(
                                                  player, player.name))
                                          .toList(),
                                      selectedColor: Colors.blue,
                                      searchable: true,
                                      onConfirm: (results) {
                                        reportCtrl.selectedPlayer = results;
                                        reportCtrl.selectedPlayerValue.value =
                                            "";
                                        reportCtrl.selectedPlayer
                                            .forEach((element) {
                                          reportCtrl.listunderGroundWater
                                              .add(element.id);
                                          print(element.id);
                                          reportCtrl.selectedPlayerValue.value =
                                              "${reportCtrl.selectedPlayerValue.value} " +
                                                  element.name;
                                        });
                                      },
                                    ),
                                  )
                                // GestureDetector(
                                //         onTap: () {
                                //           showModalBottomSheet(
                                //             context: context,
                                //             builder: (ctx) => SizedBox(
                                //                 height: SizeConfig.screenHeight! /
                                //                     MediaSize.m2_5,
                                //                 child: ListView.builder(
                                //                     itemCount: reportCtrl
                                //                         .underGroundWater.length,
                                //                     itemBuilder: (context, index) {
                                //                       return InkWell(
                                //                         onTap: () {
                                //                           reportCtrl.groundWaterText
                                //                                   .value =
                                //                               reportCtrl
                                //                                   .underGroundWater[
                                //                                       index]
                                //                                   .name;
                                //                           reportCtrl.waterGroundId
                                //                                   .value =
                                //                               reportCtrl
                                //                                   .underGroundWater[
                                //                                       index]
                                //                                   .id;
                                //                           Navigator.pop(context);
                                //                         },
                                //                         child: Padding(
                                //                           padding: const EdgeInsets
                                //                                   .symmetric(
                                //                               horizontal:
                                //                                   AppPadding.p60,
                                //                               vertical:
                                //                                   AppPadding.p16),
                                //                           child: Container(
                                //                             alignment:
                                //                                 Alignment.center,
                                //                             height: SizeConfig
                                //                                     .screenHeight! /
                                //                                 MediaSize.m12,
                                //                             decoration: BoxDecoration(
                                //                                 borderRadius:
                                //                                     BorderRadius.circular(
                                //                                         BorderRadiusValues
                                //                                             .br10),
                                //                                 border: Border.all(
                                //                                     width:
                                //                                         AppSize.s1,
                                //                                     color:
                                //                                         ColorManager
                                //                                             .grey)),
                                //                             child: Row(
                                //                               children: [
                                //                                 Obx(() => Checkbox(
                                //                                     activeColor:
                                //                                         ColorManager
                                //                                             .primary,
                                //                                     value: reportCtrl
                                //                                             .underGroundWaterList[
                                //                                         index],
                                //                                     onChanged: (v) {
                                //                                       reportCtrl
                                //                                               .underGroundWaterList[
                                //                                           index] = v;
                                //                                       reportCtrl
                                //                                               .waterGroundId
                                //                                               .value =
                                //                                           reportCtrl
                                //                                               .underGroundWater[
                                //                                                   index]
                                //                                               .id;
                                //                                       reportCtrl.addunderGroundWaterList(
                                //                                           index,
                                //                                           reportCtrl
                                //                                               .waterGroundId
                                //                                               .value,
                                //                                           reportCtrl
                                //                                               .underGroundWater[
                                //                                                   index]
                                //                                               .name);
                                //                                       print(v);
                                //                                     })),
                                //                                 Flexible(
                                //                                   child: Text(
                                //                                       reportCtrl
                                //                                           .underGroundWater[
                                //                                               index]
                                //                                           .name,
                                //                                       style: getSemiBoldStyle(
                                //                                           color: ColorManager
                                //                                               .secondary)),
                                //                                 ),
                                //                                 Spacer(),
                                //                                 GestureDetector(
                                //                                   onTap: () {
                                //                                     Navigator.pop(
                                //                                         context);
                                //                                   },
                                //                                   child: Container(
                                //                                       width: 25,
                                //                                       height: 25,
                                //                                       color: ColorManager
                                //                                           .primary,
                                //                                       child: Icon(
                                //                                         Icons.add,
                                //                                         color: Colors
                                //                                             .white,
                                //                                       )),
                                //                                 ),
                                //                               ],
                                //                             ),
                                //                           ),
                                //                         ),
                                //                       );
                                //                     })),
                                //           );
                                //         },
                                //         child: Container(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: AppPadding.p10),
                                //           margin: const EdgeInsets.only(
                                //               right: AppMargin.m30,
                                //               left: AppMargin.m30,
                                //               top: AppMargin.m20),
                                //           alignment: Alignment.centerRight,
                                //           height: SizeConfig.screenHeight! /
                                //               MediaSize.m16,
                                //           decoration: BoxDecoration(
                                //             border: Border.all(
                                //                 width: AppSize.s1,
                                //                 color: ColorManager.grey),
                                //             borderRadius: BorderRadius.circular(
                                //                 BorderRadiusValues.br5),
                                //           ),
                                //           child: Row(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceAround,
                                //             children: [
                                //               Obx(() => reportCtrl
                                //                       .groundWaterText.isEmpty
                                //                   ? BubbleLoader()
                                //                   : Text(
                                //                       reportCtrl
                                //                           .groundWaterText.value,
                                //                       textAlign: TextAlign.center,
                                //                       style: getSemiBoldStyle(
                                //                           color: ColorManager
                                //                               .secondary))),
                                //               const Spacer(),
                                //               Icon(
                                //                 Icons.arrow_drop_down,
                                //                 color: ColorManager.secondary,
                                //                 size: AppSize.s30,
                                //               ),
                                //             ],
                                //           ),
                                //         ))
                                : SizedBox()),
                            Obx(() => reportCtrl.underGroundList.isNotEmpty &&
                                    reportCtrl.underGround.isTrue
                                ? SizedBox(
                                    height: 45,
                                    child: ListView.builder(
                                      itemCount:
                                          reportCtrl.underGroundList.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorManager.secondary
                                                  .withOpacity(
                                                      OpicityValue.o3)),
                                          child: Center(
                                            child: Text(
                                                reportCtrl
                                                    .underGroundList[index],
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                            const ReportDividerWidget(),
                            //!Land Form
                            LabelWidget(label: "Land Form ".tr),
                            Obx(() => GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => SizedBox(
                                        height: SizeConfig.screenHeight! /
                                            MediaSize.m2_5,
                                        child: ListView.builder(
                                            itemCount:
                                                reportCtrl.allLandForm.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  reportCtrl.onTapSelected(
                                                      ctx,
                                                      reportCtrl
                                                          .allLandForm[index]
                                                          .id,
                                                      reportCtrl
                                                          .allLandForm[index]
                                                          .name);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          AppPadding.p60,
                                                      vertical: AppPadding.p16),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: SizeConfig
                                                            .screenHeight! /
                                                        MediaSize.m12,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                BorderRadiusValues
                                                                    .br10),
                                                        border: Border.all(
                                                            width: AppSize.s1,
                                                            color: ColorManager
                                                                .grey)),
                                                    child: Text(
                                                        reportCtrl
                                                            .allLandForm[index]
                                                            .name,
                                                        style: getSemiBoldStyle(
                                                            color: ColorManager
                                                                .secondary)),
                                                  ),
                                                ),
                                              );
                                            })),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10),
                                  margin: const EdgeInsets.only(
                                      right: AppMargin.m30,
                                      left: AppMargin.m30,
                                      top: AppMargin.m20),
                                  alignment: Alignment.centerRight,
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m16,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br5),
                                  ),
                                  child: reportCtrl.loading.value
                                      ? const BubbleLoader()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(reportCtrl.landFormText.value,
                                                textAlign: TextAlign.center,
                                                style: getSemiBoldStyle(
                                                    color: ColorManager
                                                        .secondary)),
                                            const Spacer(),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: ColorManager.secondary,
                                              size: AppSize.s30,
                                            ),
                                          ],
                                        ),
                                ))),

                            LabelWidget(label: "ResponsibleAuthorities".tr),
                            Obx(() => GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => SizedBox(
                                        height: SizeConfig.screenHeight! /
                                            MediaSize.m2_5,
                                        child: ListView.builder(
                                            itemCount: reportCtrl
                                                .responsibleAuthoritiesModel
                                                .length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  reportCtrl
                                                          .responsibleId.value =
                                                      reportCtrl
                                                          .responsibleAuthoritiesModel[
                                                              index]
                                                          .id!;
                                                  reportCtrl.responsibleText
                                                          .value =
                                                      reportCtrl
                                                          .responsibleAuthoritiesModel[
                                                              index]
                                                          .name!;
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          AppPadding.p60,
                                                      vertical: AppPadding.p16),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: SizeConfig
                                                            .screenHeight! /
                                                        MediaSize.m12,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                BorderRadiusValues
                                                                    .br10),
                                                        border: Border.all(
                                                            width: AppSize.s1,
                                                            color: ColorManager
                                                                .grey)),
                                                    child: Text(
                                                        reportCtrl
                                                            .responsibleAuthoritiesModel[
                                                                index]
                                                            .name!,
                                                        style: getSemiBoldStyle(
                                                            color: ColorManager
                                                                .secondary)),
                                                  ),
                                                ),
                                              );
                                            })),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10),
                                  margin: const EdgeInsets.only(
                                      right: AppMargin.m30,
                                      left: AppMargin.m30,
                                      top: AppMargin.m20),
                                  alignment: Alignment.centerRight,
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m16,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br5),
                                  ),
                                  child: reportCtrl.loading.value
                                      ? const BubbleLoader()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                                reportCtrl
                                                    .responsibleText.value,
                                                textAlign: TextAlign.center,
                                                style: getSemiBoldStyle(
                                                    color: ColorManager
                                                        .secondary)),
                                            const Spacer(),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: ColorManager.secondary,
                                              size: AppSize.s30,
                                            ),
                                          ],
                                        ),
                                ))),
                            //? divider
                            // const ReportDividerWidget(),
                            // //!Pollutant Reactivities
                            // LabelWidget(label: "Pollutant Reactivities".tr),
                            // Obx(() => GestureDetector(
                            //     onTap: () {
                            //       showModalBottomSheet(
                            //         context: context,
                            //         builder: (ctx) => SizedBox(
                            //             height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            //             child: ListView.builder(
                            //                 itemCount:
                            //                     reportCtrl.allPollutantReactivities.length,
                            //                 itemBuilder: (context, index) {
                            //                   return InkWell(
                            //                     onTap: () {
                            //                       reportCtrl.onTapSelectedReactive(
                            //                           ctx,
                            //                           reportCtrl
                            //                               .allPollutantReactivities[index]
                            //                               .id,
                            //                           reportCtrl
                            //                               .allPollutantReactivities[index]
                            //                               .name);
                            //                     },
                            //                     child: Padding(
                            //                       padding: const EdgeInsets.symmetric(
                            //                           horizontal: AppPadding.p60,
                            //                           vertical: AppPadding.p16),
                            //                       child: Container(
                            //                         alignment: Alignment.center,
                            //                         height: SizeConfig.screenHeight! /
                            //                             MediaSize.m12,
                            //                         decoration: BoxDecoration(
                            //                             borderRadius: BorderRadius.circular(
                            //                                 BorderRadiusValues.br10),
                            //                             border: Border.all(
                            //                                 width: AppSize.s1,
                            //                                 color: ColorManager.grey)),
                            //                         child: Text(
                            //                             reportCtrl
                            //                                 .allPollutantReactivities[index]
                            //                                 .name,
                            //                             style: getSemiBoldStyle(
                            //                                 color: ColorManager.secondary)),
                            //                       ),
                            //                     ),
                            //                   );
                            //                 })),
                            //       );
                            //     },
                            //     child: Container(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: AppPadding.p10),
                            //       margin: const EdgeInsets.only(
                            //           right: AppMargin.m30,
                            //           left: AppMargin.m30,
                            //           top: AppMargin.m20),
                            //       alignment: Alignment.centerRight,
                            //       height: SizeConfig.screenHeight! / MediaSize.m16,
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //             width: AppSize.s1, color: ColorManager.grey),
                            //         borderRadius:
                            //             BorderRadius.circular(BorderRadiusValues.br5),
                            //       ),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //         children: [
                            //           Text(reportCtrl.pollutantReactivitiesText.value,
                            //               textAlign: TextAlign.center,
                            //               style: getSemiBoldStyle(
                            //                   color: ColorManager.secondary)),
                            //           const Spacer(),
                            //           Icon(
                            //             Icons.arrow_drop_down,
                            //             color: ColorManager.secondary,
                            //             size: AppSize.s30,
                            //           ),
                            //         ],
                            //       ),
                            //     ))),
                            //? divider
                            const ReportDividerWidget(),
                            //!Surface Water
                            LabelWidget(label: "Surface Water".tr),
                            Obx(() => GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => SizedBox(
                                        height: SizeConfig.screenHeight! /
                                            MediaSize.m2_5,
                                        child: ListView.builder(
                                            itemCount: reportCtrl
                                                .allSurfaceWater.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  reportCtrl
                                                      .onTapSelectedSurface(
                                                          ctx,
                                                          reportCtrl
                                                              .allSurfaceWater[
                                                                  index]
                                                              .id,
                                                          reportCtrl
                                                              .allSurfaceWater[
                                                                  index]
                                                              .name);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          AppPadding.p60,
                                                      vertical: AppPadding.p16),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: SizeConfig
                                                            .screenHeight! /
                                                        MediaSize.m12,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                BorderRadiusValues
                                                                    .br10),
                                                        border: Border.all(
                                                            width: AppSize.s1,
                                                            color: ColorManager
                                                                .grey)),
                                                    child: Text(
                                                        reportCtrl
                                                            .allSurfaceWater[
                                                                index]
                                                            .name,
                                                        style: getSemiBoldStyle(
                                                            color: ColorManager
                                                                .secondary)),
                                                  ),
                                                ),
                                              );
                                            })),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10),
                                  margin: const EdgeInsets.only(
                                      right: AppMargin.m30,
                                      left: AppMargin.m30,
                                      top: AppMargin.m20),
                                  alignment: Alignment.centerRight,
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m16,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(reportCtrl.surfaceWaterText.value,
                                          textAlign: TextAlign.center,
                                          style: getSemiBoldStyle(
                                              color: ColorManager.secondary)),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: ColorManager.secondary,
                                        size: AppSize.s30,
                                      ),
                                    ],
                                  ),
                                ))),
                            const ReportDividerWidget(),
                            //!Pollutant Place
                            LabelWidget(label: "Pollutant Places".tr),
                            Obx(() => GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => SizedBox(
                                        height: SizeConfig.screenHeight! /
                                            MediaSize.m2_5,
                                        child: ListView.builder(
                                            itemCount: reportCtrl
                                                .allPollutantPlace.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  reportCtrl.onTapSelectedPlace(
                                                      ctx,
                                                      reportCtrl
                                                          .allPollutantPlace[
                                                              index]
                                                          .id,
                                                      reportCtrl
                                                          .allPollutantPlace[
                                                              index]
                                                          .name);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          AppPadding.p60,
                                                      vertical: AppPadding.p16),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: SizeConfig
                                                            .screenHeight! /
                                                        MediaSize.m12,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                BorderRadiusValues
                                                                    .br10),
                                                        border: Border.all(
                                                            width: AppSize.s1,
                                                            color: ColorManager
                                                                .grey)),
                                                    child: Text(
                                                        reportCtrl
                                                            .allPollutantPlace[
                                                                index]
                                                            .name,
                                                        style: getSemiBoldStyle(
                                                            color: ColorManager
                                                                .secondary)),
                                                  ),
                                                ),
                                              );
                                            })),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10),
                                  margin: const EdgeInsets.only(
                                      right: AppMargin.m30,
                                      left: AppMargin.m30,
                                      top: AppMargin.m20),
                                  alignment: Alignment.centerRight,
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m16,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(reportCtrl.pollutantPlaceText.value,
                                          textAlign: TextAlign.center,
                                          style: getSemiBoldStyle(
                                              color: ColorManager.secondary)),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: ColorManager.secondary,
                                        size: AppSize.s30,
                                      ),
                                    ],
                                  ),
                                ))),
                            //? divider

                            const ReportDividerWidget(),
                            LabelWidget(label: "connotations of pollution".tr),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: MultiSelectDialogField(
                                listType: MultiSelectListType.LIST,
                                chipDisplay: MultiSelectChipDisplay(
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  chipColor: ColorManager.primary,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                buttonIcon: const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.grey,
                                ),
                                buttonText: Text(
                                  'اختيار دلالات التلوث'.tr,
                                  style: TextStyle(
                                    color: ColorManager.secondary,
                                    fontSize: 16,
                                  ),
                                ),
                                items: reportCtrl.semanticPollution
                                    .map((player) =>
                                        MultiSelectItem<CitiesModel>(
                                            player, player.name))
                                    .toList(),
                                selectedColor: Colors.blue,
                                searchable: true,
                                onConfirm: (results) {
                                  reportCtrl.selectedPlayer = results;
                                  reportCtrl.selectedPlayerValue.value = "";
                                  reportCtrl.selectedPlayer.forEach((element) {
                                    reportCtrl.listOfsemanticPollution
                                        .add(element.id);
                                    print(element.id);
                                    reportCtrl.selectedPlayerValue.value =
                                        "${reportCtrl.selectedPlayerValue.value} " +
                                            element.name;
                                  });
                                },
                              ),
                            ),
                            // GestureDetector(
                            //     onTap: () {
                            //       showModalBottomSheet(
                            //         context: context,
                            //         builder: (ctx) => SizedBox(
                            //             height: SizeConfig.screenHeight! /
                            //                 MediaSize.m2_5,
                            //             child: ListView.builder(
                            //                 itemCount: reportCtrl
                            //                     .semanticPollution.length,
                            //                 itemBuilder: (context, index) {
                            //                   return InkWell(
                            //                     onTap: () {
                            //                       reportCtrl
                            //                               .semanticPollutionText
                            //                               .value =
                            //                           reportCtrl
                            //                               .semanticPollution[
                            //                                   index]
                            //                               .name;
                            //                       reportCtrl.semanticPollutionId
                            //                               .value =
                            //                           reportCtrl
                            //                               .semanticPollution[
                            //                                   index]
                            //                               .id;
                            //                     },
                            //                     child: Padding(
                            //                       padding: const EdgeInsets
                            //                               .symmetric(
                            //                           horizontal:
                            //                               AppPadding.p60,
                            //                           vertical: AppPadding.p16),
                            //                       child: Container(
                            //                         alignment: Alignment.center,
                            //                         height: SizeConfig
                            //                                 .screenHeight! /
                            //                             MediaSize.m12,
                            //                         decoration: BoxDecoration(
                            //                             borderRadius:
                            //                                 BorderRadius.circular(
                            //                                     BorderRadiusValues
                            //                                         .br10),
                            //                             border: Border.all(
                            //                                 width: AppSize.s1,
                            //                                 color: ColorManager
                            //                                     .grey)),
                            //                         child: Row(
                            //                           children: [
                            //                             Obx(() => Checkbox(
                            //                                 activeColor:
                            //                                     ColorManager
                            //                                         .primary,
                            //                                 value: reportCtrl
                            //                                         .semanticPollutionList[
                            //                                     index],
                            //                                 onChanged: (v) {
                            //                                   reportCtrl
                            //                                           .semanticPollutionList[
                            //                                       index] = v;
                            //                                   reportCtrl
                            //                                           .semanticPollutionId
                            //                                           .value =
                            //                                       reportCtrl
                            //                                           .semanticPollution[
                            //                                               index]
                            //                                           .id;
                            //                                   reportCtrl.addsemanticPollutionList(
                            //                                       index,
                            //                                       reportCtrl
                            //                                           .semanticPollution[
                            //                                               index]
                            //                                           .id,
                            //                                       reportCtrl
                            //                                           .semanticPollution[
                            //                                               index]
                            //                                           .name);
                            //                                   print(v);
                            //                                 })),
                            //                             Flexible(
                            //                               child: Text(
                            //                                   reportCtrl
                            //                                       .semanticPollution[
                            //                                           index]
                            //                                       .name,
                            //                                   style: getSemiBoldStyle(
                            //                                       color: ColorManager
                            //                                           .secondary)),
                            //                             ),
                            //                             Spacer(),
                            //                             GestureDetector(
                            //                               onTap: () {
                            //                                 Navigator.pop(
                            //                                     context);
                            //                               },
                            //                               child: Container(
                            //                                   width: 25,
                            //                                   height: 25,
                            //                                   color:
                            //                                       ColorManager
                            //                                           .primary,
                            //                                   child: Icon(
                            //                                     Icons.add,
                            //                                     color: Colors
                            //                                         .white,
                            //                                   )),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   );
                            //                 })),
                            //       );
                            //     },
                            //     child: Container(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: AppPadding.p10),
                            //       margin: const EdgeInsets.only(
                            //           right: AppMargin.m30,
                            //           left: AppMargin.m30,
                            //           top: AppMargin.m20),
                            //       alignment: Alignment.centerRight,
                            //       height:
                            //           SizeConfig.screenHeight! / MediaSize.m16,
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //             width: AppSize.s1,
                            //             color: ColorManager.grey),
                            //         borderRadius: BorderRadius.circular(
                            //             BorderRadiusValues.br5),
                            //       ),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceAround,
                            //         children: [
                            //           Obx(() => reportCtrl
                            //                   .semanticPollutionText.isEmpty
                            //               ? BubbleLoader()
                            //               : Text(
                            //                   reportCtrl
                            //                       .semanticPollutionText.value,
                            //                   textAlign: TextAlign.center,
                            //                   style: getSemiBoldStyle(
                            //                       color:
                            //                           ColorManager.secondary))),
                            //           const Spacer(),
                            //           Icon(
                            //             Icons.arrow_drop_down,
                            //             color: ColorManager.secondary,
                            //             size: AppSize.s30,
                            //           ),
                            //         ],
                            //       ),
                            //     )),
                            Obx(() => reportCtrl.pollution.isNotEmpty
                                ? SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount: reportCtrl.pollution.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          width: 250,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorManager.secondary
                                                  .withOpacity(
                                                      OpicityValue.o3)),
                                          child: Center(
                                            child: Text(
                                                reportCtrl.pollution[index],
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                            const ReportDividerWidget(),
                            LabelWidget(
                                label: "medium that has been contaminated".tr),
                            GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (ctx) => SizedBox(
                                            height: SizeConfig.screenHeight! /
                                                MediaSize.m2_5,
                                            child: Obx(() =>
                                                reportCtrl.surroundedMediums
                                                        .isEmpty
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )
                                                    : ListView.builder(
                                                        itemCount: reportCtrl
                                                            .surroundedMediums
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              reportCtrl
                                                                      .surroundedMediumsText
                                                                      .value =
                                                                  reportCtrl
                                                                      .surroundedMediums[
                                                                          index]
                                                                      .name;
                                                              reportCtrl
                                                                      .surroundedMediumsId
                                                                      .value =
                                                                  reportCtrl
                                                                      .surroundedMediums[
                                                                          index]
                                                                      .id;
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      AppPadding
                                                                          .p60,
                                                                  vertical:
                                                                      AppPadding
                                                                          .p16),
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height: SizeConfig
                                                                        .screenHeight! /
                                                                    MediaSize
                                                                        .m12,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(BorderRadiusValues
                                                                            .br10),
                                                                    border: Border.all(
                                                                        width: AppSize
                                                                            .s1,
                                                                        color: ColorManager
                                                                            .grey)),
                                                                child: Row(
                                                                  children: [
                                                                    Obx(() => Checkbox(
                                                                        activeColor: ColorManager.primary,
                                                                        value: reportCtrl.surroundedMediumsList[index],
                                                                        onChanged: (v) {
                                                                          reportCtrl.surroundedMediumsList[index] =
                                                                              v;
                                                                          reportCtrl
                                                                              .surroundedMediumsId
                                                                              .value = reportCtrl.surroundedMediums[index].id;
                                                                          reportCtrl.addsurroundedMediumsList(
                                                                              index,
                                                                              reportCtrl.surroundedMediums[index].id,
                                                                              reportCtrl.surroundedMediums[index].name);
                                                                          if (reportCtrl.surroundedMediums[index].name ==
                                                                              "مياه") {
                                                                            reportCtrl.water.value =
                                                                                reportCtrl.surroundedMediumsList[index];
                                                                          } else if (reportCtrl.surroundedMediums[index].name ==
                                                                              "تربه") {
                                                                            reportCtrl.earth.value =
                                                                                reportCtrl.surroundedMediumsList[index];
                                                                          } else if (reportCtrl.surroundedMediums[index].name ==
                                                                              "هواء") {
                                                                            reportCtrl.air.value =
                                                                                reportCtrl.surroundedMediumsList[index];
                                                                          }

                                                                          print(
                                                                              v);
                                                                        })),
                                                                    Flexible(
                                                                      child: Text(
                                                                          reportCtrl
                                                                              .surroundedMediums[
                                                                                  index]
                                                                              .name,
                                                                          style:
                                                                              getSemiBoldStyle(color: ColorManager.secondary)),
                                                                    ),
                                                                    Spacer(),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          width: 25,
                                                                          height: 25,
                                                                          color: ColorManager.primary,
                                                                          child: Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                Colors.white,
                                                                          )),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        })),
                                          ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10),
                                  margin: const EdgeInsets.only(
                                      right: AppMargin.m30,
                                      left: AppMargin.m30,
                                      top: AppMargin.m20),
                                  alignment: Alignment.centerRight,
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m16,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Obx(() => Text(
                                          reportCtrl
                                              .surroundedMediumsText.value,
                                          textAlign: TextAlign.center,
                                          style: getSemiBoldStyle(
                                              color: ColorManager.secondary))),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: ColorManager.secondary,
                                        size: AppSize.s30,
                                      ),
                                    ],
                                  ),
                                )),
                            Obx(() => reportCtrl.mediumPollution.isNotEmpty
                                ? SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount:
                                          reportCtrl.mediumPollution.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorManager.secondary
                                                  .withOpacity(
                                                      OpicityValue.o3)),
                                          child: Center(
                                            child: Text(
                                                reportCtrl
                                                    .mediumPollution[index],
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                            const ReportDividerWidget(),
                            LabelWidget(label: "The nature of the area".tr),
                            GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => SizedBox(
                                        height: SizeConfig.screenHeight! /
                                            MediaSize.m2_5,
                                        child: ListView.builder(
                                            itemCount: reportCtrl
                                                .natureOfEpicenter.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  reportCtrl
                                                          .natureOfEpicenterText
                                                          .value =
                                                      reportCtrl
                                                          .natureOfEpicenter[
                                                              index]
                                                          .name;
                                                  reportCtrl.natureOfEpicenterId
                                                          .value =
                                                      reportCtrl
                                                          .natureOfEpicenter[
                                                              index]
                                                          .id;
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          AppPadding.p60,
                                                      vertical: AppPadding.p16),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: SizeConfig
                                                            .screenHeight! /
                                                        MediaSize.m12,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                BorderRadiusValues
                                                                    .br10),
                                                        border: Border.all(
                                                            width: AppSize.s1,
                                                            color: ColorManager
                                                                .grey)),
                                                    child: Text(
                                                        reportCtrl
                                                            .natureOfEpicenter[
                                                                index]
                                                            .name,
                                                        style: getSemiBoldStyle(
                                                            color: ColorManager
                                                                .secondary)),
                                                  ),
                                                ),
                                              );
                                            })),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10),
                                  margin: const EdgeInsets.only(
                                      right: AppMargin.m30,
                                      left: AppMargin.m30,
                                      top: AppMargin.m20),
                                  alignment: Alignment.centerRight,
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m16,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Obx(() => reportCtrl
                                              .natureOfEpicenterText.isEmpty
                                          ? const BubbleLoader()
                                          : Text(
                                              reportCtrl
                                                  .natureOfEpicenterText.value,
                                              textAlign: TextAlign.center,
                                              style: getSemiBoldStyle(
                                                  color:
                                                      ColorManager.secondary))),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: ColorManager.secondary,
                                        size: AppSize.s30,
                                      ),
                                    ],
                                  ),
                                )),
                            // const ReportDividerWidget(),
                            // //!Weather
                            //
                            // LabelWidget(label: "Weather".tr),
                            // Obx(() => GestureDetector(
                            //     onTap: () {
                            //       showModalBottomSheet(
                            //         context: context,
                            //         builder: (ctx) => SizedBox(
                            //             height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            //             child: ListView.builder(
                            //                 itemCount: reportCtrl.allWeather.length,
                            //                 itemBuilder: (context, index) {
                            //                   return InkWell(
                            //                     onTap: () {
                            //                       reportCtrl.onTapSelectedWeather(
                            //                           ctx,
                            //                           reportCtrl.allWeather[index].id,
                            //                           reportCtrl.allWeather[index].name);
                            //                     },
                            //                     child: Padding(
                            //                       padding: const EdgeInsets.symmetric(
                            //                           horizontal: AppPadding.p60,
                            //                           vertical: AppPadding.p16),
                            //                       child: Container(
                            //                         alignment: Alignment.center,
                            //                         height: SizeConfig.screenHeight! /
                            //                             MediaSize.m12,
                            //                         decoration: BoxDecoration(
                            //                             borderRadius: BorderRadius.circular(
                            //                                 BorderRadiusValues.br10),
                            //                             border: Border.all(
                            //                                 width: AppSize.s1,
                            //                                 color: ColorManager.grey)),
                            //                         child: Text(
                            //                             reportCtrl.allWeather[index].name,
                            //                             style: getSemiBoldStyle(
                            //                                 color: ColorManager.secondary)),
                            //                       ),
                            //                     ),
                            //                   );
                            //                 })),
                            //       );
                            //     },
                            //     child: Container(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: AppPadding.p10),
                            //       margin: const EdgeInsets.only(
                            //           right: AppMargin.m30,
                            //           left: AppMargin.m30,
                            //           top: AppMargin.m20),
                            //       alignment: Alignment.centerRight,
                            //       height: SizeConfig.screenHeight! / MediaSize.m16,
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //             width: AppSize.s1, color: ColorManager.grey),
                            //         borderRadius:
                            //             BorderRadius.circular(BorderRadiusValues.br5),
                            //       ),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //         children: [
                            //           Text(reportCtrl.weatherText.value,
                            //               textAlign: TextAlign.center,
                            //               style: getSemiBoldStyle(
                            //                   color: ColorManager.secondary)),
                            //           const Spacer(),
                            //           Icon(
                            //             Icons.arrow_drop_down,
                            //             color: ColorManager.secondary,
                            //             size: AppSize.s30,
                            //           ),
                            //         ],
                            //       ),
                            //     ))),
                            //? divider
                            const ReportDividerWidget(),
                            //!location
                            LabelWidget(label: "Location".tr),
                            Obx(() => GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => SizedBox(
                                        height: SizeConfig.screenHeight! /
                                            MediaSize.m2_5,
                                        child: ListView.builder(
                                            itemCount:
                                                reportCtrl.allregion.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  reportCtrl.regionId.value =
                                                      reportCtrl
                                                          .allregion[index].id;
                                                  reportCtrl.regionText.value =
                                                      reportCtrl
                                                          .allregion[index]
                                                          .name;
                                                  reportCtrl.getCities();
                                                  Navigator.pop(context);
                                                  // reportCtrl.onTapSelectedcity(
                                                  //     ctx,
                                                  //     reportCtrl.allGovernorate[index].id,
                                                  //     reportCtrl.allGovernorate[index].name);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          AppPadding.p60,
                                                      vertical: AppPadding.p16),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: SizeConfig
                                                            .screenHeight! /
                                                        MediaSize.m12,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                BorderRadiusValues
                                                                    .br10),
                                                        border: Border.all(
                                                            width: AppSize.s1,
                                                            color: ColorManager
                                                                .grey)),
                                                    child: Text(
                                                        reportCtrl
                                                            .allregion[index]
                                                            .name,
                                                        style: getSemiBoldStyle(
                                                            color: ColorManager
                                                                .secondary)),
                                                  ),
                                                ),
                                              );
                                            })),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10),
                                  margin: const EdgeInsets.only(
                                      right: AppMargin.m30,
                                      left: AppMargin.m30,
                                      top: AppMargin.m20),
                                  alignment: Alignment.centerRight,
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m16,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(reportCtrl.regionText.value,
                                          textAlign: TextAlign.center,
                                          style: getSemiBoldStyle(
                                              color: ColorManager.secondary)),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: ColorManager.secondary,
                                        size: AppSize.s30,
                                      ),
                                    ],
                                  ),
                                ))),
                            Obx(() => reportCtrl.regionId.value != 0
                                ? GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (ctx) => SizedBox(
                                            height: SizeConfig.screenHeight! /
                                                MediaSize.m2_5,
                                            child: ListView.builder(
                                                itemCount:
                                                    reportCtrl.cities.length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      reportCtrl.cityId.value =
                                                          reportCtrl
                                                              .cities[index].id;
                                                      reportCtrl
                                                              .cityText.value =
                                                          reportCtrl
                                                              .cities[index]
                                                              .name;
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal:
                                                              AppPadding.p60,
                                                          vertical:
                                                              AppPadding.p16),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: SizeConfig
                                                                .screenHeight! /
                                                            MediaSize.m12,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    BorderRadiusValues
                                                                        .br10),
                                                            border: Border.all(
                                                                width:
                                                                    AppSize.s1,
                                                                color:
                                                                    ColorManager
                                                                        .grey)),
                                                        child: Text(
                                                            reportCtrl
                                                                .cities[index]
                                                                .name,
                                                            style: getSemiBoldStyle(
                                                                color: ColorManager
                                                                    .secondary)),
                                                      ),
                                                    ),
                                                  );
                                                })),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppPadding.p10),
                                      margin: const EdgeInsets.only(
                                          right: AppMargin.m30,
                                          left: AppMargin.m30,
                                          top: AppMargin.m20),
                                      alignment: Alignment.centerRight,
                                      height: SizeConfig.screenHeight! /
                                          MediaSize.m16,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: AppSize.s1,
                                            color: ColorManager.grey),
                                        borderRadius: BorderRadius.circular(
                                            BorderRadiusValues.br5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(reportCtrl.cityText.value,
                                              textAlign: TextAlign.center,
                                              style: getSemiBoldStyle(
                                                  color:
                                                      ColorManager.secondary)),
                                          const Spacer(),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: ColorManager.secondary,
                                            size: AppSize.s30,
                                          ),
                                        ],
                                      ),
                                    ))
                                : SizedBox()),
                            const ReportDividerWidget(),
                            //!Industrial Activities
                            // Obx(() => Padding(
                            //       padding: const EdgeInsets.all(AppPadding.p20),
                            //       child: MultiSelectDialogField(
                            //         confirmText: Text(
                            //           'ok'.tr,
                            //           style: getSemiBoldStyle(
                            //               color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         cancelText: Text(
                            //           'cancel'.tr,
                            //           style: getSemiBoldStyle(
                            //               color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         items: reportCtrl.itemsindustrialActivities,
                            //         title: reportCtrl.loading.value == true
                            //             ? const BubbleLoader()
                            //             : Text("Industrial Activites".tr),
                            //         selectedColor: ColorManager.secondary,
                            //         decoration: BoxDecoration(
                            //           color: ColorManager.secondary
                            //               .withOpacity(OpicityValue.o1),
                            //           borderRadius: const BorderRadius.all(
                            //               Radius.circular(
                            //                   BorderRadiusValues.br10)),
                            //           border: Border.all(
                            //             color: ColorManager.secondary,
                            //             width: AppSize.s2,
                            //           ),
                            //         ),
                            //         buttonIcon: Icon(
                            //           Icons.list,
                            //           color: ColorManager.secondary,
                            //         ),
                            //         buttonText: Text(
                            //           "Industrial Activites".tr,
                            //           style: getSemiBoldStyle(
                            //               color: ColorManager.secondary),
                            //         ),
                            //         onConfirm: (List<IndustrialActivitiesModel>
                            //             results) {
                            //           reportCtrl
                            //               .getSelectedDataindustrialActivities(
                            //                   results);
                            //         },
                            //       ),
                            //     )),
                            Obx(() => reportCtrl.industralActivity.isNotEmpty
                                ? SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount:
                                          reportCtrl.industralActivity.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          width: 250,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorManager.secondary
                                                  .withOpacity(
                                                      OpicityValue.o3)),
                                          child: Center(
                                            child: Text(
                                                reportCtrl
                                                    .industralActivity[index],
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                            // const ReportIndustrialActivitiesWidget(),
                            //? divider
                            // const ReportDividerWidget(),
                            // //!Industrial Polluation Source
                            // Obx(() => Padding(
                            //       padding: const EdgeInsets.all(AppPadding.p20),
                            //       child: MultiSelectDialogField(
                            //         confirmText: Text(
                            //           'ok'.tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         cancelText: Text(
                            //           'cancel'.tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         items: reportCtrl.itemsIndustrialPolluationSource,
                            //         title: reportCtrl.loading.value == true
                            //             ? const BubbleLoader()
                            //             : Text("describe polluted medium".tr),
                            //         selectedColor: ColorManager.secondary,
                            //         decoration: BoxDecoration(
                            //           color: ColorManager.secondary
                            //               .withOpacity(OpicityValue.o1),
                            //           borderRadius: const BorderRadius.all(
                            //               Radius.circular(BorderRadiusValues.br10)),
                            //           border: Border.all(
                            //             color: ColorManager.secondary,
                            //             width: AppSize.s2,
                            //           ),
                            //         ),
                            //         buttonIcon: Icon(
                            //           Icons.list,
                            //           color: ColorManager.secondary,
                            //         ),
                            //         buttonText: Text(
                            //           "describe polluted medium".tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //         ),
                            //         onConfirm:
                            //             (List<IndustrialPolluationSourcesModel> results) {
                            //           reportCtrl.getSelectedDataIndustrialPolluationSource(
                            //               results);
                            //         },
                            //       ),
                            //     )),
                            // const ReportIndustrialPolluationSourceWidget(),
                            //? divider
                            const ReportDividerWidget(),
                            //!Polluation Source
                            // const ReportPolluationSourcesWidget(),
                            Obx(() => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: MultiSelectDialogField(
                                    confirmText: Text(
                                      'ok'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                      overflow: TextOverflow.fade,
                                    ),
                                    cancelText: Text(
                                      'cancel'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                      overflow: TextOverflow.fade,
                                    ),
                                    items: reportCtrl.itemsPolluationSources,
                                    title: reportCtrl.loading.value == true
                                        ? const BubbleLoader()
                                        : Text("polluted medium".tr),
                                    selectedColor: ColorManager.secondary,
                                    decoration: BoxDecoration(
                                      color: ColorManager.secondary
                                          .withOpacity(OpicityValue.o1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                              BorderRadiusValues.br10)),
                                      border: Border.all(
                                        color: ColorManager.secondary,
                                        width: AppSize.s2,
                                      ),
                                    ),
                                    buttonIcon: Icon(
                                      Icons.list,
                                      color: ColorManager.secondary,
                                    ),
                                    buttonText: Text(
                                      "polluted medium".tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                    onConfirm:
                                        (List<PolluationSourcesModel> results) {
                                      reportCtrl
                                          .getSelectedDataPolluationSources(
                                              results);
                                    },
                                  ),
                                )),
                            Obx(() => reportCtrl.medium.isNotEmpty
                                ? SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount: reportCtrl.medium.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          width: 250,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorManager.secondary
                                                  .withOpacity(
                                                      OpicityValue.o3)),
                                          child: Center(
                                            child: Text(
                                                reportCtrl.medium[index],
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                            //? divider
                            const ReportDividerWidget(),
                            //!Potential Pollutants
                            // const ReportPotentialPollutantsWidget(),
                            Obx(() => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: MultiSelectDialogField(
                                    confirmText: Text(
                                      'ok'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                      overflow: TextOverflow.fade,
                                    ),
                                    cancelText: Text(
                                      'cancel'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                      overflow: TextOverflow.fade,
                                    ),
                                    items: reportCtrl.itemsPollutants,
                                    title: reportCtrl.loading.value == true
                                        ? const BubbleLoader()
                                        : Text("Potential Pollutants".tr),
                                    selectedColor: ColorManager.secondary,
                                    decoration: BoxDecoration(
                                      color: ColorManager.secondary
                                          .withOpacity(OpicityValue.o1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                              BorderRadiusValues.br10)),
                                      border: Border.all(
                                        color: ColorManager.secondary,
                                        width: AppSize.s2,
                                      ),
                                    ),
                                    buttonIcon: Icon(
                                      Icons.list,
                                      color: ColorManager.secondary,
                                    ),
                                    buttonText: Text(
                                      "Potential Pollutants".tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                    onConfirm: (List<PotentialPollutantsModel>
                                        results) {
                                      reportCtrl
                                          .getSelectedDataPollutants(results);
                                    },
                                  ),
                                )),
                            Obx(() => reportCtrl
                                    .potentialcontaminants.isNotEmpty
                                ? SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount: reportCtrl
                                          .potentialcontaminants.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          width: 250,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ColorManager.secondary
                                                  .withOpacity(
                                                      OpicityValue.o3)),
                                          child: Center(
                                            child: Text(
                                                reportCtrl
                                                        .potentialcontaminants[
                                                    index],
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                            //? divider
                            const ReportDividerWidget(),
                            LabelWidget(label: 'Another Notes'.tr),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: TextFormField(
                                controller: controllerotherNote,
                                keyboardType: TextInputType.text,
                                cursorColor: ColorManager.secondary,
                                style: TextStyle(color: ColorManager.secondary),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: AppSize.s2,
                                          color: ColorManager.secondary),
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: AppSize.s2,
                                          color: ColorManager.secondary),
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.grey),
                                    labelStyle: TextStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.secondary)),
                                onChanged: (val) {
                                  reportCtrl
                                      .changeExtentOfPolluationDescription(val);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Please enter Description"
                                                    .tr)));
                                    return 'Please enter Description'.tr;
                                  }
                                  return null;
                                }, // enabledBorder: InputBorder.none,
                              ),
                            ),
                            const ReportDividerWidget(),
                            SizedBox(
                              height: 120,
                              child: Row(
                                children: [
                                  widget.report == null
                                      ? const SizedBox()
                                      : Obx(() => Expanded(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemCount: reportCtrl
                                                    .listOfImages.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Stack(
                                                    children: [
                                                      Container(
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            vertical:
                                                                AppMargin.m8,
                                                            horizontal:
                                                                AppMargin.m8),
                                                        width: SizeConfig
                                                                .screenWidth! /
                                                            MediaSize.m5,
                                                        height: 100,
                                                        decoration: BoxDecoration(
                                                            color: ColorManager
                                                                .black,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    BorderRadiusValues
                                                                        .br5)),
                                                        child: LoadImage(
                                                            image: Constants
                                                                    .reportImage +
                                                                reportCtrl
                                                                        .listOfImages[
                                                                    index]),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          reportCtrl.remove(
                                                              reportCtrl
                                                                      .listOfImages[
                                                                  index]);
                                                          reportCtrl
                                                              .listIgnoriedPhotos
                                                              .add(widget
                                                                  .report!
                                                                  .report!
                                                                  .reportPhotos![
                                                                      index]
                                                                  .id!);
                                                        },
                                                        child: Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorManager
                                                                      .error,
                                                              shape: BoxShape
                                                                  .circle),
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: ColorManager
                                                                .white,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                }),
                                          )),
                                  widget.report == null
                                      ? const Spacer()
                                      : const SizedBox(),
                                  InkWell(
                                    onTap: () {
                                      reportCtrl.pickImagesFormGallery();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: AppMargin.m8),
                                      width: SizeConfig.screenWidth! /
                                          MediaSize.m8,
                                      height: SizeConfig.screenWidth! /
                                          MediaSize.m8,
                                      decoration: BoxDecoration(
                                          color: ColorManager.secondary,
                                          borderRadius: BorderRadius.circular(
                                              BorderRadiusValues.br5)),
                                      child: Icon(
                                        Icons.add_photo_alternate,
                                        color: ColorManager.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //!add images and preview images
                            Obx(() => reportCtrl.imagesList.isNotEmpty
                                ? SizedBox(
                                    height: 120,
                                    width: double.infinity,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: reportCtrl.imagesList.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Stack(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: AppMargin.m8,
                                                        horizontal:
                                                            AppMargin.m8),
                                                width: SizeConfig.screenWidth! /
                                                    MediaSize.m5,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                            reportCtrl
                                                                    .imagesList[
                                                                index]),
                                                        fit: BoxFit.cover),
                                                    color: ColorManager.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            BorderRadiusValues
                                                                .br5)),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  reportCtrl.removeImages(
                                                      reportCtrl
                                                          .imagesList[index]);
                                                },
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: ColorManager.error,
                                                      shape: BoxShape.circle),
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: ColorManager.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  )
                                : SizedBox()),
                            //! Add Icon

                            //? divider

                            //!Surrounding Buildings
                            // const ReportSurroundingBuildingsWidget(),
                            // Obx(() => Padding(
                            //       padding: const EdgeInsets.all(AppPadding.p20),
                            //       child: MultiSelectDialogField(
                            //         confirmText: Text(
                            //           'ok'.tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         cancelText: Text(
                            //           'cancel'.tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         items: reportCtrl.items,
                            //         title: reportCtrl.loading.value == true
                            //             ? const BubbleLoader()
                            //             : Text("Surrounding Buildings".tr),
                            //         selectedColor: ColorManager.secondary,
                            //         decoration: BoxDecoration(
                            //           color: ColorManager.secondary
                            //               .withOpacity(OpicityValue.o1),
                            //           borderRadius: const BorderRadius.all(
                            //               Radius.circular(BorderRadiusValues.br10)),
                            //           border: Border.all(
                            //             color: ColorManager.secondary,
                            //             width: AppSize.s2,
                            //           ),
                            //         ),
                            //         buttonIcon: Icon(
                            //           Icons.list,
                            //           color: ColorManager.secondary,
                            //         ),
                            //         buttonText: Text(
                            //           "Surrounding Buildings".tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //         ),
                            //         onConfirm: (List<SurroundingBuildingsModel> results) {
                            //           reportCtrl.getSelectedData(results);
                            //         },
                            //       ),
                            //     )),

                            // LabelWidget(label: 'Surrounding Buildings'.tr),
                            // GestureDetector(
                            //     onTap: () {
                            //       showModalBottomSheet(
                            //           context: context,
                            //           builder: (ctx) => SizedBox(
                            //                 height: SizeConfig.screenHeight,
                            //                 child: Obx(() => reportCtrl
                            //                         .surroundingBuildings
                            //                         .isEmpty
                            //                     ? const Center(
                            //                         child:
                            //                             CircularProgressIndicator(),
                            //                       )
                            //                     : ListView.builder(
                            //                         itemCount: reportCtrl
                            //                             .surroundingBuildings
                            //                             .length,
                            //                         itemBuilder:
                            //                             (context, index) {
                            //                           return Padding(
                            //                             padding:
                            //                                 const EdgeInsets
                            //                                         .symmetric(
                            //                                     horizontal:
                            //                                         AppPadding
                            //                                             .p60,
                            //                                     vertical:
                            //                                         AppPadding
                            //                                             .p16),
                            //                             child: Container(
                            //                               alignment:
                            //                                   Alignment.center,
                            //                               height: SizeConfig
                            //                                       .screenHeight! /
                            //                                   MediaSize.m12,
                            //                               width:
                            //                                   double.infinity,
                            //                               decoration: BoxDecoration(
                            //                                   borderRadius:
                            //                                       BorderRadius.circular(
                            //                                           BorderRadiusValues
                            //                                               .br10),
                            //                                   border: Border.all(
                            //                                       width: AppSize
                            //                                           .s1,
                            //                                       color:
                            //                                           ColorManager
                            //                                               .grey)),
                            //                               child: Row(
                            //                                 children: [
                            //                                   Obx(() =>
                            //                                       Checkbox(
                            //                                           activeColor:
                            //                                               ColorManager
                            //                                                   .primary,
                            //                                           value: reportCtrl
                            //                                                   .surroundingBuildingsList[
                            //                                               index],
                            //                                           onChanged:
                            //                                               (v) {
                            //                                             reportCtrl
                            //                                                 .surroundingBuildingsList[index] = v;
                            //                                             reportCtrl
                            //                                                 .surroundingBuildingsId
                            //                                                 .value = reportCtrl.surroundingBuildings[index].id;
                            //
                            //                                             print(
                            //                                                 v);
                            //                                           })),
                            //                                   Expanded(
                            //                                     child: Text(
                            //                                         reportCtrl
                            //                                             .surroundingBuildings[
                            //                                                 index]
                            //                                             .name,
                            //                                         style: getSemiBoldStyle(
                            //                                             color: ColorManager
                            //                                                 .secondary)),
                            //                                   ),
                            //                                   Obx(() => reportCtrl
                            //                                                   .surroundingBuildingsList[
                            //                                               index] ==
                            //                                           true
                            //                                       ? Text(
                            //                                           "Distance"
                            //                                               .tr)
                            //                                       : const SizedBox()),
                            //                                   SizedBox(
                            //                                       width: 5),
                            //                                   Obx(() => reportCtrl
                            //                                                   .surroundingBuildingsList[
                            //                                               index] ==
                            //                                           true
                            //                                       ? Expanded(
                            //                                           flex: 2,
                            //                                           child:
                            //                                               SizedBox(
                            //                                             height:
                            //                                                 40,
                            //                                             child:
                            //                                                 TextFormField(
                            //                                               initialValue:
                            //                                                   "0.0",
                            //                                               onFieldSubmitted:
                            //                                                   (v) {
                            //                                                 reportCtrl.addsurroundingBuildingsList(
                            //                                                     index,
                            //                                                     reportCtrl.surroundingBuildingsId.value = reportCtrl.surroundingBuildings[index].id,
                            //                                                     double.parse(v),
                            //                                                     reportCtrl.surroundingBuildings[index].name);
                            //                                                 print(reportCtrl.listDistance.length);
                            //                                                 reportCtrl.listDistance.forEach((element) {
                            //                                                   print(element.toJson());
                            //                                                 });
                            //                                                 reportCtrl.surroundingBuildingsList[index] =
                            //                                                     !reportCtrl.surroundingBuildingsList[index];
                            //                                                 Navigator.pop(context);
                            //                                               },
                            //                                               textAlignVertical:
                            //                                                   TextAlignVertical.center,
                            //                                               textAlign:
                            //                                                   TextAlign.right,
                            //                                               maxLines:
                            //                                                   1,
                            //                                               keyboardType:
                            //                                                   TextInputType.number,
                            //                                               decoration:
                            //                                                   const InputDecoration(
                            //                                                 enabledBorder:
                            //                                                     OutlineInputBorder(
                            //                                                   borderRadius: BorderRadius.all(
                            //                                                     Radius.circular(5.0),
                            //                                                   ),
                            //                                                 ),
                            //                                                 focusedBorder:
                            //                                                     OutlineInputBorder(
                            //                                                   borderRadius: BorderRadius.all(
                            //                                                     Radius.circular(5.0),
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             ),
                            //                                           ),
                            //                                         )
                            //                                       : SizedBox()),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                           );
                            //                         })),
                            //               ));
                            //     },
                            //     child: Container(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: AppPadding.p10),
                            //       margin: const EdgeInsets.only(
                            //           right: AppMargin.m30,
                            //           left: AppMargin.m30,
                            //           top: AppMargin.m20),
                            //       alignment: Alignment.centerRight,
                            //       height:
                            //           SizeConfig.screenHeight! / MediaSize.m16,
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //             width: AppSize.s1,
                            //             color: ColorManager.grey),
                            //         borderRadius: BorderRadius.circular(
                            //             BorderRadiusValues.br5),
                            //       ),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceAround,
                            //         children: [
                            //           Text(
                            //               reportCtrl
                            //                   .surroundingBuildingsText.value,
                            //               textAlign: TextAlign.center,
                            //               style: getSemiBoldStyle(
                            //                   color: ColorManager.secondary)),
                            //           const Spacer(),
                            //           Icon(
                            //             Icons.arrow_drop_down,
                            //             color: ColorManager.secondary,
                            //             size: AppSize.s30,
                            //           ),
                            //         ],
                            //       ),
                            //     )),
                            // Obx(() => reportCtrl.distanceOfList.isNotEmpty
                            //     ? SizedBox(
                            //         height: 50,
                            //         child: ListView.builder(
                            //           itemCount:
                            //               reportCtrl.distanceOfList.length,
                            //           physics: const BouncingScrollPhysics(),
                            //           shrinkWrap: true,
                            //           scrollDirection: Axis.horizontal,
                            //           itemBuilder: (_, index) => Padding(
                            //             padding: const EdgeInsets.all(8),
                            //             child: Stack(
                            //               alignment: Alignment.topLeft,
                            //               children: [
                            //                 Container(
                            //                   width: 250,
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(10),
                            //                       color: ColorManager.secondary
                            //                           .withOpacity(
                            //                               OpicityValue.o3)),
                            //                   child: Center(
                            //                     child: Text(
                            //                         "${reportCtrl.distanceOfList[index].surroundingBuilding!.name!}:  ${reportCtrl.distanceOfList[index].distance!}${"M".tr}",
                            //                         overflow:
                            //                             TextOverflow.ellipsis),
                            //                   ),
                            //                 ),
                            //                 GestureDetector(
                            //                   onTap: () {
                            //                     reportCtrl.removeDiatance(
                            //                         reportCtrl
                            //                             .distanceOfList[index]
                            //                             .surroundingBuildingId!);
                            //                   },
                            //                   child: Container(
                            //                     height: 25,
                            //                     width: 25,
                            //                     decoration: BoxDecoration(
                            //                         shape: BoxShape.circle,
                            //                         color: Colors.red),
                            //                     child: Icon(Icons.clear,
                            //                         color: Colors.white),
                            //                   ),
                            //                 )
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       )
                            //     : SizedBox()),
                            LabelWidget(label: 'Industrial activity'.tr),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (ctx) => SizedBox(
                                                    height:
                                                        SizeConfig.screenHeight,
                                                    child: Obx(() => reportCtrl
                                                            .allIndustrialActivities
                                                            .isEmpty
                                                        ? const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          )
                                                        : ListView.builder(
                                                            itemCount: reportCtrl
                                                                .allIndustrialActivities
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        AppPadding
                                                                            .p60,
                                                                    vertical:
                                                                        AppPadding
                                                                            .p16),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    reportCtrl
                                                                            .allIndustrialActivitiesText
                                                                            .value =
                                                                        reportCtrl
                                                                            .allIndustrialActivities[index]
                                                                            .name;
                                                                    reportCtrl
                                                                            .allIndustrialActivitiesId
                                                                            .value =
                                                                        reportCtrl
                                                                            .allIndustrialActivities[index]
                                                                            .id;
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: SizeConfig
                                                                            .screenHeight! /
                                                                        MediaSize
                                                                            .m12,
                                                                    width: double
                                                                        .infinity,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(BorderRadiusValues
                                                                                .br10),
                                                                        border: Border.all(
                                                                            width:
                                                                                AppSize.s1,
                                                                            color: ColorManager.grey)),
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          reportCtrl
                                                                              .allIndustrialActivities[
                                                                                  index]
                                                                              .name,
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          style:
                                                                              getSemiBoldStyle(color: ColorManager.secondary)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            })),
                                                  ));
                                        },
                                        child: Container(
                                            width: 150,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      ColorManager.secondary),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        reportCtrl
                                                            .allIndustrialActivitiesText
                                                            .value,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1),
                                                  ),
                                                  const Icon(Icons
                                                      .arrow_drop_down_rounded)
                                                ],
                                              ),
                                            )),
                                      ),
                                      const Spacer(),
                                      Text("Distance".tr),
                                      const Spacer(),
                                      Expanded(
                                          child: SizedBox(
                                              height: 40,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (v) {
                                                  reportCtrl
                                                      .allIndustrialActivitiesDistance
                                                      .value = double.parse(v);
                                                },
                                                initialValue: "0.0",
                                                decoration:
                                                    const InputDecoration(),
                                              ))),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Container(
                                              clipBehavior: Clip.antiAlias,
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Obx(
                                                () => reportCtrl
                                                            .imageIndustrail !=
                                                        ""
                                                    ? Image.file(
                                                        File(reportCtrl
                                                            .imageIndustrail),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : SizedBox(),
                                              )),
                                          GestureDetector(
                                            onTap: () {
                                              reportCtrl
                                                  .selectImageIndustrail();
                                            },
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      ColorManager.secondary),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Text("description".tr),
                                      SizedBox(width: 10),
                                      Expanded(
                                          child: SizedBox(
                                              height: 40,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: (v) {
                                                  reportCtrl
                                                      .allIndustrialActivitiesDescription
                                                      .value = v;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: "ادخل الوصف"),
                                              ))),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (reportCtrl.allIndustrialActivitiesId
                                              .value ==
                                          0) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'please enter Industrial Activites'
                                                        .tr)));
                                      } else if (reportCtrl.imageIndustrail ==
                                          "") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'يجب اختيار صوره'.tr)));
                                      } else {
                                        reportCtrl.addActivites(
                                            reportCtrl.allIndustrialActivitiesId
                                                .value,
                                            reportCtrl
                                                .allIndustrialActivitiesDistance
                                                .value,
                                            reportCtrl
                                                .allIndustrialActivitiesText
                                                .value,
                                            File(reportCtrl.imageIndustrail),
                                            reportCtrl
                                                .allIndustrialActivitiesDescription
                                                .value);
                                      }
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: ColorManager.primary,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(() => reportCtrl.ActvitesList.isNotEmpty
                                ? SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount: reportCtrl.ActvitesList.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Stack(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            Container(
                                              width: 250,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: ColorManager.secondary
                                                      .withOpacity(
                                                          OpicityValue.o3)),
                                              child: Center(
                                                child: Text(
                                                    "${reportCtrl.ActvitesList[index].industrialActivity!.name!}:  ${reportCtrl.ActvitesList[index].distance!}${"M".tr}",
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                reportCtrl.removeActivites(
                                                    reportCtrl
                                                        .ActvitesList[index]
                                                        .industrialActivityId!);
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.red),
                                                child: const Icon(Icons.clear,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                            //!add images and preview images
                            // Obx(() => reportCtrl.imagesList.isNotEmpty
                            //     ? SizedBox(
                            //         height: 120,
                            //         width: double.infinity,
                            //         child: ListView.builder(
                            //             shrinkWrap: true,
                            //             physics: const BouncingScrollPhysics(),
                            //             itemCount: reportCtrl.imagesList.length,
                            //             scrollDirection: Axis.horizontal,
                            //             itemBuilder: (context, index) {
                            //               return Stack(
                            //                 children: [
                            //                   Container(
                            //                     margin: const EdgeInsets.symmetric(
                            //                         vertical: AppMargin.m8,
                            //                         horizontal: AppMargin.m8),
                            //                     width:
                            //                         SizeConfig.screenWidth! / MediaSize.m5,
                            //                     height: 100,
                            //                     decoration: BoxDecoration(
                            //                         image: DecorationImage(
                            //                             image: FileImage(
                            //                                 reportCtrl.imagesList[index]),
                            //                             fit: BoxFit.cover),
                            //                         color: ColorManager.black,
                            //                         borderRadius: BorderRadius.circular(
                            //                             BorderRadiusValues.br5)),
                            //                   ),
                            //                   GestureDetector(
                            //                     onTap: () {
                            //                       reportCtrl.removeImages(
                            //                           reportCtrl.imagesList[index]);
                            //                     },
                            //                     child: Container(
                            //                       width: 25,
                            //                       height: 25,
                            //                       decoration: BoxDecoration(
                            //                           color: ColorManager.error,
                            //                           shape: BoxShape.circle),
                            //                       child: Icon(
                            //                         Icons.clear,
                            //                         color: ColorManager.white,
                            //                       ),
                            //                     ),
                            //                   )
                            //                 ],
                            //               );
                            //             }),
                            //       )
                            //     : SizedBox()),
                            //! Add Icon

                            //? divider
                            const ReportDividerWidget(),
                            //!Industrial Activities
                            // Obx(() => Padding(
                            //       padding: const EdgeInsets.all(AppPadding.p20),
                            //       child: MultiSelectDialogField(
                            //         confirmText: Text(
                            //           'ok'.tr,
                            //           style: getSemiBoldStyle(
                            //               color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         cancelText: Text(
                            //           'cancel'.tr,
                            //           style: getSemiBoldStyle(
                            //               color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         items: reportCtrl.itemsindustrialActivities,
                            //         title: reportCtrl.loading.value == true
                            //             ? const BubbleLoader()
                            //             : Text("Industrial Activites".tr),
                            //         selectedColor: ColorManager.secondary,
                            //         decoration: BoxDecoration(
                            //           color: ColorManager.secondary
                            //               .withOpacity(OpicityValue.o1),
                            //           borderRadius: const BorderRadius.all(
                            //               Radius.circular(BorderRadiusValues.br10)),
                            //           border: Border.all(
                            //             color: ColorManager.secondary,
                            //             width: AppSize.s2,
                            //           ),
                            //         ),
                            //         buttonIcon: Icon(
                            //           Icons.list,
                            //           color: ColorManager.secondary,
                            //         ),
                            //         buttonText: Text(
                            //           "Industrial Activites".tr,
                            //           style: getSemiBoldStyle(
                            //               color: ColorManager.secondary),
                            //         ),
                            //         onConfirm:
                            //             (List<IndustrialActivitiesModel> results) {
                            //           reportCtrl
                            //               .getSelectedDataindustrialActivities(
                            //                   results);
                            //         },
                            //       ),
                            //     )),
                            // const ReportIndustrialActivitiesWidget(),
                            //? divider
                            // const ReportDividerWidget(),
                            // //!Industrial Polluation Source
                            // Obx(() => Padding(
                            //       padding: const EdgeInsets.all(AppPadding.p20),
                            //       child: MultiSelectDialogField(
                            //         confirmText: Text(
                            //           'ok'.tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         cancelText: Text(
                            //           'cancel'.tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         items: reportCtrl.itemsIndustrialPolluationSource,
                            //         title: reportCtrl.loading.value == true
                            //             ? const BubbleLoader()
                            //             : Text("describe polluted medium".tr),
                            //         selectedColor: ColorManager.secondary,
                            //         decoration: BoxDecoration(
                            //           color: ColorManager.secondary
                            //               .withOpacity(OpicityValue.o1),
                            //           borderRadius: const BorderRadius.all(
                            //               Radius.circular(BorderRadiusValues.br10)),
                            //           border: Border.all(
                            //             color: ColorManager.secondary,
                            //             width: AppSize.s2,
                            //           ),
                            //         ),
                            //         buttonIcon: Icon(
                            //           Icons.list,
                            //           color: ColorManager.secondary,
                            //         ),
                            //         buttonText: Text(
                            //           "describe polluted medium".tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //         ),
                            //         onConfirm:
                            //             (List<IndustrialPolluationSourcesModel> results) {
                            //           reportCtrl.getSelectedDataIndustrialPolluationSource(
                            //               results);
                            //         },
                            //       ),
                            //     )),
                            // const ReportIndustrialPolluationSourceWidget(),
                            //? divider

                            //!Potential Pollutants
                            // const ReportPotentialPollutantsWidget(),

                            //!Surrounding Buildings
                            // const ReportSurroundingBuildingsWidget(),
                            // Obx(() => Padding(
                            //       padding: const EdgeInsets.all(AppPadding.p20),
                            //       child: MultiSelectDialogField(
                            //         confirmText: Text(
                            //           'ok'.tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         cancelText: Text(
                            //           'cancel'.tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //           overflow: TextOverflow.fade,
                            //         ),
                            //         items: reportCtrl.items,
                            //         title: reportCtrl.loading.value == true
                            //             ? const BubbleLoader()
                            //             : Text("Surrounding Buildings".tr),
                            //         selectedColor: ColorManager.secondary,
                            //         decoration: BoxDecoration(
                            //           color: ColorManager.secondary
                            //               .withOpacity(OpicityValue.o1),
                            //           borderRadius: const BorderRadius.all(
                            //               Radius.circular(BorderRadiusValues.br10)),
                            //           border: Border.all(
                            //             color: ColorManager.secondary,
                            //             width: AppSize.s2,
                            //           ),
                            //         ),
                            //         buttonIcon: Icon(
                            //           Icons.list,
                            //           color: ColorManager.secondary,
                            //         ),
                            //         buttonText: Text(
                            //           "Surrounding Buildings".tr,
                            //           style:
                            //               getSemiBoldStyle(color: ColorManager.secondary),
                            //         ),
                            //         onConfirm: (List<SurroundingBuildingsModel> results) {
                            //           reportCtrl.getSelectedData(results);
                            //         },
                            //       ),
                            //     )),

                            LabelWidget(label: 'Surrounding Buildings'.tr),
                            // GestureDetector(
                            //     onTap: () {
                            //       showModalBottomSheet(
                            //           context: context,
                            //           builder: (ctx) => SizedBox(
                            //                 height: SizeConfig.screenHeight,
                            //                 child: Obx(() =>
                            //                     reportCtrl.surroundingBuildings
                            //                             .isEmpty
                            //                         ? const Center(
                            //                             child:
                            //                                 CircularProgressIndicator(),
                            //                           )
                            //                         : ListView.builder(
                            //                             itemCount: reportCtrl
                            //                                 .surroundingBuildings
                            //                                 .length,
                            //                             itemBuilder:
                            //                                 (context, index) {
                            //                               return Padding(
                            //                                 padding:
                            //                                     const EdgeInsets
                            //                                             .symmetric(
                            //                                         horizontal:
                            //                                             AppPadding
                            //                                                 .p60,
                            //                                         vertical:
                            //                                             AppPadding
                            //                                                 .p16),
                            //                                 child: Container(
                            //                                   alignment:
                            //                                       Alignment.center,
                            //                                   height: SizeConfig
                            //                                           .screenHeight! /
                            //                                       MediaSize.m12,
                            //                                   width:
                            //                                       double.infinity,
                            //                                   decoration: BoxDecoration(
                            //                                       borderRadius:
                            //                                           BorderRadius.circular(
                            //                                               BorderRadiusValues
                            //                                                   .br10),
                            //                                       border: Border.all(
                            //                                           width: AppSize
                            //                                               .s1,
                            //                                           color:
                            //                                               ColorManager
                            //                                                   .grey)),
                            //                                   child: Row(
                            //                                     children: [
                            //                                       Obx(() =>
                            //                                           Checkbox(
                            //                                               activeColor:
                            //                                                   ColorManager
                            //                                                       .primary,
                            //                                               value: reportCtrl
                            //                                                       .surroundingBuildingsList[
                            //                                                   index],
                            //                                               onChanged:
                            //                                                   (v) {
                            //                                                 reportCtrl
                            //                                                     .surroundingBuildingsList[index] = v;
                            //                                                 reportCtrl
                            //                                                     .surroundingBuildingsId
                            //                                                     .value = reportCtrl.surroundingBuildings[index].id;
                            //
                            //                                                 print(
                            //                                                     v);
                            //                                               })),
                            //                                       Expanded(
                            //                                         child: Text(
                            //                                             reportCtrl
                            //                                                 .surroundingBuildings[
                            //                                                     index]
                            //                                                 .name,
                            //                                             style: getSemiBoldStyle(
                            //                                                 color: ColorManager
                            //                                                     .secondary)),
                            //                                       ),
                            //                                       Obx(() => reportCtrl
                            //                                                       .surroundingBuildingsList[
                            //                                                   index] ==
                            //                                               true
                            //                                           ? Text(
                            //                                               "Distance"
                            //                                                   .tr)
                            //                                           : const SizedBox()),
                            //                                       SizedBox(
                            //                                           width: 5),
                            //                                       Obx(() => reportCtrl
                            //                                                       .surroundingBuildingsList[
                            //                                                   index] ==
                            //                                               true
                            //                                           ? Expanded(
                            //                                               flex: 2,
                            //                                               child:
                            //                                                   SizedBox(
                            //                                                 height:
                            //                                                     40,
                            //                                                 child:
                            //                                                     TextFormField(
                            //                                                   initialValue:
                            //                                                       "0.0",
                            //                                                   onFieldSubmitted:
                            //                                                       (v) {
                            //                                                     reportCtrl.addsurroundingBuildingsList(
                            //                                                         index,
                            //                                                         reportCtrl.surroundingBuildingsId.value = reportCtrl.surroundingBuildings[index].id,
                            //                                                         double.parse(v),
                            //                                                         reportCtrl.surroundingBuildings[index].name);
                            //                                                     print(reportCtrl.listDistance.length);
                            //                                                     reportCtrl.listDistance.forEach((element) {
                            //                                                       print(element.toJson());
                            //                                                     });
                            //                                                     reportCtrl.surroundingBuildingsList[index] =
                            //                                                         !reportCtrl.surroundingBuildingsList[index];
                            //                                                     Navigator.pop(context);
                            //                                                   },
                            //                                                   textAlignVertical:
                            //                                                       TextAlignVertical.center,
                            //                                                   textAlign:
                            //                                                       TextAlign.right,
                            //                                                   maxLines:
                            //                                                       1,
                            //                                                   keyboardType:
                            //                                                       TextInputType.number,
                            //                                                   decoration:
                            //                                                       const InputDecoration(
                            //                                                     enabledBorder:
                            //                                                         OutlineInputBorder(
                            //                                                       borderRadius: BorderRadius.all(
                            //                                                         Radius.circular(5.0),
                            //                                                       ),
                            //                                                     ),
                            //                                                     focusedBorder:
                            //                                                         OutlineInputBorder(
                            //                                                       borderRadius: BorderRadius.all(
                            //                                                         Radius.circular(5.0),
                            //                                                       ),
                            //                                                     ),
                            //                                                   ),
                            //                                                 ),
                            //                                               ),
                            //                                             )
                            //                                           : SizedBox()),
                            //                                     ],
                            //                                   ),
                            //                                 ),
                            //                               );
                            //                             })),
                            //               ));
                            //     },
                            //     child: Container(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: AppPadding.p10),
                            //       margin: const EdgeInsets.only(
                            //           right: AppMargin.m30,
                            //           left: AppMargin.m30,
                            //           top: AppMargin.m20),
                            //       alignment: Alignment.centerRight,
                            //       height: SizeConfig.screenHeight! / MediaSize.m16,
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //             width: AppSize.s1,
                            //             color: ColorManager.grey),
                            //         borderRadius: BorderRadius.circular(
                            //             BorderRadiusValues.br5),
                            //       ),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceAround,
                            //         children: [
                            //           Text(
                            //               reportCtrl.surroundingBuildingsText.value,
                            //               textAlign: TextAlign.center,
                            //               style: getSemiBoldStyle(
                            //                   color: ColorManager.secondary)),
                            //           const Spacer(),
                            //           Icon(
                            //             Icons.arrow_drop_down,
                            //             color: ColorManager.secondary,
                            //             size: AppSize.s30,
                            //           ),
                            //         ],
                            //       ),
                            //     )),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (ctx) => SizedBox(
                                                    height:
                                                        SizeConfig.screenHeight,
                                                    child: Obx(() => reportCtrl
                                                            .surroundingBuildings
                                                            .isEmpty
                                                        ? const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          )
                                                        : ListView.builder(
                                                            itemCount: reportCtrl
                                                                .surroundingBuildings
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        AppPadding
                                                                            .p60,
                                                                    vertical:
                                                                        AppPadding
                                                                            .p16),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    reportCtrl
                                                                            .surroundingBuildingsText
                                                                            .value =
                                                                        reportCtrl
                                                                            .surroundingBuildings[index]
                                                                            .name;
                                                                    reportCtrl
                                                                            .surroundingBuildingId
                                                                            .value =
                                                                        reportCtrl
                                                                            .surroundingBuildings[index]
                                                                            .id;
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: SizeConfig
                                                                            .screenHeight! /
                                                                        MediaSize
                                                                            .m12,
                                                                    width: double
                                                                        .infinity,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(BorderRadiusValues
                                                                                .br10),
                                                                        border: Border.all(
                                                                            width:
                                                                                AppSize.s1,
                                                                            color: ColorManager.grey)),
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          reportCtrl
                                                                              .surroundingBuildings[
                                                                                  index]
                                                                              .name,
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          style:
                                                                              getSemiBoldStyle(color: ColorManager.secondary)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            })),
                                                  ));
                                        },
                                        child: Container(
                                            width: 150,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      ColorManager.secondary),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(reportCtrl
                                                      .surroundingBuildingsText
                                                      .value),
                                                  const Icon(Icons
                                                      .arrow_drop_down_rounded)
                                                ],
                                              ),
                                            )),
                                      ),
                                      const Spacer(),
                                      Text("Distance".tr),
                                      const Spacer(),
                                      Expanded(
                                          child: SizedBox(
                                              height: 40,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (v) {
                                                  reportCtrl.surroundingDistance
                                                      .value = double.parse(v);
                                                },
                                                initialValue: "0.0",
                                                decoration:
                                                    const InputDecoration(),
                                              ))),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Container(
                                              clipBehavior: Clip.antiAlias,
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Obx(
                                                () => reportCtrl.images != ""
                                                    ? Image.file(
                                                        File(reportCtrl.images),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : SizedBox(),
                                              )),
                                          GestureDetector(
                                            onTap: () {
                                              reportCtrl.selectImage();
                                            },
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      ColorManager.secondary),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          if (reportCtrl.surroundingBuildingId
                                                  .value ==
                                              0) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Please Enter Surrounding Buildings '
                                                            .tr)));
                                          } else if (reportCtrl.images == "") {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'يجب اختيار صوره'.tr)));
                                          } else {
                                            reportCtrl.addBuildingsList(
                                                reportCtrl.surroundingBuildingId
                                                    .value,
                                                reportCtrl
                                                    .surroundingDistance.value,
                                                reportCtrl
                                                    .surroundingBuildingsText
                                                    .value,
                                                File(reportCtrl.images));
                                          }
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: ColorManager.primary,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: const Icon(Icons.add,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            Obx(() => reportCtrl.distanceOfList.isNotEmpty
                                ? SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount:
                                          reportCtrl.distanceOfList.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Stack(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            Container(
                                              width: 250,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: ColorManager.secondary
                                                      .withOpacity(
                                                          OpicityValue.o3)),
                                              child: Center(
                                                child: Text(
                                                    "${reportCtrl.distanceOfList[index].surroundingBuilding!.name!}:  ${reportCtrl.distanceOfList[index].distance!}${"M".tr}",
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                reportCtrl.removeDiatance(
                                                    reportCtrl
                                                        .distanceOfList[index]
                                                        .surroundingBuildingId!);
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.red),
                                                child: Icon(Icons.clear,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()),
                            const ReportDividerWidget(),

                            LabelWidget(label: "Volume".tr),

                            const ReportDividerWidget(),
                            const ReportDividerWidget(),
                            ReportTextFieldWidget(
                                symbol: "M".tr,
                                onSaved: (val) {
                                  double x =
                                      double.parse(controllerWidth.text) *
                                          double.parse(
                                              controllerDepth.text.isEmpty
                                                  ? "1.0"
                                                  : controllerDepth.text) *
                                          double.parse(
                                              controllerHeight.text.isEmpty
                                                  ? "0.0"
                                                  : controllerHeight.text);
                                  controllerVolume.text = x.toString();
                                },
                                controller: controllerWidth,
                                title: "Width".tr,
                                type: TextInputType.number,
                                onSavedFunction: (val) {
                                  double x =
                                      double.parse(controllerWidth.text) *
                                          double.parse(
                                              controllerDepth.text.isEmpty
                                                  ? "1.0"
                                                  : controllerDepth.text) *
                                          double.parse(
                                              controllerHeight.text.isEmpty
                                                  ? "0.0"
                                                  : controllerHeight.text);
                                  controllerVolume.text = x.toString();
                                  reportCtrl.epicenterWidth.value =
                                      double.parse(val!);
                                }),
                            ReportTextFieldWidget(
                                symbol: "M".tr,
                                onSaved: (v) {
                                  double x =
                                      double.parse(controllerWidth.text) *
                                          double.parse(
                                              controllerDepth.text.isEmpty
                                                  ? "1.0"
                                                  : controllerDepth.text) *
                                          double.parse(
                                              controllerHeight.text.isEmpty
                                                  ? "0.0"
                                                  : controllerHeight.text);
                                  controllerVolume.text = x.toString();
                                },
                                controller: controllerHeight,
                                title: "Height".tr,
                                type: TextInputType.number,
                                onSavedFunction: (val) {
                                  double x =
                                      double.parse(controllerWidth.text) *
                                          double.parse(
                                              controllerDepth.text.isEmpty
                                                  ? "1.0"
                                                  : controllerDepth.text) *
                                          double.parse(
                                              controllerHeight.text.isEmpty
                                                  ? "0.0"
                                                  : controllerHeight.text);
                                  controllerVolume.text = x.toString();
                                  reportCtrl.epicenterLenght.value =
                                      double.parse(val!);
                                  print(reportCtrl.epicenterLenght);
                                }),
                            ReportTextFieldWidget(
                                symbol: "M".tr,
                                onSaved: (val) {
                                  double x =
                                      double.parse(controllerWidth.text) *
                                          double.parse(
                                              controllerDepth.text.isEmpty
                                                  ? "1.0"
                                                  : controllerDepth.text) *
                                          double.parse(
                                              controllerHeight.text.isEmpty
                                                  ? "1.0"
                                                  : controllerHeight.text);
                                  controllerVolume.text = x.toString();
                                  print(x);
                                  print("Depth");
                                },
                                controller: controllerDepth,
                                title: "Depth".tr,
                                type: TextInputType.number,
                                onSavedFunction: (val) {
                                  double x =
                                      double.parse(controllerWidth.text) *
                                          double.parse(
                                              controllerDepth.text.isEmpty
                                                  ? "1.0"
                                                  : controllerDepth.text) *
                                          double.parse(
                                              controllerHeight.text.isEmpty
                                                  ? "1.0"
                                                  : controllerHeight.text);
                                  controllerVolume.text = x.toString();
                                  reportCtrl.epicenterDepth.value =
                                      double.parse(val!);
                                }),
                            ReportTextFieldWidget(
                                symbol: "m".tr,
                                controller: controllerVolume,
                                title: "Volume".tr,
                                type: TextInputType.number,
                                onSavedFunction: (val) {
                                  reportCtrl.epicenterVolume.value =
                                      double.parse(val!);
                                }),

                            Obx(() => reportCtrl.water.value == true ||
                                    reportCtrl.earth.value == true
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      reportCtrl.water.value == true &&
                                              reportCtrl.earth.value == true
                                          ? LabelWidget(
                                              label:
                                                  "${"Water Pollution".tr} و ${"Soil contamination".tr}")
                                          : reportCtrl.water.value == true
                                              ? LabelWidget(
                                                  label: "Water Pollution".tr)
                                              : reportCtrl.earth.value == true
                                                  ? LabelWidget(
                                                      label:
                                                          "Soil contamination"
                                                              .tr)
                                                  : const SizedBox(),
                                      const ReportDividerWidget(),
                                      ReportTextFieldWidget(
                                          symbol: "PPT",
                                          intialValue: "0",
                                          controller: controllersalinity,
                                          title: "Salinity".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl.changesalinity(val);
                                          }),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          symbol: "mg/L",
                                          controller:
                                              controllertotalDissolvedSolids,
                                          title: "TotalDissolvedSolids".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl
                                                .changetotalDissolvedSolids(
                                                    val);
                                          }),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          controller: controllepH,
                                          title: "PH".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl.changepH(val);
                                          }),
                                      ReportTextFieldWidget(
                                          symbol: "μS/cm",
                                          intialValue: "0",
                                          controller:
                                              controlleelectricalConnection,
                                          title: "ElectricalConnection".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl
                                                .changeelectricalConnection(
                                                    val);
                                          }),
                                      ReportTextFieldWidget(
                                          symbol: "μg/L",
                                          intialValue: "0",
                                          controller:
                                              controllertotalOrganicCarbon,
                                          title: "TotalOrganicCarbon".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl
                                                .changetotalOrganicCarbon(val);
                                          }),

                                      //water
                                      Obx(() => reportCtrl.water.value == true
                                          ? Column(
                                              children: [
                                                ReportTextFieldWidget(
                                                    symbol: "NTU",
                                                    intialValue: "0",
                                                    controller:
                                                        controlleturbidity,
                                                    title: "Turbidity".tr,
                                                    type: TextInputType.number,
                                                    onSavedFunction: (val) {
                                                      reportCtrl
                                                          .changeturbidity(val);
                                                    }),
                                                ReportTextFieldWidget(
                                                    intialValue: "0",
                                                    symbol: "d".tr,
                                                    controller:
                                                        controllertempreture,
                                                    title: "Temperature".tr,
                                                    type: TextInputType.number,
                                                    onSavedFunction: (val) {
                                                      reportCtrl
                                                          .changetemperature(
                                                              val);
                                                    }),
                                                ReportTextFieldWidget(
                                                    symbol: "mg/L",
                                                    intialValue: "0",
                                                    controller:
                                                        controllerHardness,
                                                    title: "Hardness".tr,
                                                    type: TextInputType.number,
                                                    onSavedFunction: (val) {
                                                      reportCtrl.hardness
                                                          .value = val!;
                                                      print(reportCtrl
                                                          .hardness.value);
                                                    }),
                                                ReportTextFieldWidget(
                                                    intialValue: "0",
                                                    symbol: "mg/L",
                                                    controller:
                                                        controllerdissolvedOxygen,
                                                    title: "DissolvedOxygen".tr,
                                                    type: TextInputType.number,
                                                    onSavedFunction: (val) {
                                                      reportCtrl
                                                          .changedissolvedOxygen(
                                                              val);
                                                    }),
                                                ReportTextFieldWidget(
                                                    intialValue: "0",
                                                    symbol: "m/g".tr,
                                                    controller:
                                                        controlletotalSuspendedSolids,
                                                    title:
                                                        "TotalSuspendedSolids"
                                                            .tr,
                                                    type: TextInputType.number,
                                                    onSavedFunction: (val) {
                                                      reportCtrl
                                                          .changetotalSuspendedSolids(
                                                              val);
                                                    }),
                                              ],
                                            )
                                          : SizedBox()),

                                      //air
                                    ],
                                  )
                                : SizedBox()),
                            Obx(() => reportCtrl.air.value == true
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelWidget(label: "air pollution".tr),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          symbol: "o".tr,
                                          controller: controllerozone,
                                          title: "Ozone".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl.changeozone(val);
                                          }),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          symbol: "o".tr,
                                          controller: controllernitrogenDioxide,
                                          title: "NitrogenDioxide".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl
                                                .changenitrogenDioxide(val);
                                          }),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          symbol: "o".tr,
                                          controller: controllersulfurDioxide,
                                          title: "SulfurDioxide".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl.changesulfurDioxide(val);
                                          }),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          controller: controllerFirstCarpone,
                                          title: "FirstCarpone".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl.FirstCarpone.value =
                                                val!;
                                            print(
                                                reportCtrl.FirstCarpone.value);
                                          }),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          controller: controllerSecoundCarpone,
                                          title: "SecoundCarpone".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl.SecoundCarpone.value =
                                                val!;
                                          }),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          symbol: "o".tr,
                                          controller: controllerpM25,
                                          title: "PM 25".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl.changepM25(val);
                                          }),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          symbol: "o".tr,
                                          controller: controllerpM10,
                                          title: "PM 10".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl.changepM10(val);
                                          }),
                                      ReportTextFieldWidget(
                                          intialValue: "0",
                                          symbol: "o".tr,
                                          controller:
                                              controllervolatileOrganicMatter,
                                          title: "VolatileOrganicMatter".tr,
                                          type: TextInputType.number,
                                          onSavedFunction: (val) {
                                            reportCtrl
                                                .changevolatileOrganicMatter(
                                                    val);
                                          }),
                                    ],
                                  )
                                : SizedBox()),

                            // ReportTextFieldWidget(
                            //     controller: controllerHardness,
                            //     title: "Hardness".tr,
                            //     type: TextInputType.number,
                            //     onSavedFunction: (val) {
                            //       reportCtrl.hardness.value = double.parse(val!);
                            //       print(reportCtrl.hardness.value);
                            //     }),
                            // ReportTextFieldWidget(
                            //     controller: controllerAcidity,
                            //     title: "Acidity".tr,
                            //     type: TextInputType.number,
                            //     onSavedFunction: (val) {
                            //       reportCtrl.acidity.value = double.parse(val!);
                            //       print(reportCtrl.acidity.value);
                            //     }),
                            // ReportTextFieldWidget(
                            //     controller: controllerallKindsOfCarbon,
                            //     title: "AllKindsOfCarbon".tr,
                            //     type: TextInputType.number,
                            //     onSavedFunction: (val) {
                            //       reportCtrl.changeallKindsOfCarbon(val);
                            //     }),
                            LabelWidget(
                                label:
                                    "air condition at the time of measurement"
                                        .tr),
                            const ReportDividerWidget(),
                            LabelWidget(label: "Wind direction".tr),
                            Obx(() => GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => SizedBox(
                                        height: SizeConfig.screenHeight! /
                                            MediaSize.m2_5,
                                        child: ListView.builder(
                                            itemCount: reportCtrl
                                                .getAllWindDirection.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  reportCtrl
                                                          .getAllWindDirectionText
                                                          .value =
                                                      reportCtrl
                                                          .getAllWindDirection[
                                                              index]
                                                          .name;
                                                  reportCtrl
                                                          .getAllWindDirectionId
                                                          .value =
                                                      reportCtrl
                                                          .getAllWindDirection[
                                                              index]
                                                          .id;
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          AppPadding.p60,
                                                      vertical: AppPadding.p16),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: SizeConfig
                                                            .screenHeight! /
                                                        MediaSize.m12,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                BorderRadiusValues
                                                                    .br10),
                                                        border: Border.all(
                                                            width: AppSize.s1,
                                                            color: ColorManager
                                                                .grey)),
                                                    child: Text(
                                                        reportCtrl
                                                            .getAllWindDirection[
                                                                index]
                                                            .name,
                                                        style: getSemiBoldStyle(
                                                            color: ColorManager
                                                                .secondary)),
                                                  ),
                                                ),
                                              );
                                            })),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10),
                                  margin: const EdgeInsets.only(
                                      right: AppMargin.m30,
                                      left: AppMargin.m30,
                                      top: AppMargin.m20),
                                  alignment: Alignment.centerRight,
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m16,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br5),
                                  ),
                                  child: reportCtrl.loading.value
                                      ? const BubbleLoader()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                                reportCtrl
                                                    .getAllWindDirectionText
                                                    .value,
                                                textAlign: TextAlign.center,
                                                style: getSemiBoldStyle(
                                                    color: ColorManager
                                                        .secondary)),
                                            const Spacer(),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: ColorManager.secondary,
                                              size: AppSize.s30,
                                            ),
                                          ],
                                        ),
                                ))),
                            const ReportDividerWidget(),
                            ReportTextFieldWidget(
                                symbol: "d".tr,
                                controller: controllerWaterTemperature,
                                title: "WaterTemperature".tr,
                                type: TextInputType.number,
                                onSavedFunction: (val) {
                                  reportCtrl.WaterTemperature.value = val!;
                                }),

                            ReportTextFieldWidget(
                                symbol: "s".tr,
                                controller: controllerWindspeed,
                                title: "Wind speed".tr,
                                type: TextInputType.number,
                                onSavedFunction: (val) {
                                  reportCtrl.Windspeed.value = val!;
                                }),
                            ReportTextFieldWidget(
                                symbol: "r".tr,
                                controller: controllerrelativehumidity,
                                title: "relative humidity".tr,
                                type: TextInputType.number,
                                onSavedFunction: (val) {
                                  reportCtrl.relativehumidity.value = val!;
                                }),
                            Obx(() => reportCtrl.send.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                ColorManager.lightPrimary),
                                        onPressed: () {
                                          reportCtrl.UpdateReport(
                                              context: context,
                                              firstCarpone:
                                                  controllerFirstCarpone.text,
                                              secoundCarpone:
                                                  controllerSecoundCarpone.text,
                                              waterTemperature:
                                                  controllerWaterTemperature
                                                      .text,
                                              // acidity: controllerAcidity.text,
                                              epicenterId: widget.epicenterId!,
                                              hardness: controllerHardness.text,
                                              epicenterDepth:
                                                  controllerDepth.text,
                                              epicenterLenght:
                                                  controllerHeight.text,
                                              epicenterWidth:
                                                  controllerWidth.text,
                                              humidity: controllerrelativehumidity
                                                  .text,
                                              windSpeed:
                                                  controllerWindspeed.text,
                                              extentOfPolluationDescription:
                                                  controllerotherNote.text,
                                              // allKindsOfCarbon:
                                              //     controllerallKindsOfCarbon.text,
                                              dissolvedOxygen:
                                                  controllerdissolvedOxygen
                                                      .text,
                                              electricalConnection:
                                                  controlleelectricalConnection
                                                      .text,
                                              nitrogenDioxide:
                                                  controllernitrogenDioxide
                                                      .text,
                                              ozone: controllerozone.text,
                                              pH: controllepH.text,
                                              pm10: controllerpM10.text,
                                              pm25: controllerpM25.text,
                                              salinity: controllersalinity.text,
                                              sulfurDioxide:
                                                  controllersulfurDioxide.text,
                                              temperature:
                                                  controllertempreture.text,
                                              totalDissolvedSolids:
                                                  controllertotalDissolvedSolids
                                                      .text,
                                              totalOrganicCarbon:
                                                  controllertotalOrganicCarbon
                                                      .text,
                                              totalSuspendedSolids:
                                                  controlletotalSuspendedSolids
                                                      .text,
                                              turbidity:
                                                  controlleturbidity.text,
                                              volatileOrganicMatter:
                                                  controllervolatileOrganicMatter
                                                      .text,
                                              reportId: widget.report!.reportId);
                                        },
                                        child: Text(
                                          "update report".tr,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        )),
                                  ))
                          ],
                        ),
                      )),
            )));
  }
}
