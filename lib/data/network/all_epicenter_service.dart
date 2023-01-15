import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:enivronment/domain/model/EpicintersModel.dart';
import 'package:enivronment/domain/model/ReportModel.dart';
import 'package:enivronment/domain/model/ReportsModels.dart';
import 'package:enivronment/rejon_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../domain/model/epicenter/epicenter_model.dart';
import '../../domain/model/epicenter_model.dart';
import '../../presentation/login/login_screen.dart';

class AllEpicenterServices {
  DioCacheManager? _dioCacheManager;
  final _dio = Dio(BaseOptions(
    baseUrl: Constants.baseUrl,
    headers: {
      "Content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
      'lang': Get.locale!.languageCode
    },
  ));

  static Future getAllEpicenter(int pageNum, int regionId) async {
    http.Response res = await http.get(
      Uri.parse(
          '${Constants.baseUrl}/Epicenters/GetAllEpicenters?page=$pageNum&pageSize=10&regionId=$regionId'),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );
    print(res.body);

    if (res.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(res.body)['epicenters'];
      String totalItem = jsonDecode(res.body)['count'];

      List<EpicenterDataModel> epicenters = jsonData.map((element) {
        return EpicenterDataModel.fromJson(element);
      }).toList();
      // return epicenters;
      return [epicenters, totalItem];
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

  getEpicenters(
      {int? pageNum,
      int? regionId,
      int? status,
      String? startDate,
      String? endDate,
      String? name,
      int? id,
      int? pageSize}) async {
    http.Response res = await http.get(
      Uri.parse(
        '${Constants.baseUrl}/Epicenters/GetAllEpicenters?page=$pageNum&pageSize=$pageSize&regionId=$regionId&status=$status&id=$id&startDate=$startDate&endDate=$endDate',
      ),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );
    print(res.statusCode);

    print("Epicent");
    print(res.body);
    if (res.statusCode == 200) {
      var prefs = await SharedPreferences.getInstance();
      EpicintersModel model = EpicintersModel.fromJson(jsonDecode(res.body));
      print(model.toJson());
      String encodedMap = json.encode(model);
      prefs.setString(Constants.epcinters, encodedMap);

      return model;
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

  searchEpcinters(
      {String? startDate,
      String? endDate,
      String? name = '',
      int? status,
      int? id}) async {
    print(name);
    print(id);
    http.Response res = await http.get(
      Uri.parse(
        '${Constants.baseUrl}/Epicenters/GetAllEpicenters?id=$id&descripton=$name&page=1&pageSize=40&startDate=$startDate&endDate=$endDate&status=$status',
      ),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );
    print(res.statusCode);

    print("Epicent");
    print(res.body);
    if (res.statusCode == 200) {
      EpicintersModel model = EpicintersModel.fromJson(jsonDecode(res.body));
      print(model.toJson());
      return model;
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

  searchEpcintersById(
      {String? startDate, String? endDate, int? status, int? id}) async {
    print(id);
    http.Response res = await http.get(
      Uri.parse(
        '${Constants.baseUrl}/Epicenters/GetAllEpicenters?id=$id&page=1&pageSize=40&startDate=$startDate&endDate=$endDate&status=$status',
      ),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );
    print(res.statusCode);

    print("Epicent");
    print(res.body);
    if (res.statusCode == 200) {
      EpicintersModel model = EpicintersModel.fromJson(jsonDecode(res.body));
      print(model.toJson());
      return model;
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

  getEpicentersCaching({int? pageNum, int? regionId, int? status}) async {
    _dioCacheManager = DioCacheManager(CacheConfig());
    Options _cacheOptions = buildCacheOptions(Duration(days: 7));
    _dio.interceptors.add(_dioCacheManager!.interceptor);
    final res = await _dio.get(
        "/Epicenters/GetAllEpicenters?page=$pageNum&pageSize=10&regionId=$regionId&status=$status",
        options: _cacheOptions);

    print("Kadouraaaaaaaaaaa");
    print(res.data);

    if (res.statusCode == 200) {
      print(res.data);

      EpicintersModel model = EpicintersModel.fromJson(res.data);
      return model;
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

  Future<List<ReportsModels>?> getReports(int id) async {
    try {
      http.Response res = await http.get(
        Uri.parse("${Constants.baseUrl}/Reports/getallreport/$id"),
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
        final mList = List<ReportsModels>.from(
            jsonDecode(res.body).map((i) => ReportsModels.fromJson(i)));

        return mList;
      }
    } catch (e) {}
    return null;
  }

  getEpicentersbyId(int id) async {
    http.Response res = await http.get(
      Uri.parse('${Constants.baseUrl}/Epicenters/GetEpicenter/$id'),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );

    print("Epicent");
    print(res.body);
    if (res.statusCode == 200) {
      ReportModel model = ReportModel.fromJson(jsonDecode(res.body));
      print(model.toJson());
      return model;
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
