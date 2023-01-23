// ignore: duplicate_ignore

// ignore_for_file: depend_on_referenced_packages, duplicate_ignore

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// ignore: implementation_imports
import 'package:async/src/delegate/stream.dart';
import 'package:enivronment/presentation/Home/home_screen.dart';
import 'package:enivronment/presentation/Home/update_report.dart';
import 'package:enivronment/presentation/resources/color_manager.dart';
import 'package:enivronment/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../domain/model/report/add_report_model.dart';
import '../../rejon_model.dart';

class AddReportService {
  static Future sendReport({
    required Report allData,
  }) async {
    int industrialActivitiesIncrement = 0;
    int reportIndustrialPolluationSourcesIncrement = 0;
    int reportPolluationSourcesIncrement = 0;
    int reportPotentialPollutantsIncrement = 0;
    int reportSurroundingBuildingsIncrement = 0;
    int reportSurroundingBuildingsIds = 0;
    int reportSemanticPollutionIds = 0;
    int reportSurroundedMediumIds = 0;
    int reportPlantIds = 0;
    int reportUndergroundWaterIds = 0;

    final Uri url = Uri.parse(Constants.addReportEndPoint);
    try {
      var headers = <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      };
      var request = http.MultipartRequest("POST", url);
      request.headers.addAll(headers);
      //!=================================================================
      //! add all images to request
      for (int i = 0; i < allData.photos!.length; i++) {
        if (allData.photos![i].path != Constants.empty) {
          var stream = http.ByteStream(
              // ignore: deprecated_member_use
              DelegatingStream.typed(allData.photos![i].openRead()));
          var length = await allData.photos![i].length();
          var multipartFile1 = http.MultipartFile('Photos', stream, length,
              filename: basename(allData.photos![i].path));
          request.files.add(multipartFile1);
        }
      }
      //!=================================================================
      for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
        request.fields[
                "ReportIndustrialActivitiesIds[$industrialActivitiesIncrement]"] =
            "${allData.reportIndustrialActivitiesIds![i]}";
        industrialActivitiesIncrement++;
      }

      //!=================================================================
      // for (var i = 0;
      //     i < allData.reportIndustrialPolluationSourcesIds.length;
      //     i++) {
      //   request.fields[
      //           "ReportIndustrialPolluationSourcesIds[$reportIndustrialPolluationSourcesIncrement]"] =
      //       "${allData.reportIndustrialPolluationSourcesIds[i]}";
      //   reportIndustrialPolluationSourcesIncrement++;
      // }

      for (int i = 0; i < allData.ReportSemanticPollutionIds!.length; i++) {
        request.files.add(http.MultipartFile.fromString(
            'ReportSurroundingBuildingsIds[$reportSurroundingBuildingsIds]',
            allData.ReportSemanticPollutionIds![i].toString()));
        reportSurroundingBuildingsIds++;
      }
      for (int i = 0; i < allData.ReportSemanticPollutionIds!.length; i++) {
        request.files.add(http.MultipartFile.fromString(
            'ReportSemanticPollutionIds[$reportSemanticPollutionIds]',
            allData.ReportSemanticPollutionIds![i].toString()));
        reportSemanticPollutionIds++;
      }
      for (int i = 0; i < allData.ReportSurroundedMediumIds!.length; i++) {
        request.files.add(http.MultipartFile.fromString(
            'ReportSurroundedMediumIds[$reportSurroundedMediumIds]',
            allData.ReportSurroundedMediumIds![i].toString()));
        reportSurroundedMediumIds++;
      }
      for (int i = 0; i < allData.ReportPlantIds!.length; i++) {
        request.files.add(http.MultipartFile.fromString(
            'ReportPlantIds[$reportPlantIds]',
            allData.ReportPlantIds![i].toString()));
        reportPlantIds++;
      }
      for (int i = 0; i < allData.ReportUndergroundWaterIds!.length; i++) {
        request.files.add(http.MultipartFile.fromString(
            'ReportUndergroundWaterIds[$reportUndergroundWaterIds]',
            allData.ReportUndergroundWaterIds![i].toString()));
        reportUndergroundWaterIds++;
      }

      //!=================================================================
      for (var i = 0; i < allData.reportPolluationSourcesIds!.length; i++) {
        request.fields[
                "ReportPolluationSourcesIds[$reportPolluationSourcesIncrement]"] =
            "${allData.reportPolluationSourcesIds![i]}";
        reportPolluationSourcesIncrement++;
      }

      //!=================================================================
      for (var i = 0; i < allData.reportPotentialPollutantsIds!.length; i++) {
        request.fields[
                "ReportPotentialPollutantsIds[$reportPotentialPollutantsIncrement]"] =
            "${allData.reportPotentialPollutantsIds![i]}";
        reportPotentialPollutantsIncrement++;
      }

