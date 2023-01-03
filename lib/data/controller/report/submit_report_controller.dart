import 'dart:developer';
import 'dart:io';
import 'package:enivronment/domain/model/polluation_sources/polluation_sources_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/constants.dart';
import '../../../app/current_location_controller.dart';
import '../../../domain/model/report/add_report_model.dart';
import '../../../presentation/Home/home_screen.dart';
import '../../../presentation/login/login_screen.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/add_report_service.dart';
import '../land_form/land_form_controller.dart';
import '../polluation_sources/polluation_sources_controller.dart';
import '../pollutant_place/pollutant_place_controller.dart';
import '../pollutant_reactivities/pollutant_reactivities_controller.dart';
import '../potential_pollutants/potential_pollutants_controller.dart';
import '../report_industrial_activites/get_industrial_activities_controller.dart';
import '../report_industrial_polluation_source/industrial_polluation_source_controller.dart';
import '../surface_water/surface_water_controller.dart';
import '../surrounding_buildings/surrounding_buildings_controller.dart';
import '../weather/weather_controller.dart';
import 'ground_water_controller.dart';
import 'residential_area_controller.dart';
import 'vegetation_controller.dart';

class SubmitReportController extends GetxController {
  RxBool loading = true.obs;

  //! Controllers
  CurrentLocationController location = Get.put(CurrentLocationController());
  ResidentialAreaRadioController resCtrl =
      Get.put(ResidentialAreaRadioController());
  VegetationRadioController vegCtrl = Get.put(VegetationRadioController());
  GroundWaterRadioController groundCtrl = Get.put(GroundWaterRadioController());

  AllLandFormController landFormCtrl = Get.put(AllLandFormController());
  AllPollutantReactivitiesController pollutantReactivitiesCtrl =
      Get.put(AllPollutantReactivitiesController());
  PollutantPlaceController pollutantPlaceCtrl =
      Get.put(PollutantPlaceController());
  SurfaceWaterController surfaceWaterCtrl = Get.put(SurfaceWaterController());
  WeatherController weatherCtrl = Get.put(WeatherController());
  AllIndustrialActivitiesController industrialActivitiesCtrl =
      Get.put(AllIndustrialActivitiesController());
  AllIndustrialPolluationSourceController industrialPolluationSourceCtrl =
      Get.put(AllIndustrialPolluationSourceController());
  AllPolluationSourcesController polluationSourcesCtrl =
      Get.put(AllPolluationSourcesController());

  AllPotentialPollutantsController potentialPollutantsCtrl =
      Get.put(AllPotentialPollutantsController());

  AllSurroundingBuildingsController surroundingBuildingsCtrl =
      Get.put(AllSurroundingBuildingsController());


}
