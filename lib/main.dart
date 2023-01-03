import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'app/app.dart';
import 'app/app_prefs.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await GetStorage.init();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);

  runApp(MyApp());
}
