import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class InternetConnectionController extends GetxController {
  static InternetConnectionController to = Get.find();

  Future<bool> checkInternet() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    if (hasInternet == false) {
      // showSimpleNotification(
      //   const Text(
      //     "لا يوجد إتصال بالانترنت",
      //     style: TextStyle(color: Colors.white, fontSize: 20),
      //   ),
      //   background: Colors.red,
      // );
      print("nothasInternet");
      update();
      return false;
    }
    print("hasInternet");
    update();
    return true;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkInternet();
  }
}
