import 'dart:ui';
import 'package:enivronment/app/localization/local_storage/local_storage.dart';
import 'package:get/get.dart';

class AppLanguage extends GetxController {
  LocalStorage localStorage = LocalStorage();
  var appLocal = 'ar';

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    appLocal = await localStorage.readLocalStorage;
    Get.updateLocale(Locale(appLocal));
    update();
  }

  changeLanguage(String language) async {
    if (language == 'ar') {
      appLocal = 'ar';
      localStorage.saveLocalStorage("ar");
    } else {
      appLocal = 'en';
      localStorage.saveLocalStorage("en");
    }
    update();
  }
}
// // ignore_for_file: unnecessary_null_comparison
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import 'local_storage/local_storage.dart';
//
// class AppLanguage extends GetxController {
//   var appLocale = 'ar'.obs;
//   LocaleStorage localStorage = LocaleStorage();
//
//   @override
//   void onInit() async {
//     super.onInit();
//     await localStorage.langSelected == null
//         ? appLocale.value = 'ar'
//         : appLocale.value = await localStorage.langSelected;
//     Get.updateLocale(Locale(appLocale.value));
//     update();
//   }
//
//   void changeLanguage(String? type) async {
//     LocaleStorage localStorage = LocaleStorage();
//
//     if (appLocale.value == type) {
//       return;
//     }
//     if (type == 'ar') {
//       appLocale.value = 'ar';
//       localStorage.saveLangToDisk('ar');
//     } else {
//       appLocale.value = 'en';
//       localStorage.saveLangToDisk('en');
//     }
//     update();
//   }
// }
