import 'package:enivronment/data/network/region_service.dart';
import 'package:enivronment/rejon_model.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../domain/model/polluation_sources/polluation_sources_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/polluation_sources_service.dart';

class AllPolluationSourcesController extends GetxController {
  List<int> polluationSourcesIds = [];
  RxBool loading = true.obs;
  List<PolluationSourcesModel> allPolluationSources = [];
  List<MultiSelectItem<PolluationSourcesModel>> items = [];
  final regionText = 'Region'.tr.obs;
  final cityText = 'Cities'.tr.obs;
  final regionId = 0.obs;
  final cityId = 0.obs;
  final allregion = <CitiesModel>[].obs;
  final cities = <CitiesModel>[].obs;
  final servicess = RegionService();
  getCities() async {
    cities.value = (await servicess.geCities(regionId.value))!;
  }
  @override
  Future<void> onInit() async {
    getAllPolluationSources();
    allregion.value = (await servicess.getRegion())!;
    super.onInit();
  }

  void getAllPolluationSources() {
    PolluationSourcesServices.getPolluationSources().then((res) {
      //! success
      if (res.runtimeType == List<PolluationSourcesModel>) {
        loading.value = false;
        allPolluationSources = res;
        items = allPolluationSources
            .map((polluationSource) => MultiSelectItem<PolluationSourcesModel>(
                polluationSource, polluationSource.name))
            .toList();
      } else if (res == 500) {
        //!Server Error
        loading.value = false;
        Get.defaultDialog(
          title: AppStrings.serverErrorTitle,
          middleText: AppStrings.serverError,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      } else if (res == 400) {
        loading.value = false;
        Get.defaultDialog(
          title: AppStrings.error,
          middleText: AppStrings.errorMsg,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      }
    });
  }

   getSelectedData(List<PolluationSourcesModel> dataList) {
    for (var data in dataList) {
      polluationSourcesIds.add(data.id);
      print(polluationSourcesIds.length);
    }
    update();
  }
}
