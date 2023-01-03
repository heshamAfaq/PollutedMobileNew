import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final box = GetStorage();

  /// write The local storage
  saveLocalStorage(String path) async {
    await box.write('lang', path);
  }

  /// read the local storage
  Future<String> get readLocalStorage async {
    return await box.read('lang') ?? "ar";
  }
}
// import 'package:get_storage/get_storage.dart';
//
// class LocaleStorage {
//   /// write
//   void saveLangToDisk(String? lang) async {
//     await GetStorage().write('lang', lang);
//   }
//
//   /// read
//   Future<String> get langSelected async {
//     return await GetStorage().read('lang')??'ar';
//   }
// }
