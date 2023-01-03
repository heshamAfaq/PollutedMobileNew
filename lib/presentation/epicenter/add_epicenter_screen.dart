import 'package:enivronment/app/shared_widgets/bubbled_loader_widget.dart';
import 'package:enivronment/app/shared_widgets/loader_widget.dart';
import 'package:enivronment/domain/model/polluation_sources/polluation_sources_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import '../../../app/shared_widgets/label_widget.dart';
import '../../../data/controller/epicenter/add_epicenter_controller.dart';
import '../../app/constants.dart';
import '../../data/network/add_epicenter_service.dart';
import '../../domain/model/epicenter/add_epicenter_model.dart';
import '../login/login_screen.dart';
import '../report/add_report_screen.dart';
import '../report/widget/report_divider_widget.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widgets/epicenter_map_widget.dart';

// ignore: must_be_immutable
class AddEpicenterScreen extends StatelessWidget {
  AddEpicenterScreen({
    Key? key,
  }) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController reasonCtrl = TextEditingController();
  TextEditingController epicenterSizeCtrl = TextEditingController();
  TextEditingController sizeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorManager.primary,
        ),
        title: Center(
          child: Text(
            "Add New HotSpot".tr,
            overflow: TextOverflow.clip,
            style: getBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s18),
          ),
        ),
      ),
      body: GetBuilder<AddEpicenterController>(
          init: AddEpicenterController(),
          builder: (epicenterCtrl) {
            return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! Description
                      LabelWidget(label: "Description ".tr),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p12,
                            right: AppPadding.p12,
                            top: AppPadding.p12),
                        child: TextFormField(
                          controller: descriptionCtrl,
                          keyboardType: TextInputType.text,
                          cursorColor: ColorManager.secondary,
                          style: TextStyle(color: ColorManager.secondary),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: AppSize.s2,
                                    color: ColorManager.secondary),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: AppSize.s2,
                                    color: ColorManager.secondary),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s12),
                              ),
                              labelText: "Description ".tr,
                              hintText: "Description ".tr,
                              hintStyle: TextStyle(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.grey),
                              labelStyle: TextStyle(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.secondary)),
                          onSaved: (val) {
                            epicenterCtrl.changeDescription(val);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Please enter Description".tr)));
                              return 'Please enter Description'.tr;
                            }
                            return null;
                          }, // enabledBorder: InputBorder.none,
                        ),
                      ),
                      //? divider
                      const ReportDividerWidget(),
                      //!Reason
                      LabelWidget(label: "Reason ".tr),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p12,
                            right: AppPadding.p12,
                            top: AppPadding.p12),
                        child: TextFormField(
                          controller: reasonCtrl,
                          keyboardType: TextInputType.text,
                          cursorColor: ColorManager.secondary,
                          style: TextStyle(color: ColorManager.secondary),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: AppSize.s2,
                                    color: ColorManager.secondary),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: AppSize.s2,
                                    color: ColorManager.secondary),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s12),
                              ),
                              labelText: "Reason ".tr,
                              hintText: "Reason ".tr,
                              hintStyle: TextStyle(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.grey),
                              labelStyle: TextStyle(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.secondary)),
                          onSaved: (val) {
                            epicenterCtrl.changeReason(val);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Please enter Reason".tr)));
                              return 'Please enter Reason'.tr;
                            }
                            return null;
                          }, // enabledBorder: InputBorder.none,
                        ),
                      ),

                      //? divider
                      const ReportDividerWidget(),
                      //! Epicenter Size
                      LabelWidget(label: "HotSpot Size".tr),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p12,
                            right: AppPadding.p12,
                            top: AppPadding.p12),
                        child: TextFormField(
                          controller: epicenterSizeCtrl,
                          keyboardType: TextInputType.number,
                          cursorColor: ColorManager.secondary,
                          style: TextStyle(color: ColorManager.secondary),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: AppSize.s2,
                                    color: ColorManager.secondary),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: AppSize.s2,
                                    color: ColorManager.secondary),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s12),
                              ),
                              labelText: "HotSpot Size".tr,
                              hintText: "HotSpot Size".tr,
                              hintStyle: TextStyle(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.grey),
                              labelStyle: TextStyle(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.secondary)),
                          onSaved: (val) {
                            epicenterCtrl.changeEpicenterSize(val);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Please enter HotSpot Size".tr)));
                              return 'Please enter HotSpot Size'.tr;
                            }
                            if (!value.isNum) {
                              return 'Please enter Valid HotSpot Size'.tr;
                            }
                            if (value.length >= 12) {
                              return 'Please enter Valid HotSpot Size'.tr;
                            }
                            return null;
                          }, // enabledBorder: InputBorder.none,
                        ),
                      ),
                      //? divider
                      const ReportDividerWidget(),

                      //! Location
                      LabelWidget(label: "Location".tr),
                      Obx(() => GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (ctx) => SizedBox(
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m2_5,
                                  child: ListView.builder(
                                      itemCount: epicenterCtrl.allregion.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            epicenterCtrl.regionId.value =
                                                epicenterCtrl
                                                    .allregion[index].id;
                                            epicenterCtrl.regionText.value =
                                                epicenterCtrl
                                                    .allregion[index].name;
                                            epicenterCtrl.getCities();
                                            Navigator.pop(context);
                                            // reportCtrl.onTapSelectedcity(
                                            //     ctx,
                                            //     reportCtrl.allGovernorate[index].id,
                                            //     reportCtrl.allGovernorate[index].name);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: AppPadding.p60,
                                                vertical: AppPadding.p16),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: SizeConfig.screenHeight! /
                                                  MediaSize.m12,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          BorderRadiusValues
                                                              .br10),
                                                  border: Border.all(
                                                      width: AppSize.s1,
                                                      color:
                                                          ColorManager.grey)),
                                              child: Text(
                                                  epicenterCtrl
                                                      .allregion[index].name,
                                                  style: getSemiBoldStyle(
                                                      color: ColorManager
                                                          .secondary)),
                                            ),
                                          ),
                                        );
                                      })),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p10),
                            margin: const EdgeInsets.only(
                                right: AppMargin.m30,
                                left: AppMargin.m30,
                                top: AppMargin.m20),
                            alignment: Alignment.centerRight,
                            height: SizeConfig.screenHeight! / MediaSize.m16,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: AppSize.s1, color: ColorManager.grey),
                              borderRadius:
                                  BorderRadius.circular(BorderRadiusValues.br5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(epicenterCtrl.regionText.value,
                                    textAlign: TextAlign.center,
                                    style: getSemiBoldStyle(
                                        color: ColorManager.secondary)),
                                const Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: ColorManager.secondary,
                                  size: AppSize.s30,
                                ),
                              ],
                            ),
                          ))),
                      Obx(() => epicenterCtrl.regionId.value != 0
                          ? GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => SizedBox(
                                          height: SizeConfig.screenHeight! /
                                              MediaSize.m2_5,
                                          child: Obx(() => epicenterCtrl
                                                  .loadCities.value
                                              ? const LoaderWidget()
                                              : ListView.builder(
                                                  itemCount: epicenterCtrl
                                                      .cities.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        epicenterCtrl
                                                                .cityId.value =
                                                            epicenterCtrl
                                                                .cities[index]
                                                                .id;
                                                        epicenterCtrl.cityText
                                                                .value =
                                                            epicenterCtrl
                                                                .cities[index]
                                                                .name;
                                                        Navigator.pop(context);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    AppPadding
                                                                        .p60,
                                                                vertical:
                                                                    AppPadding
                                                                        .p16),
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: SizeConfig
                                                                  .screenHeight! /
                                                              MediaSize.m12,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      BorderRadiusValues
                                                                          .br10),
                                                              border: Border.all(
                                                                  width: AppSize
                                                                      .s1,
                                                                  color:
                                                                      ColorManager
                                                                          .grey)),
                                                          child: Text(
                                                              epicenterCtrl
                                                                  .cities[index]
                                                                  .name,
                                                              style: getSemiBoldStyle(
                                                                  color: ColorManager
                                                                      .secondary)),
                                                        ),
                                                      ),
                                                    );
                                                  })),
                                        ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p10),
                                margin: const EdgeInsets.only(
                                    right: AppMargin.m30,
                                    left: AppMargin.m30,
                                    top: AppMargin.m20),
                                alignment: Alignment.centerRight,
                                height:
                                    SizeConfig.screenHeight! / MediaSize.m16,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: AppSize.s1,
                                      color: ColorManager.grey),
                                  borderRadius: BorderRadius.circular(
                                      BorderRadiusValues.br5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(epicenterCtrl.cityText.value,
                                        textAlign: TextAlign.center,
                                        style: getSemiBoldStyle(
                                            color: ColorManager.secondary)),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorManager.secondary,
                                      size: AppSize.s30,
                                    ),
                                  ],
                                ),
                              ))
                          : SizedBox()),
                      const ReportDividerWidget(),
                      //! Add images and preview images
                      Container(
                          width: double.infinity,
                          height: SizeConfig.screenHeight! / MediaSize.m7,
                          decoration: BoxDecoration(
                              color: ColorManager.lightGrey,
                              borderRadius: BorderRadius.circular(
                                  BorderRadiusValues.br8)),
                          child: Row(
                            children: [
                              //! preview images
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: AppMargin.m8,
                                      horizontal: AppMargin.m12),
                                  child: ListView.builder(
                                      itemCount:
                                          epicenterCtrl.imagesList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: AppMargin.m8,
                                              horizontal: AppMargin.m8),
                                          width: SizeConfig.screenWidth! /
                                              MediaSize.m5,
                                          height: SizeConfig.screenWidth! /
                                              MediaSize.m8,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: FileImage(epicenterCtrl
                                                      .imagesList[index]),
                                                  fit: BoxFit.cover),
                                              color: ColorManager.black,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      BorderRadiusValues.br5)),
                                        );
                                      }),
                                ),
                              ),
                              //! Add Icon
                              InkWell(
                                onTap: () {
                                  epicenterCtrl.pickImagesFormGallery();
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: AppMargin.m8),
                                  width: SizeConfig.screenWidth! / MediaSize.m8,
                                  height:
                                      SizeConfig.screenWidth! / MediaSize.m8,
                                  decoration: BoxDecoration(
                                      color: ColorManager.secondary,
                                      borderRadius: BorderRadius.circular(
                                          BorderRadiusValues.br5)),
                                  child: Icon(
                                    Icons.add_photo_alternate,
                                    color: ColorManager.white,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      //? divider
                      const ReportDividerWidget(),
                      //! Polluation Sources
                      // const ReportPolluationSourcesWidget(),
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Obx(
                            () => MultiSelectDialogField(
                              confirmText: Text(
                                'ok'.tr,
                                style: getSemiBoldStyle(
                                    color: ColorManager.secondary),
                                overflow: TextOverflow.fade,
                              ),
                              cancelText: Text(
                                'cancel'.tr,
                                style: getSemiBoldStyle(
                                    color: ColorManager.secondary),
                                overflow: TextOverflow.fade,
                              ),
                              items: epicenterCtrl.items.value,
                              title: epicenterCtrl.loading.value == true
                                  ? const BubbleLoader()
                                  : Text("polluted medium".tr),
                              selectedColor: ColorManager.secondary,
                              decoration: BoxDecoration(
                                color: ColorManager.secondary
                                    .withOpacity(OpicityValue.o1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(BorderRadiusValues.br10)),
                                border: Border.all(
                                  color: ColorManager.secondary,
                                  width: AppSize.s2,
                                ),
                              ),
                              buttonIcon: Icon(
                                Icons.list,
                                color: ColorManager.secondary,
                              ),
                              buttonText: Text(
                                "polluted medium".tr,
                                style: getSemiBoldStyle(
                                    color: ColorManager.secondary),
                              ),
                              onConfirm:
                                  (List<PolluationSourcesModel> results) {
                                epicenterCtrl.getSelectedData(results);
                              },
                            ),
                          )),
                      //? divider
                      const ReportDividerWidget(),
                      //! Add Location
                      InkWell(
                        onTap: () {
                          Get.to(() => const EpiCenterMapScreen());
                        },
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: SizeConfig.screenHeight! / MediaSize.m15,
                            decoration: BoxDecoration(
                                color: ColorManager.secondary,
                                borderRadius: BorderRadius.circular(
                                    BorderRadiusValues.br8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: ColorManager.white,
                                ),
                                Text(
                                  "Add HotSpot Location".tr,
                                  style: getSemiBoldStyle(
                                      color: ColorManager.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => epicenterCtrl.send.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.lightPrimary,
                              ),
                            )
                          : InkWell(
                              focusColor: ColorManager.primary,
                              highlightColor: ColorManager.error,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  if (epicenterCtrl.cityId.value == 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('please enter city'.tr)));
                                  }
                                  if (epicenterCtrl.imagesList == []) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'please enter HotSpot Images'
                                                    .tr)));
                                  }
                                  if (epicenterCtrl
                                      .polluationSourcesIds.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'please enter Polluation Sources'
                                                    .tr)));
                                  }
                                  if (epicenterCtrl.markLat.value ==
                                          Constants.emptyDouble &&
                                      epicenterCtrl.markLong.value ==
                                          Constants.emptyDouble) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'please choose location of HotSpot'
                                                    .tr)));
                                  } else {
                                    epicenterCtrl.send.value = true;
                                    print(descriptionCtrl.text);
                                    print(epicenterCtrl.imagesList);
                                    print(epicenterCtrl.markLat);
                                    print(epicenterCtrl.markLong);
                                    print(epicenterSizeCtrl.text);
                                    print(epicenterCtrl.cityId.value);
                                    print(epicenterCtrl.polluationSourcesIds);
                                    AddEpicenterService.sendEpicenter(
                                            allData: AddEpicenterModel(
                                                description:
                                                    descriptionCtrl.text,
                                                photos:
                                                    epicenterCtrl.imagesList,
                                                lat:
                                                    epicenterCtrl.markLat.value,
                                                long: epicenterCtrl
                                                    .markLong.value,
                                                reason: reasonCtrl.text,
                                                size: epicenterSizeCtrl.text,
                                                cityId:
                                                    epicenterCtrl.cityId.value,
                                                polluationSourcesIds:
                                                    epicenterCtrl
                                                        .polluationSourcesIds))
                                        .then((res) {
                                      if (res.runtimeType == String) {
                                        epicenterCtrl.loading.value = false;
                                        Get.defaultDialog(
                                          title: AppStrings.sucuss,
                                          barrierDismissible: false,
                                          middleText:"continue to add report".tr,
                                          onConfirm: () =>
                                              Get.offAll(() => AddReportScreen(
                                                    epicenterId: int.parse(res),
                                                  )),
                                          confirmTextColor: ColorManager.white,
                                          buttonColor: ColorManager.primary,
                                          backgroundColor: ColorManager.white,
                                        );
                                      } else if (res == 400) {
                                        epicenterCtrl.loading.value = false;
                                        Get.defaultDialog(
                                          barrierDismissible: false,
                                          title: AppStrings.error,
                                          middleText: AppStrings.errorMsg,
                                          onConfirm: () => Get.back(),
                                          confirmTextColor: ColorManager.white,
                                          buttonColor: ColorManager.error,
                                          backgroundColor: ColorManager.white,
                                        );
                                      } else if (res == 401) {
                                        Get.offAll(() => const LoginScreen());
                                      } else if (res == 500) {
                                        //!Server Error
                                        epicenterCtrl.loading.value = false;
                                        Get.defaultDialog(
                                          title: AppStrings.serverErrorTitle,
                                          middleText: AppStrings.serverError,
                                          onConfirm: () => Get.back(),
                                          confirmTextColor: ColorManager.white,
                                          buttonColor: ColorManager.error,
                                          backgroundColor: ColorManager.white,
                                        );
                                      }
                                    });
                                    epicenterCtrl.send.value = false;
                                  }
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: MediaSize.m50,
                                color: ColorManager.primary,
                                child: Text(
                                  'Confirm Adding HotSpot'.tr,
                                  style: getLightStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ))
                    ],
                  ),
                ));
          }),
    );
  }
}
