import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../domain/model/epicenter/epicenter_model.dart';
import '../../presentation/login/login_screen.dart';
import '../../rejon_model.dart';
import '../../responsible_model.dart';

class RegionService {
  Future<List<CitiesModel>?> getRegion() async {
    try {
      http.Response res = await http.get(
        Uri.parse(Constants.regionEndPoint),
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

  Future<List<CitiesModel>?> geCities(int id) async {
    try {
      http.Response res = await http.get(
        Uri.parse("${Constants.governorateEndPoint}/$id"),
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

  Future<List<ResponsibleAuthoritiesModel>?> getResponsible() async {
    try {
      http.Response res = await http.get(
        Uri.parse(
            "${Constants.baseUrl}/ResponsibleAuthorities/GetAllResponsibleAuthorities"),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
          'lang': Get.locale!.languageCode
        },
      );

      print(res.body);
      print("akdoura");
      if (res.statusCode == 200) {
        print(res.body);
        final mList = List<ResponsibleAuthoritiesModel>.from(
            jsonDecode(res.body)
                .map((i) => ResponsibleAuthoritiesModel.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  static Future getGovernorate(int regionId) async {
    http.Response res = await http.get(
      Uri.parse("${Constants.governorateEndPoint}/$regionId"),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(res.body);

      List<GovernorateModel> governorate = jsonData.map((element) {
        return GovernorateModel.fromJson(element);
      }).toList();

      return governorate;
    } else if (res.statusCode == 401 || res.statusCode == 403) {
      Get.offAll(() => const LoginScreen());
    } else if (res.statusCode == 500 ||
        res.statusCode == 501 ||
        res.statusCode == 504 ||
        res.statusCode == 502) {
      return 500;
    }
    return 400;
  }
}