      //!=================================================================
      for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
        request.fields[
                "ReportSurroundingBuildingsIds[$reportSurroundingBuildingsIncrement]"] =
            "${allData.reportSurroundingBuildingsIds![i]}";
        reportSurroundingBuildingsIncrement++;
      }
      // print(allData.polluationSize);
      print("ExtentOfPolluationDescription");
      //!=================================================================
      request.fields["ExtentOfPolluationDescription"] =
          allData.extentOfPolluationDescription.toString();
      request.fields["Lat"] = "${allData.lat}";
      request.fields["Long"] = "${allData.long}";
      request.fields["HasResidentialArea"] = "${allData.hasResidentialArea}";
      request.fields["HasVegetation"] = "${allData.hasVegetation}";
      request.fields["HasGroundWater"] = "${allData.hasGroundWater}";
      // request.fields["EpicenterSize"] = allData.epicenterSize;
      //  request.fields["PolluationSize"] = allData.polluationSize;
      request.fields["EpicenterId"] = "${allData.epicenterId}";
      request.fields["CityId"] = "${allData.cityId}";
      request.fields["LandFormId"] = "${allData.landFormId}";
      // request.fields["PollutantReactivityId"] =
      //     "${allData.pollutantReactivityId}";
      request.fields["PollutantPlaceId"] = "${allData.pollutantPlaceId}";
      request.fields["SurfaceWaterId"] = "${allData.surfaceWaterId}";
      request.fields["WeatherId"] = "1";
      // request.fields["WeatherId"] = "${allData.weatherId}";
      request.fields['Temperature'] = allData.temperature ?? "0.0";
      request.fields['Salinity'] = allData.salinity ?? "0.0";
      request.fields['TotalDissolvedSolids'] =
          allData.totalDissolvedSolids ?? "0.0";
      request.fields['TotalSuspendedSolids'] =
          allData.totalSuspendedSolids ?? "0.0";
      request.fields['PH'] = allData.pH ?? "0.0";
      request.fields['Turbidity'] = allData.turbidity ?? "0.0";
      request.fields['ElectricalConnection'] =
          allData.electricalConnection ?? "0.0";
      request.fields['DissolvedOxygen'] = allData.dissolvedOxygen ?? "0.0";
      request.fields['TotalOrganicCarbon'] =
          allData.totalOrganicCarbon ?? "0.0";
      request.fields['VolatileOrganicMatter'] =
          allData.volatileOrganicMatter ?? "0.0";
      request.fields['Ozone'] = allData.ozone ?? "0.0";
      request.fields['AllKindsOfCarbon'] = allData.allKindsOfCarbon ?? "0.0";
      request.fields['NitrogenDioxide'] = allData.nitrogenDioxide ?? "0.0";
      request.fields['SulfurDioxide'] = allData.sulfurDioxide ?? "0.0";
      request.fields['PM25'] = allData.pM25 ?? "0.0";
      request.fields['PM10'] = allData.pM10 ?? "0.0";
      request.fields['Hardness'] = allData.hardness ?? "0.0";
      request.fields['EpicenterDepth'] = allData.EpicenterDepth ?? "0.0";
      request.fields['EpicenterWidth'] = allData.EpicenterLenght ?? "0.0";
      request.fields['EpicenterLenght'] = allData.EpicenterLenght ?? "0.0";

      request.fields['Humidity'] = allData.Humidity ?? "0.0";
      request.fields['WindDirection'] = allData.WindDirectionId.toString();
      request.fields['WindSpeed'] = allData.WindSpeed ?? "0.0";
      request.fields['SunRise'] = allData.SunRise.toString();
      request.fields['NatureOfEpicenterId'] =
          allData.NatureOfEpicenterId.toString();
      request.fields['responsibleAuthorityId'] =
          allData.responsibleAuthorityId.toString();
      //!=================================================================
      var res = await request.send();
      print(res.statusCode);
      print(res.runtimeType.toString());
      var responseStream = await res.stream.bytesToString();
      if (res.statusCode == 200 || res.statusCode == 201) {
        print(res.statusCode);
        Get.defaultDialog(
          title: Constants.empty,
          middleText: AppStrings.sucuss,
          onConfirm: () => Get.offAll(() => HomeScreen()),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
        // Get.offAll(() => HomeScreen());
        return 200;
      } else if (res.statusCode == 400) {
        print(res.statusCode);
        log("error 400 : ${res.reasonPhrase}");
        log("Response: $responseStream");
        return 400;
      } else if (res.statusCode == 403) {
        Get.defaultDialog(
          title: "هذا اليوزر لايملك صلاحيه",
          middleText: AppStrings.error,
          onConfirm: () => Get.offAll(() => HomeScreen()),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
        print(res.statusCode);
        return 403;
      } else if (res.statusCode == 500 ||
          res.statusCode == 501 ||
          res.statusCode == 504) {
        print(res.statusCode);
        return 500;
      }
    } catch (e) {
      log("error : $e");
      throw Exception("exception $e");
    }
  }

  // static Future UpdateReport({
  //   required ReportModel allData,
  //   int? reportId,
  // }) async {
  //   int industrialActivitiesIncrement = 0;
  //   int reportIndustrialPolluationSourcesIncrement = 0;
  //   int reportPolluationSourcesIncrement = 0;
  //   int reportPotentialPollutantsIncrement = 0;
  //   int reportSurroundingBuildingsIncrement = 0;
  //
  //   final Uri url = Uri.parse("${Constants.updateReport}/$reportId");
  //   try {
  //     var headers = <String, String>{
  //       "Content-type": "application/json",
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
  //       'lang': Get.locale!.languageCode
  //     };
  //     var request = http.MultipartRequest("PUT", url);
  //     request.headers.addAll(headers);
  //     //!=================================================================
  //     //! add all images to request
  //     for (int i = 0; i < allData.photos!.length; i++) {
  //       if (allData.photos![i].path != Constants.empty) {
  //         var stream = http.ByteStream(
  //             // ignore: deprecated_member_use
  //             DelegatingStream.typed(allData.photos![i].openRead()));
  //         var length = await allData.photos![i].length();
  //         var multipartFile1 = http.MultipartFile('Photos', stream, length,
  //             filename: basename(allData.photos![i].path));
  //         request.files.add(multipartFile1);
  //       }
  //     }
  //     //!=================================================================
  //     for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
  //       request.fields[
  //               "ReportIndustrialActivitiesIds[$industrialActivitiesIncrement]"] =
  //           "${allData.reportIndustrialActivitiesIds![i]}";
  //       industrialActivitiesIncrement++;
  //     }
  //
  //     //!=================================================================
  //     // for (var i = 0;
  //     //     i < allData.reportIndustrialPolluationSourcesIds.length;
  //     //     i++) {
  //     //   request.fields[
  //     //           "ReportIndustrialPolluationSourcesIds[$reportIndustrialPolluationSourcesIncrement]"] =
  //     //       "${allData.reportIndustrialPolluationSourcesIds[i]}";
  //     //   reportIndustrialPolluationSourcesIncrement++;
  //     // }
  //
  //     //!=================================================================
  //     for (var i = 0; i < allData.reportPolluationSourcesIds!.length; i++) {
  //       request.fields[
  //               "ReportPolluationSourcesIds[$reportPolluationSourcesIncrement]"] =
  //           "${allData.reportPolluationSourcesIds![i]}";
  //       reportPolluationSourcesIncrement++;
  //     }
  //
  //     //!=================================================================
  //     for (var i = 0; i < allData.reportPotentialPollutantsIds!.length; i++) {
  //       request.fields[
  //               "ReportPotentialPollutantsIds[$reportPotentialPollutantsIncrement]"] =
  //           "${allData.reportPotentialPollutantsIds![i]}";
  //       reportPotentialPollutantsIncrement++;
  //     }
  //
  //     //!=================================================================
  //     for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
  //       request.fields[
  //               "ReportSurroundingBuildingsIds[$reportSurroundingBuildingsIncrement]"] =
  //           "${allData.reportSurroundingBuildingsIds![i]}";
  //       reportSurroundingBuildingsIncrement++;
  //     }
  //
  //     for (int i = 0; i < allData.IgnoriedPhotos!.length; i++) {
  //       request.files.add(http.MultipartFile.fromString(
  //           'IgnoriedPhotos', allData.IgnoriedPhotos![i].toString()));
  //     }
  //
  //     // print(allData.polluationSize);
  //     print("ExtentOfPolluationDescription");
  //     //!=================================================================
  //     request.fields["ExtentOfPolluationDescription"] =
  //         allData.extentOfPolluationDescription.toString();
  //     request.fields["Lat"] = "${allData.lat}";
  //     request.fields["Long"] = "${allData.long}";
  //     request.fields["HasResidentialArea"] = "${allData.hasResidentialArea}";
  //     request.fields["HasVegetation"] = "${allData.hasVegetation}";
  //     request.fields["HasGroundWater"] = "${allData.hasGroundWater}";
  //     // request.fields["EpicenterSize"] = allData.epicenterSize;
  //     //  request.fields["PolluationSize"] = allData.polluationSize;
  //     request.fields["EpicenterId"] = "${allData.epicenterId}";
  //     request.fields["CityId"] = "${allData.cityId}";
  //     request.fields["LandFormId"] = "${allData.landFormId}";
  //     // request.fields["PollutantReactivityId"] =
  //     //     "${allData.pollutantReactivityId}";
  //     request.fields["PollutantPlaceId"] = "${allData.pollutantPlaceId}";
  //     request.fields["SurfaceWaterId"] = "${allData.surfaceWaterId}";
  //     // request.fields["WeatherId"] = "1";
  //     // request.fields["WeatherId"] = "${allData.weatherId}";
  //     request.fields['Temperature'] = allData.temperature ?? "0.0";
  //     request.fields['Salinity'] = allData.salinity ?? "0.0";
  //     request.fields['TotalDissolvedSolids'] =
  //         allData.totalDissolvedSolids ?? "0.0";
  //     request.fields['TotalSuspendedSolids'] =
  //         allData.totalSuspendedSolids ?? "0.0";
  //     request.fields['PH'] = allData.pH ?? "0.0";
  //     request.fields['Turbidity'] = allData.turbidity ?? "0.0";
  //     request.fields['ElectricalConnection'] =
  //         allData.electricalConnection ?? "0.0";
  //     request.fields['DissolvedOxygen'] = allData.dissolvedOxygen ?? "0.0";
  //     request.fields['TotalOrganicCarbon'] =
  //         allData.totalOrganicCarbon ?? "0.0";
  //     request.fields['VolatileOrganicMatter'] =
  //         allData.volatileOrganicMatter ?? "0.0";
  //     request.fields['Ozone'] = allData.ozone ?? "0.0";
  //     request.fields['AllKindsOfCarbon'] = allData.allKindsOfCarbon ?? "0.0";
  //     request.fields['NitrogenDioxide'] = allData.nitrogenDioxide ?? "0.0";
  //     request.fields['SulfurDioxide'] = allData.sulfurDioxide ?? "0.0";
  //     request.fields['PM25'] = allData.pM25 ?? "0.0";
  //     request.fields['PM10'] = allData.pM10 ?? "0.0";
  //     request.fields['Hardness'] = allData.hardness ?? "0.0";
  //     // request.fields['IgnoriedPhotos'] = allData.IgnoriedPhotos ?? "0.0";
  //     print(allData.hardness);
  //     request.fields['responsibleAuthorityId'] =
  //         allData.responsibleAuthorityId.toString();
  //     //!=================================================================
  //     var res = await request.send();
  //     print(res.statusCode);
  //     print(allData.IgnoriedPhotos);
  //     var responseStream = await res.stream.bytesToString();
  //     if (res.statusCode == 200 || res.statusCode == 201) {
  //       print(allData.photos!.length);
  //       // print(allData.epicenterSize);
  //       print(res.statusCode);
  //       Get.defaultDialog(
  //         title: Constants.empty,
  //         middleText: AppStrings.sucuss,
  //         onConfirm: () => Get.offAll(() => HomeScreen()),
  //         confirmTextColor: ColorManager.white,
  //         buttonColor: ColorManager.error,
  //         backgroundColor: ColorManager.white,
  //       );
  //       // Get.offAll(() => HomeScreen());
  //       return 200;
  //     } else if (res.statusCode == 400) {
  //       print(res.statusCode);
  //       log("error 400 : ${res.reasonPhrase}");
  //       log("Response: $responseStream");
  //       return 400;
  //     } else if (res.statusCode == 403) {
  //       Get.defaultDialog(
  //         title: "هذا اليوزر لايملك صلاحيه",
  //         middleText: AppStrings.error,
  //         onConfirm: () => Get.offAll(() => HomeScreen()),
  //         confirmTextColor: ColorManager.white,
  //         buttonColor: ColorManager.error,
  //         backgroundColor: ColorManager.white,
  //       );
  //       print(res.statusCode);
  //       return 403;
  //     } else if (res.statusCode == 500 ||
  //         res.statusCode == 501 ||
  //         res.statusCode == 504) {
  //       print(res.statusCode);
  //       return 500;
  //     }
  //   } catch (e) {
  //     log("error : $e");
  //     throw Exception("exception $e");
  //   }
  // }

  Future<List<CitiesModel>?> getAllUnderGroundWater() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.getAllUndergroundWater),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<CitiesModel>.from(
            jsonDecode(res.body).map((i) => CitiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  Future<List<CitiesModel>?> getAllPollution() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.polluationSourceEndPoint),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<CitiesModel>.from(
            jsonDecode(res.body).map((i) => CitiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  Future<List<CitiesModel>?> getAllPotentialPollutants() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.allPotentialPollutantsEndPoint),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<CitiesModel>.from(
            jsonDecode(res.body).map((i) => CitiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  Future<List<CitiesModel>?> getAllPlants() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.getAllPlant),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<CitiesModel>.from(
            jsonDecode(res.body).map((i) => CitiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  Future<List<CitiesModel>?> semanticPollution() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.semanticPollution),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<CitiesModel>.from(
            jsonDecode(res.body).map((i) => CitiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  Future<List<CitiesModel>?> surroundedMediums() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.surroundedMediums),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<CitiesModel>.from(
            jsonDecode(res.body).map((i) => CitiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  Future<List<CitiesModel>?> natureOfEpicenter() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.natureOfEpicenter),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<CitiesModel>.from(
            jsonDecode(res.body).map((i) => CitiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  Future<List<CitiesModel>?> getSurroundingBuildings() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.allSurroundingBuildingssEndPoint),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<CitiesModel>.from(
            jsonDecode(res.body).map((i) => CitiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  Future<List<CitiesModel>?> getAllWindDirection() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.getAllWindDirection),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<CitiesModel>.from(
            jsonDecode(res.body).map((i) => CitiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  add(
    Report allData,
  ) async {
    int industrialActivitiesIncrement = 0;
    int reportPolluationSourcesIncrement = 0;
    int reportPotentialPollutantsIncrement = 0;
    int reportSurroundingBuildingsIncrement = 0;
    int reportSurroundingBuildingsIds = 0;
    int reportSurroundingBuildingsDistance = 0;
    int reportSemanticPollutionIds = 0;
    int reportSurroundedMediumIds = 0;
    int reportPlantIds = 0;
    int reportActivityIds = 0;
    int reportDescriptionIds = 0;
    int reportDistanceIds = 0;
    int reportUndergroundWaterIds = 0;
    int reportSurrouningAttachments = 0;
    int reportIndastrilAttachments = 0;
    var headers = {
      'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
      'Cookie':
          '.AspNetCore.Identity.Application=CfDJ8Na31CbMNKRHr48hwu67rOb6zQ2eMoWl1tpH0urgNTY88n-JmzBUtwaJFkxQ3aNo2SM1oWMzP0miNoQdx-uu1DkE8ZkF90i-2lR37BKkaCgFcqmxeyf_cTTKvfTW9LpEIYYtprNfI0blioGQYbUBn6IKV82c-5PQ8mDjM5ghWWdlzFjwA6Hu8zt0DRKPg2ScCtTxO02FbP43UTtD552T5h_0ayFag70VAJC8A3QnCql9UfTx9rYXnQ14E_NRr8zjIN5lNawO2e42JSkTROe313VCB_KpLDwGCd8wlmpAa5ENJf8dTINRk2cr2VDA8LzC60r11spKl5hs4zgWU5dZLFNX8giNJpUv1MSCULuCot4W7uS8doxImmHqgZ4tVLOf1B18t2NLwz5T8beaVcAWbSOKAc_d-2I1SGtVLvwL4458L8RwmISVx3DEJe7Vl1SCZ76Yswhf6lfioT9YgXchn0uAvFWWD9ec4pfgoY8o7u5k79hS0oXqzzCqxtvF2YW0uUHBnrcRE6pA-2ZGuiX2NtcmsvR2GpGXng0oVYHn-2VSd3T8ysz6RqzsQnMcIo-HJorU12nBuAYd94Azm_24jkEdPD9PtKVVsG5gDMubw0z5rYgRgPyC3cVJAcfQhVc1nEo6XxYJRufq2uaVpZhncmKQx9vk6EM5G-WpavcC2WGA5U7NEoxJvq5sMxnw80n8x9ZsxE7bML5EiHzoyc4wWnXFcbvtGk1w8d9G7atSY1DmQyoX8azjn4l8TzE8c5kdWaA96wp_SS5aaxFqqzut0nWK1KtAM2nOjVu0LlAGUbM5LdJuNMi_fSTErVdqhxGOLo98hXGvIFoTjcMOj7GDmwk'
    };
    final Uri url = Uri.parse(Constants.addReportEndPoint);

    var request = http.MultipartRequest('POST', url);
    request.fields.addAll({
      'ExtentOfPolluationDescription':
          allData.extentOfPolluationDescription.toString(),
      'Lat': allData.lat.toString(),
      'Long': allData.long.toString(),
      'HasResidentialArea': allData.hasResidentialArea.toString(),
      'HasVegetation': allData.hasVegetation.toString(),
      'HasGroundWater': allData.hasGroundWater.toString(),
      'EpicenterId': allData.epicenterId.toString(),
      'CityId': allData.cityId.toString(),
      'LandFormId': allData.landFormId.toString(),
      'PollutantPlaceId': allData.pollutantPlaceId.toString(),
      'SurfaceWaterId': allData.surfaceWaterId.toString(),
      'Temperature': allData.temperature.toString(),
      'Salinity': allData.salinity.toString(),
      'TotalDissolvedSolids': allData.totalDissolvedSolids.toString(),
      'TotalSuspendedSolids': allData.totalSuspendedSolids.toString(),
      'PH': allData.pH.toString(),
      'Turbidity': allData.turbidity.toString(),
      'ElectricalConnection': allData.electricalConnection.toString(),
      'DissolvedOxygen': allData.dissolvedOxygen.toString(),
      'TotalOrganicCarbon': allData.totalOrganicCarbon.toString(),
      'VolatileOrganicMatter': allData.volatileOrganicMatter.toString(),
      'Ozone': allData.ozone.toString(),
      // 'AllKindsOfCarbon': allData.allKindsOfCarbon.toString(),
      'NitrogenDioxide': allData.nitrogenDioxide.toString(),
      'SulfurDioxide': allData.sulfurDioxide.toString(),
      'PM25': allData.pM25.toString(),
      'PM10': allData.pM10.toString(),
      'responsibleAuthorityId': allData.responsibleAuthorityId.toString(),
      'Hardness': allData.hardness.toString(),
      'EpicenterLenght': allData.EpicenterLenght.toString(),
      'EpicenterWidth': allData.EpicenterWidth.toString(),
      'EpicenterDepth': allData.EpicenterDepth.toString(),
      'Humidity': allData.Humidity.toString(),
      'WindDirectionId': allData.WindDirectionId.toString(),
      'WindSpeed': allData.WindSpeed.toString(),
      'SunRise': allData.SunRise.toString(),
      'NatureOfEpicenterId': allData.NatureOfEpicenterId.toString(),
      // 'Acidity': allData.Acidity.toString(),
      'SecoundCarpone': allData.SecoundCarpone.toString(),
      'FirstCarpone': allData.FirstCarpone.toString(),
      'WaterTemperature': allData.WaterTemperature.toString(),
    });
    for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
      request.fields["ReportIndustrialActivitiesIds[$i].IndustrialActivityId"] =
          "${allData.reportIndustrialActivitiesIds![reportActivityIds].industrialActivityId}";
      reportActivityIds++;
    }
    for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
      if (allData.reportIndustrialActivitiesIds![i].description == null) {
      } else {
        request.fields["ReportIndustrialActivitiesIds[$i].Discription"] =
            "${allData.reportIndustrialActivitiesIds![reportDescriptionIds].description}";
        reportDescriptionIds++;
      }
    }
    for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
      if (allData.reportIndustrialActivitiesIds![i].distance == null) {
      } else {
        request.fields["ReportIndustrialActivitiesIds[$i].Distance"] =
            "${allData.reportIndustrialActivitiesIds![reportDistanceIds].distance}";
        reportDistanceIds++;
      }
    }

    for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
      if (allData.reportIndustrialActivitiesIds![i].attachment == null) {
      } else {
        request.files.add(await http.MultipartFile.fromPath(
            'ReportIndustrialActivitiesIds[$i].Attachment',
            allData.reportIndustrialActivitiesIds![reportIndastrilAttachments]
                .attachment!.path));
        reportIndastrilAttachments++;
      }
    }

    for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
      if (allData.reportSurroundingBuildingsIds![i].attachment == null) {
      } else {
        request.files.add(await http.MultipartFile.fromPath(
            'ReportSurroundingBuildings[$i].Attachment',
            allData.reportSurroundingBuildingsIds![reportSurrouningAttachments]
                .attachment!.path));
        reportSurrouningAttachments++;
      }
    }
    print(
        allData.reportSurroundingBuildingsIds?.map((v) => v.toJson()).toList());

    for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
      request.fields["ReportSurroundingBuildings[$i].SurroundingBuildingId"] =
          "${allData.reportSurroundingBuildingsIds![reportSurroundingBuildingsIds].surroundingBuildingId}";
      reportSurroundingBuildingsIds++;
    }

    for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
      if (allData.reportSurroundingBuildingsIds![i].distance == null) {
      } else {
        request.fields["ReportSurroundingBuildings[$i].Distance"] =
            "${allData.reportSurroundingBuildingsIds![reportSurroundingBuildingsDistance].distance}";
        reportSurroundingBuildingsDistance++;
      }
    }

    for (var i = 0; i < allData.reportPolluationSourcesIds!.length; i++) {
      request.fields[
              "ReportPolluationSourcesIds[$reportPolluationSourcesIncrement]"] =
          "${allData.reportPolluationSourcesIds![i]}";
    }
    for (var i = 0; i < allData.photos!.length; i++) {
      request.files.add(
          await http.MultipartFile.fromPath('Photos', allData.photos![i].path));
    }

    // for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
    //   request.fields[
    //           "ReportIndustrialActivitiesIds[$industrialActivitiesIncrement]"] =
    //       "${allData.reportIndustrialActivitiesIds![i]}";
    //   industrialActivitiesIncrement++;
    // }

    for (var i = 0; i < allData.reportPotentialPollutantsIds!.length; i++) {
      request.fields[
              "ReportPotentialPollutantsIds[$reportPotentialPollutantsIncrement]"] =
          "${allData.reportPotentialPollutantsIds![i]}";
      reportPotentialPollutantsIncrement++;
    }
    for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
      request.fields[
              "ReportSurroundingBuildingsIds[$reportSurroundingBuildingsIncrement]"] =
          "${allData.reportSurroundingBuildingsIds![i]}";
      reportSurroundingBuildingsIncrement++;
    }
    print(allData.ReportSemanticPollutionIds!.length);
    for (int i = 0; i < allData.ReportSemanticPollutionIds!.length; i++) {
      request.files.add(http.MultipartFile.fromString(
          'ReportSemanticPollutionIds[$reportSemanticPollutionIds]',
          allData.ReportSemanticPollutionIds![i].toString()));
      reportSemanticPollutionIds++;
    }
    for (int i = 0; i < allData.ReportSurroundedMediumIds!.length; i++) {
      request.files.add(http.MultipartFile.fromString(
          'ReportSurroundedMediumIds[$reportSurroundedMediumIds]',
          allData.ReportSurroundedMediumIds![i].toString()));
      reportSurroundedMediumIds++;
    }
    for (int i = 0; i < allData.ReportPlantIds!.length; i++) {
      request.files.add(http.MultipartFile.fromString(
          'ReportPlantIds[$reportPlantIds]',
          allData.ReportPlantIds![i].toString()));
      reportPlantIds++;
    }
    for (int i = 0; i < allData.ReportUndergroundWaterIds!.length; i++) {
      request.files.add(http.MultipartFile.fromString(
          'ReportUndergroundWaterIds[$reportUndergroundWaterIds]',
          allData.ReportUndergroundWaterIds![i].toString()));
      reportUndergroundWaterIds++;
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    print(response.reasonPhrase);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      Get.defaultDialog(
        title: Constants.empty,
        middleText: AppStrings.update,
        // onConfirm: () => Get.offAll(() => HomeScreen()),
        // confirmTextColor: ColorManager.white,
        // buttonColor: ColorManager.primary,
        // backgroundColor: ColorManager.white,
        radius: 25,
        content: Column(
          children: [
            Lottie.asset('assets/images/sucess.json', height: 150),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: ColorManager.primary
                    ,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                )
                ),
                onPressed: () {
                  Get.offAll(() => HomeScreen());
                },
                child:  Text("تم الارسال بنجاح",style: TextStyle(color:ColorManager.white,fontSize: 16 ),))
          ],
        ),
      );
      // Get.offAll(() => HomeScreen());
      return 200;
    } else if (response.statusCode == 400) {
      Get.defaultDialog(
        title: "توجد مشكله فى الارسال",
        middleText: AppStrings.error,
        onConfirm: () => Get.offAll(() => HomeScreen()),
        confirmTextColor: ColorManager.white,
        buttonColor: ColorManager.error,
        backgroundColor: ColorManager.white,
      );
      print(response.statusCode);
      log("error 400 : ${response.reasonPhrase}");
      log("Response: $response");
      return 400;
    } else if (response.statusCode == 403) {
      Get.defaultDialog(
        title: "هذا المستخدم لايملك صلاحيه",
        middleText: AppStrings.error,
        onConfirm: () => Get.offAll(() => HomeScreen()),
        confirmTextColor: ColorManager.white,
        buttonColor: ColorManager.error,
        backgroundColor: ColorManager.white,
      );
      print(response.statusCode);
      return 403;
    } else if (response.statusCode == 500 ||
        response.statusCode == 501 ||
        response.statusCode == 504) {
      print(response.statusCode);
      return 500;
    }
  }

  UpdateReport(
    Report allData,
    int? reportId,
  ) async {
    int industrialActivitiesIncrement = 0;
    int reportPolluationSourcesIncrement = 0;
    int reportPotentialPollutantsIncrement = 0;
    int reportSurroundingBuildingsIncrement = 0;
    int reportSurroundingBuildingsIds = 0;
    int reportActivityIds = 0;
    int reportDescriptionIds = 0;
    int reportDistanceIds = 0;
    int reportSurroundingBuildingsDistance = 0;
    int reportSurrouningAttachments = 0;
    int reportSemanticPollutionIds = 0;
    int reportSurroundedMediumIds = 0;
    int reportPlantIds = 0;
    int reportUndergroundWaterIds = 0;
    int reportIndastrilAttachments = 0;
    var headers = {
      'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
      // 'Cookie':
      //     '.AspNetCore.Identity.Application=CfDJ8Na31CbMNKRHr48hwu67rOb6zQ2eMoWl1tpH0urgNTY88n-JmzBUtwaJFkxQ3aNo2SM1oWMzP0miNoQdx-uu1DkE8ZkF90i-2lR37BKkaCgFcqmxeyf_cTTKvfTW9LpEIYYtprNfI0blioGQYbUBn6IKV82c-5PQ8mDjM5ghWWdlzFjwA6Hu8zt0DRKPg2ScCtTxO02FbP43UTtD552T5h_0ayFag70VAJC8A3QnCql9UfTx9rYXnQ14E_NRr8zjIN5lNawO2e42JSkTROe313VCB_KpLDwGCd8wlmpAa5ENJf8dTINRk2cr2VDA8LzC60r11spKl5hs4zgWU5dZLFNX8giNJpUv1MSCULuCot4W7uS8doxImmHqgZ4tVLOf1B18t2NLwz5T8beaVcAWbSOKAc_d-2I1SGtVLvwL4458L8RwmISVx3DEJe7Vl1SCZ76Yswhf6lfioT9YgXchn0uAvFWWD9ec4pfgoY8o7u5k79hS0oXqzzCqxtvF2YW0uUHBnrcRE6pA-2ZGuiX2NtcmsvR2GpGXng0oVYHn-2VSd3T8ysz6RqzsQnMcIo-HJorU12nBuAYd94Azm_24jkEdPD9PtKVVsG5gDMubw0z5rYgRgPyC3cVJAcfQhVc1nEo6XxYJRufq2uaVpZhncmKQx9vk6EM5G-WpavcC2WGA5U7NEoxJvq5sMxnw80n8x9ZsxE7bML5EiHzoyc4wWnXFcbvtGk1w8d9G7atSY1DmQyoX8azjn4l8TzE8c5kdWaA96wp_SS5aaxFqqzut0nWK1KtAM2nOjVu0LlAGUbM5LdJuNMi_fSTErVdqhxGOLo98hXGvIFoTjcMOj7GDmwk'
    };
    final Uri url = Uri.parse("${Constants.updateReport}/$reportId");

    var request = http.MultipartRequest('PUT', url);
    request.fields.addAll({
      'ExtentOfPolluationDescription':
          allData.extentOfPolluationDescription.toString(),
      'Lat': allData.lat.toString(),
      'Long': allData.long.toString(),
      'HasResidentialArea': allData.hasResidentialArea.toString(),
      'HasVegetation': allData.hasVegetation.toString(),
      'HasGroundWater': allData.hasGroundWater.toString(),
      'EpicenterId': allData.epicenterId.toString(),
      'CityId': allData.cityId.toString(),
      'LandFormId': allData.landFormId.toString(),
      'PollutantPlaceId': allData.pollutantPlaceId.toString(),
      'SurfaceWaterId': allData.surfaceWaterId.toString(),
      'Temperature': allData.temperature.toString(),
      'Salinity': allData.salinity.toString(),
      'TotalDissolvedSolids': allData.totalDissolvedSolids.toString(),
      'TotalSuspendedSolids': allData.totalSuspendedSolids.toString(),
      'PH': allData.pH.toString(),
      'Turbidity': allData.turbidity.toString(),
      'ElectricalConnection': allData.electricalConnection.toString(),
      'DissolvedOxygen': allData.dissolvedOxygen.toString(),
      'TotalOrganicCarbon': allData.totalOrganicCarbon.toString(),
      'VolatileOrganicMatter': allData.volatileOrganicMatter.toString(),
      'Ozone': allData.ozone.toString(),
      // 'AllKindsOfCarbon': allData.allKindsOfCarbon.toString(),
      'NitrogenDioxide': allData.nitrogenDioxide.toString(),
      'SulfurDioxide': allData.sulfurDioxide.toString(),
      'PM25': allData.pM25.toString(),
      'PM10': allData.pM10.toString(),
      'responsibleAuthorityId': allData.responsibleAuthorityId.toString(),
      'Hardness': allData.hardness.toString(),
      'EpicenterLenght': allData.EpicenterLenght.toString(),
      'EpicenterWidth': allData.EpicenterWidth.toString(),
      'EpicenterDepth': allData.EpicenterDepth.toString(),
      'Humidity': allData.Humidity.toString(),
      'WindDirectionId': allData.WindDirectionId.toString(),
      'WindSpeed': allData.WindSpeed.toString(),
      'SunRise': allData.SunRise.toString(),
      'NatureOfEpicenterId': allData.NatureOfEpicenterId.toString(),
      'SecoundCarpone': allData.SecoundCarpone.toString(),
      'FirstCarpone': allData.FirstCarpone.toString(),
      'WaterTemperature': allData.WaterTemperature.toString(),
      // 'ReportIndustrialActivitiesIds[0].IndustrialActivityId': '3',
      // 'ReportIndustrialActivitiesIds[0].Discription': 'test',
      // 'ReportIndustrialActivitiesIds[0].Distance': '12.2',
    });

    // for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
    //   request.fields["ReportIndustrialActivitiesIds[$i].IndustrialActivityId"] =
    //       "${allData.reportIndustrialActivitiesIds![reportActivityIds].industrialActivityId}";
    //   reportActivityIds++;
    // }
    // for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
    //   if (allData.reportIndustrialActivitiesIds![i].description == null) {
    //   } else {
    //     request.fields["ReportIndustrialActivitiesIds[$i].Discription"] =
    //         "${allData.reportIndustrialActivitiesIds![reportDescriptionIds].description}";
    //     reportDescriptionIds++;
    //   }
    // }
    // for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
    //   if (allData.reportIndustrialActivitiesIds![i].distance == null) {
    //   } else {
    //     request.fields["ReportIndustrialActivitiesIds[$i].Distance"] =
    //         "${allData.reportIndustrialActivitiesIds![reportDistanceIds].distance}";
    //     reportDistanceIds++;
    //   }
    // }
    // for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
    //   if (allData.reportIndustrialActivitiesIds![i].attachment == null) {
    //     print(allData.reportIndustrialActivitiesIds![i].attachment);
    //   } else {
    //     request.files.add(await http.MultipartFile.fromPath(
    //         'ReportIndustrialActivitiesIds[$i].Attachment',
    //         allData.reportIndustrialActivitiesIds![reportIndastrilAttachments]
    //                 .attachment!.path ??
    //             ""));
    //     reportIndastrilAttachments++;
    //   }
    // }

    for (int i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
      print(allData.reportIndustrialActivitiesIds![i].toJson());
      request.fields["ReportIndustrialActivitiesIds[$i].IndustrialActivityId"] =
          "${allData.reportIndustrialActivitiesIds![i].industrialActivityId}";
      reportActivityIds++;
      request.fields["ReportIndustrialActivitiesIds[$i].Discription"] =
          "${allData.reportIndustrialActivitiesIds![i].description}";
      reportDescriptionIds++;
      request.fields["ReportIndustrialActivitiesIds[$i].Distance"] =
          "${allData.reportIndustrialActivitiesIds![i].distance}";
      reportDistanceIds++;
      if (allData.reportIndustrialActivitiesIds![i].attachment == null) {
      } else {
        request.files.add(await http.MultipartFile.fromPath(
            'ReportIndustrialActivitiesIds[$i].Attachment',
            allData.reportIndustrialActivitiesIds![i].attachment!.path));
        reportIndastrilAttachments++;
      }
    }

    for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
      print(allData.reportSurroundingBuildingsIds![i].attachment);
      request.fields["ReportSurroundingBuildings[$i].SurroundingBuildingId"] =
          "${allData.reportSurroundingBuildingsIds![i].surroundingBuildingId}";
      reportSurroundingBuildingsIds++;
      request.fields["ReportSurroundingBuildings[$i].Distance"] =
          "${allData.reportSurroundingBuildingsIds![i].distance}";
      reportSurroundingBuildingsDistance++;
      if (allData.reportSurroundingBuildingsIds![i].attachment == null) {
      } else {
        request.files.add(await http.MultipartFile.fromPath(
            'ReportSurroundingBuildings[$i].Attachment',
            allData.reportSurroundingBuildingsIds![i].attachment!.path));
        reportSurrouningAttachments++;
      }
    }

    // if (allData.reportSurroundingBuildingsIds!.isNotEmpty) {
    //   for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
    //     if (allData.reportSurroundingBuildingsIds![i].attachment == null) {
    //     } else {
    //       request.files.add(await http.MultipartFile.fromPath(
    //           'ReportSurroundingBuildings[$i].Attachment',
    //           allData
    //               .reportSurroundingBuildingsIds![reportSurrouningAttachments]
    //               .attachment!
    //               .path));
    //       reportSurrouningAttachments++;
    //     }
    //   }
    //   for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
    //     request.fields["ReportSurroundingBuildings[$i].SurroundingBuildingId"] =
    //         "${allData.reportSurroundingBuildingsIds![reportSurroundingBuildingsIds].surroundingBuildingId}";
    //     reportSurroundingBuildingsIds++;
    //   }
    //
    //   for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
    //     if (allData.reportSurroundingBuildingsIds![i].distance == null) {
    //     } else {
    //       request.fields["ReportSurroundingBuildings[$i].Distance"] =
    //           "${allData.reportSurroundingBuildingsIds![reportSurroundingBuildingsDistance].distance}";
    //       reportSurroundingBuildingsDistance++;
    //     }
    //   }
    // } else {}

    for (var i = 0; i < allData.reportPolluationSourcesIds!.length; i++) {
      request.fields[
              "ReportPolluationSourcesIds[$reportPolluationSourcesIncrement]"] =
          "${allData.reportPolluationSourcesIds![i]}";
    }
    for (var i = 0; i < allData.photos!.length; i++) {
      request.files.add(
          await http.MultipartFile.fromPath('Photos', allData.photos![i].path));
    }
    for (var i = 0; i < allData.reportIndustrialActivitiesIds!.length; i++) {
      request.fields[
              "ReportIndustrialActivitiesIds[$industrialActivitiesIncrement]"] =
          "${allData.reportIndustrialActivitiesIds![i]}";
      industrialActivitiesIncrement++;
    }
    for (int i = 0; i < allData.IgnoriedPhotos!.length; i++) {
      request.files.add(http.MultipartFile.fromString(
          'IgnoriedPhotos', allData.IgnoriedPhotos![i].toString()));
    }

    for (var i = 0; i < allData.reportPotentialPollutantsIds!.length; i++) {
      request.fields[
              "ReportPotentialPollutantsIds[$reportPotentialPollutantsIncrement]"] =
          "${allData.reportPotentialPollutantsIds![i]}";
      reportPotentialPollutantsIncrement++;
    }
    for (var i = 0; i < allData.reportSurroundingBuildingsIds!.length; i++) {
      request.fields[
              "ReportSurroundingBuildingsIds[$reportSurroundingBuildingsIncrement]"] =
          "${allData.reportSurroundingBuildingsIds![i]}";
      reportSurroundingBuildingsIncrement++;
    }
    print(allData.ReportSemanticPollutionIds!.length);
    for (int i = 0; i < allData.ReportSemanticPollutionIds!.length; i++) {
      request.files.add(http.MultipartFile.fromString(
          'ReportSemanticPollutionIds[$reportSemanticPollutionIds]',
          allData.ReportSemanticPollutionIds![i].toString()));
      reportSemanticPollutionIds++;
    }
    for (int i = 0; i < allData.ReportSurroundedMediumIds!.length; i++) {
      request.files.add(http.MultipartFile.fromString(
          'ReportSurroundedMediumIds[$reportSurroundedMediumIds]',
          allData.ReportSurroundedMediumIds![i].toString()));
      reportSurroundedMediumIds++;
    }
    for (int i = 0; i < allData.ReportPlantIds!.length; i++) {
      request.files.add(http.MultipartFile.fromString(
          'ReportPlantIds[$reportPlantIds]',
          allData.ReportPlantIds![i].toString()));
      reportPlantIds++;
    }
    for (int i = 0; i < allData.ReportUndergroundWaterIds!.length; i++) {
      request.files.add(http.MultipartFile.fromString(
          'ReportUndergroundWaterIds[$reportUndergroundWaterIds]',
          allData.ReportUndergroundWaterIds![i].toString()));
      reportUndergroundWaterIds++;
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    print(response.reasonPhrase.toString());
    print(await response.stream.transform(utf8.decoder).join());

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      Get.defaultDialog(
        title: Constants.empty,
        middleText: AppStrings.update,
        // onConfirm: () => Get.offAll(() => HomeScreen()),
        // confirmTextColor: ColorManager.white,
        // buttonColor: ColorManager.primary,
        // backgroundColor: ColorManager.white,
        radius: 25,
        content: Column(
          children: [
            Lottie.asset('assets/images/sucess.json', height: 150),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorManager.primary
                    ,shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
              ),
                onPressed: () {
                  Get.offAll(() => HomeScreen());
                },
                child:  Text("تم الارسال بنجاح",style: TextStyle(color:ColorManager.white,fontSize: 16 ),))
          ],
        ),
      );
      // Get.offAll(() => HomeScreen());
      return 200;
    } else if (response.statusCode == 400) {
      Get.defaultDialog(
        title: "توجد مشكله فى الارسال",
        middleText: AppStrings.error,
        onConfirm: () => Get.offAll(() => HomeScreen()),
        confirmTextColor: ColorManager.white,
        buttonColor: ColorManager.error,
        backgroundColor: ColorManager.white,
      );
      print(response.statusCode);
      log("error 400 : ${response.reasonPhrase}");
      log("Response: $response");
      return 400;
    } else if (response.statusCode == 403) {
      Get.defaultDialog(
        title: "هذا المستخدم لايملك صلاحيه",
        middleText: AppStrings.error,
        onConfirm: () => Get.offAll(() => HomeScreen()),
        confirmTextColor: ColorManager.white,
        buttonColor: ColorManager.error,
        backgroundColor: ColorManager.white,
      );
      print(response.statusCode);
      return 403;
    } else if (response.statusCode == 500 ||
        response.statusCode == 501 ||
        response.statusCode == 504) {
      print(response.statusCode);
      return 500;
    }
  }

  newAdd() async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyZXBvcnRAcG9sbHV0ZWRzcG90cy5jb20iLCJqdGkiOiI3NTMxMzQzMy03N2RlLTQ1OTQtOGU3Zi1hYjQ4ZDRmMDQzZWEiLCJlbWFpbCI6InJlcG9ydEBwb2xsdXRlZHNwb3RzLmNvbSIsInVpZCI6ImM2Y2E4NGYzLTY1NzItNGVkNy05ZGQxLTA4ZDFhNTYxNDY0MCIsInJvbGVzIjoiRG9jdG9yIiwiZXhwIjoxNjczNDI4Njg5LCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.Wr73JkV6zZaAmS7ZEikx9_NfJXBh8iDrnq-creIZ3W8',
      'Cookie':
          '.AspNetCore.Identity.Application=CfDJ8Ib0eMiUryBIoeDqhv0ZpbBUm2P_KmZr83wjBpoLupQ7pn_DFXYLH7IyyvLOJIGOocgueFBF1I7_qRgCambY3cGu2-RixzZ1PD3DtxxF7PmGjScoWWY91L9fPBUPRN0l7LuoaGMdtZtV0ybaGy4gUpSDIQ6yO3c1KKJxVwSqzGoCIawXWHXhk1nVp95QDhOiQLiq1A5PpVrjyJomh9B6u3P13JB52wtwvW8Js9kXZG8G0M8FywdC0mHw2Yj68YSvCxyRlJIe7LvwTSH4u_6FcLmP9UKlaHwnq8CNRVEbIFii4SwkqZII0KruAWkExCKavzt5bgwVy7pCJNaAUt8GGPXhxnSxSne4ZvzhoAouKEecE1LizOtJinnNc7lHK9pY3_NXdHmViSzcpoGzOTXxVCGXsETni090-ckLTsvfjghVtZUQLEmKdGYbVa5p92r1We51KVLDYGF-67_neJ3qOf7Pz0-ndfoF3K6zMgP0JNX1zOYfcqZXOCmH86MdL0tzpjmuRxJ4AdpxxFyELlwsvF_Hf4OJKLJ_KVd2za37M0g3qbJA82wxkuVPYhcDOEcOqAy_-GkWorwnUxe-ot0jdj5wn63uVbVLp0AgT-JfnW57a9t1BxvUi_Q7GYlkeQKhoDT9YYGxpu7Gey7DCJpZPnzq_zyhc-YkX9iYPvROPtIxkorSx4HjSH0m9o0WkjYzmNZ2xxfHvn_DUPfTAxzBtS8-fL0QimBuOv0XugV5LOgsHAv9gXilH3HsxcJrRdcCXXnbnZDu8UWWmLDq7KFBGB6at1LBmp2K_d634HgJNWXbsWuftvsFrbRTeWElpyNaA94p53e9Ujzzao0NaoscI4LPIeNxGQya-a059PnxL49ndH_xclvV0pT1SrKLLcGKJA'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('https://environmentApp.afaqci.com/api/Reports/AddReport'));
    request.fields.addAll({
      'EpicenterId': '217',
      'ExtentOfPolluationDescription': 'test',
      'Lat': '02',
      'Long': '20.2',
      'HasResidentialArea': 'true',
      'HasVegetation': 'false',
      'HasGroundWater': 'true',
      'Temperature': '3',
      'Salinity': '24',
      'TotalDissolvedSolids': '4',
      'TotalSuspendedSolids': '23',
      'PH': '234',
      'Turbidity': '234',
      'ElectricalConnection': '123',
      'DissolvedOxygen': '123',
      'TotalOrganicCarbon': '123',
      'VolatileOrganicMatter': '1',
      'Ozone': '3',
      'AllKindsOfCarbon': '1',
      'NitrogenDioxide': '3',
      'SulfurDioxide': '3',
      'PM25': '3',
      'PM10': '3',
      'CityId': '1',
      'LandFormId': '1',
      'PollutantPlaceId': '1',
      'SurfaceWaterId': '1',
      'responsibleAuthorityId': '2',
      'Hardness': '30',
      'EpicenterLenght': '12',
      'EpicenterWidth': '12',
      'EpicenterDepth': '12',
      'Humidity': '12',
      'WindSpeed': '1',
      'SunRise': 'true',
      'NatureOfEpicenterId': '2',
      'WindDirectionId': '1',
      // 'ReportIndustrialActivitiesIds[0]': '2',
      'ReportIndustrialActivitiesIds[0].IndustrialActivityId': '3',
      'ReportIndustrialActivitiesIds[0].Discription': 'test',
      'ReportIndustrialActivitiesIds[0].Distance': '12.2',
      'ReportPotentialPollutantsIds[0]': '1',
      'ReportPotentialPollutantsIds[1]': '2',
      'ReportSurroundingBuildingsIds[0].SurroundingBuildingId': '2',
      'ReportSurroundingBuildings[0].Distance': '12.3',
      'VolatileOrganicMatter': '3',
      'ReportSurroundingBuildings[0].SurroundingBuildingId': '2',
      'ReportSemanticPollutionIds[0]': '2',
      'ReportSurroundedMediumIds[0]': '2',
      'ReportPlantIds[0]': '2',
      'ReportUndergroundWaterIds[0]': '2',
      'WaterTemperature': '12',
      'FirstCarpone': '12',
      'SecoundCarpone': '12',
      'ReportPolluationSourcesIds[0]': '1'
    });
    request.files.add(await http.MultipartFile.fromPath('Photos',
        '/C:/Users/afaq/Downloads/Image_created_with_a_mobile_phone.png'));
    request.files.add(await http.MultipartFile.fromPath(
        'ReportSurroundingBuildings[0].Attachment',
        '/C:/Users/afaq/Downloads/Image_created_with_a_mobile_phone.png'));
    request.files.add(await http.MultipartFile.fromPath(
        'ReportIndustrialActivitiesIds[0].Attachment',
        '/C:/Users/afaq/Downloads/Image_created_with_a_mobile_phone.png'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
