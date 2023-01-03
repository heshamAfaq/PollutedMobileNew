import 'package:enivronment/rejon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/internet_connectivity_controller.dart';
import '../../../domain/model/epicenter/epicenter_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/region_service.dart';

class RegionController extends GetxController {
  RxBool loading = true.obs;
  RxString regionText = 'Region'.tr.obs;
  RxInt regionId = 0.obs;
  InternetController net = Get.find<InternetController>();
  final allregion = <CitiesModel>[].obs;
  final servicess = RegionService();

  void onTapSelected(BuildContext con, int id, String name) {
    regionId.value = id;
    Navigator.pop(con);
    regionText.value = name;
    update();
  }

 //  List<RegionModel> allregion = [];
  @override
  Future<void> onInit() async {
     //getAllRegion();
    super.onInit();
    allregion.value = (await servicess.getRegion())!;
  }

  // void getAllRegion() {
  //   net.checkInternet().then((value) {
  //     if (value) {
  //       RegionService.getRegion().then((res) {
  //         //! success
  //         if (res.runtimeType == List<RegionModel>) {
  //           loading.value = false;
  //           allregion = res;
  //         } else if (res == 500) {
  //           //!Server Error
  //           loading.value = false;
  //           Get.defaultDialog(
  //             title: AppStrings.serverErrorTitle,
  //             middleText: AppStrings.serverError,
  //             onConfirm: () => Get.back(),
  //             confirmTextColor: ColorManager.white,
  //             buttonColor: ColorManager.error,
  //             backgroundColor: ColorManager.white,
  //           );
  //         } else if (res == 400) {
  //           loading.value = false;
  //           Get.defaultDialog(
  //             title: AppStrings.error,
  //             middleText: AppStrings.errorMsg,
  //             onConfirm: () => Get.back(),
  //             confirmTextColor: ColorManager.white,
  //             buttonColor: ColorManager.error,
  //             backgroundColor: ColorManager.white,
  //           );
  //         }
  //       });
  //     }
  //   });
  // }
}
