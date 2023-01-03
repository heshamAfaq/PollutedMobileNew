import 'package:enivronment/app/constants.dart';
import 'package:enivronment/domain/model/ReportModel.dart';
import 'package:enivronment/domain/model/polluation_sources/polluation_sources_model.dart';
import 'package:enivronment/domain/model/report_industrial_activities/report_industrial_activities_model.dart';
import 'package:enivronment/presentation/widget/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import '../../app/shared_widgets/bubbled_loader_widget.dart';
import '../../app/shared_widgets/label_widget.dart';
import '../../data/controller/report/add_report_controller.dart';
import '../../domain/model/potential_pollutants/potential_pollutants_model.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widget/report_divider_widget.dart';
import 'widget/report_text_field_widget.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({Key? key, this.epicenterId}) : super(key: key);

  final int? epicenterId;

  // final int? status;

  // final int? reportId;
  // final Epicenters? report;
  // final ReportModel? report;

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController controllerEpcinter = TextEditingController();

  TextEditingController controllerPolutionSize = TextEditingController();
  TextEditingController controllerotherNote = TextEditingController();
  TextEditingController controllertempreture = TextEditingController();
  TextEditingController controllerSunrise = TextEditingController();
  TextEditingController controllerWindspeed = TextEditingController();
  TextEditingController controllerrelativehumidity = TextEditingController();
  TextEditingController controllersalinity = TextEditingController();
  TextEditingController controlletotalSuspendedSolids = TextEditingController();
  TextEditingController controllepH = TextEditingController();
  TextEditingController controlleturbidity = TextEditingController();
  TextEditingController controlleelectricalConnection = TextEditingController();
  TextEditingController controllerdissolvedOxygen = TextEditingController();
  TextEditingController controllertotalOrganicCarbon = TextEditingController();
  TextEditingController controllerozone = TextEditingController();
  TextEditingController controllerallKindsOfCarbon = TextEditingController();
  TextEditingController controllernitrogenDioxide = TextEditingController();
  TextEditingController controllersulfurDioxide = TextEditingController();
  TextEditingController controllerpM25 = TextEditingController();
  TextEditingController controllerpM10 = TextEditingController();
  TextEditingController controllerHardness = TextEditingController();
  TextEditingController controllerAcidity = TextEditingController();
  TextEditingController controllerWaterTemperature = TextEditingController();
  TextEditingController controllerFirstCarpone = TextEditingController();
  TextEditingController controllerSecoundCarpone = TextEditingController();
  TextEditingController controllerWidth = TextEditingController();
  TextEditingController controllerHeight = TextEditingController();
  TextEditingController controllerDepth = TextEditingController();
  TextEditingController controllerVolume = TextEditingController();
  TextEditingController controllervolatileOrganicMatter =
      TextEditingController();
  TextEditingController controllertotalDissolvedSolids =
      TextEditingController();
  final reportCtrl = Get.put(AddReportController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorManager.primary,
        ),
        title: Center(
          child: Text(
            "Add Report".tr,
            overflow: TextOverflow.clip,
            style: getBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s18),
          ),
        ),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LabelWidget(label: "HotSpot Size".tr),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: AppPadding.p12,
                //       right: AppPadding.p12,
                //       top: AppPadding.p12),
                //   child: TextFormField(
                //     controller: controllerEpcinter,
                //     keyboardType: TextInputType.number,
                //     cursorColor: ColorManager.secondary,
                //     style: TextStyle(color: ColorManager.secondary),
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(
                //           borderSide: BorderSide(
                //               width: AppSize.s2, color: ColorManager.secondary),
                //           borderRadius: BorderRadius.circular(AppSize.s12),
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(
                //               width: AppSize.s2, color: ColorManager.secondary),
                //           borderRadius: BorderRadius.circular(AppSize.s12),
                //         ),
                //         hintStyle: TextStyle(
                //             fontSize: FontSize.s12,
                //             fontWeight: FontWeight.bold,
                //             color: ColorManager.grey),
                //         labelStyle: TextStyle(
                //             fontSize: FontSize.s12,
                //             fontWeight: FontWeight.bold,
                //             color: ColorManager.secondary)),
                //     onChanged: (val) async {
                //       reportCtrl.epicenterSize.value = double.parse(val);
                //       print(reportCtrl.epicenterSize.value);
                //     },
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //             content: Text("Please enter HotSpot Size".tr)));
                //         return 'Please enter HotSpot Size'.tr;
                //       }
                //       if (!value.isNum) {
                //         return 'Please enter Valid HotSpot Size'.tr;
                //       }
                //       if (value.length >= 12) {
                //         return 'Please enter Valid HotSpot Size'.tr;
                //       }
                //       return null;
                //     }, // enabledBorder: InputBorder.none,
                //   ),
                // ),
                // //? divider
                // const ReportDividerWidget(),
                //!Polluation Size
                // LabelWidget(label: "Polluation Size".tr),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: AppPadding.p12,
                //       right: AppPadding.p12,
                //       top: AppPadding.p12),
                //   child: TextFormField(
                //     controller: controllerPolutionSize,
                //     keyboardType: TextInputType.number,
                //     cursorColor: ColorManager.secondary,
                //     style: TextStyle(color: ColorManager.secondary),
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(
                //           borderSide: BorderSide(
                //               width: AppSize.s2,
                //               color: ColorManager.secondary),
                //           borderRadius:
                //               BorderRadius.circular(AppSize.s12),
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(
                //               width: AppSize.s2,
                //               color: ColorManager.secondary),
                //           borderRadius:
                //               BorderRadius.circular(AppSize.s12),
                //         ),
                //         hintStyle: TextStyle(
                //             fontSize: FontSize.s12,
                //             fontWeight: FontWeight.bold,
                //             color: ColorManager.grey),
                //         labelStyle: TextStyle(
                //             fontSize: FontSize.s12,
                //             fontWeight: FontWeight.bold,
                //             color: ColorManager.secondary)),
                //     onChanged: (val) {
                //       reportCtrl.polluationSize.value =
                //           double.parse(val);
                //       reportCtrl.changePolluationSize(val);
                //       print(reportCtrl.polluationSize.value);
                //     },
                //
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         ScaffoldMessenger.of(context).showSnackBar(
                //             SnackBar(
                //                 content: Text(
                //                     "Please enter Polluation Size"
                //                         .tr)));
                //         return 'Please enter Polluation Size'.tr;
                //       }
                //       if (!value.isNum) {
                //         return 'Please enter Valid Polluation Size'.tr;
                //       }
                //       if (value.length >= 12) {
                //         return 'Please enter Valid Polluation Size'.tr;
                //       }
                //       return null;
                //     }, // enabledBorder: InputBorder.none,
                //   ),
                // ),
                LabelWidget(label: "Is there Residential Area ?".tr),
                Row(
                  children: [
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: true,
                              groupValue: reportCtrl.residentialArea.value,
                              toggleable: true,
                              activeColor: ColorManager.secondary,
                              onChanged: (bool? v) {
                                reportCtrl.addPlaces(v!);
                                print(v);
                              },
                            )),
                        Text(
                          'yes'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: false,
                              groupValue: reportCtrl.residentialArea.value,
                              toggleable: true,
                              activeColor: ColorManager.secondary,
                              onChanged: (bool? v) {
                                reportCtrl.addPlaces(v!);
                                print(v);
                              },
                            )),
                        Text(
                          'no'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                      ],
                    )
                  ],
                ),
                LabelWidget(label: "Sun rise".tr),
                Row(
                  children: [
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: true,
                              groupValue: reportCtrl.sunRise.value,
                              toggleable: true,
                              activeColor: ColorManager.secondary,
                              onChanged: (bool? v) {
                                reportCtrl.addSunRise(v ?? false);
                                print(v);
                              },
                            )),
                        Text(
                          'yes'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: false,
                              groupValue: reportCtrl.sunRise.value,
                              toggleable: true,
                              activeColor: ColorManager.secondary,
                              onChanged: (bool? v) {
                                reportCtrl.addSunRise(v ?? false);
                                print(v);
                              },
                            )),
                        Text(
                          'no'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                      ],
                    )
                  ],
                ),

                //? divider
                const ReportDividerWidget(),
                //!vegetation
                LabelWidget(label: "Is there vegetation?".tr),
                Row(
                  children: [
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: true,
                              groupValue: reportCtrl.plants.value,
                              toggleable: true,
                              activeColor: ColorManager.secondary,
                              onChanged: (bool? v) {
                                reportCtrl.addVeg(v!);
                                print(v);
                              },
                            )),
                        Text(
                          'yes'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: false,
                              groupValue: reportCtrl.plants.value,
                              toggleable: true,
                              activeColor: ColorManager.secondary,
                              onChanged: (bool? v) {
                                reportCtrl.addVeg(v!);
                                print(v);
                              },
                            )),
                        Text(
                          'no'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                      ],
                    )
                  ],
                ),
                Obx(() => reportCtrl.plants.value == true
                    ? Obx(() => GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (ctx) => SizedBox(
                                height:
                                    SizeConfig.screenHeight! / MediaSize.m2_5,
                                child: ListView.builder(
                                    itemCount: reportCtrl.plantList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          reportCtrl.plantText.value =
                                              reportCtrl.plantList[index].name;
                                          reportCtrl.plantId.value =
                                              reportCtrl.plantList[index].id;
                                          Navigator.pop(context);
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
                                                    color: ColorManager.grey)),
                                            child: Row(
                                              children: [
                                                Obx(() => Checkbox(
                                                    activeColor:
                                                        ColorManager.primary,
                                                    value: reportCtrl
                                                        .plantListList[index],
                                                    onChanged: (v) {
                                                      reportCtrl.plantListList[
                                                          index] = v;
                                                      reportCtrl.plantId.value =
                                                          reportCtrl
                                                              .plantList[index]
                                                              .id;
                                                      reportCtrl.addPlantList(
                                                          index,
                                                          reportCtrl.plantId
                                                                  .value =
                                                              reportCtrl
                                                                  .plantList[
                                                                      index]
                                                                  .id);
                                                      print(v);
                                                    })),
                                                Flexible(
                                                  child: Text(
                                                      reportCtrl
                                                          .plantList[index]
                                                          .name,
                                                      style: getSemiBoldStyle(
                                                          color: ColorManager
                                                              .secondary)),
                                                ),
                                              ],
                                            ),
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
                          child: reportCtrl.load.value
                              ? const BubbleLoader()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(reportCtrl.plantText.value,
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
                        )))
                    : const SizedBox()),

                Obx(() =>
                    reportCtrl.plantsList.isNotEmpty && reportCtrl.plants.isTrue
                        ? SizedBox(
                            height: 45,
                            child: ListView.builder(
                              itemCount: reportCtrl.plantsList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) => Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorManager.secondary
                                          .withOpacity(OpicityValue.o3)),
                                  child: Center(
                                    child: Text(reportCtrl.plantsList[index],
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox()),
                const ReportDividerWidget(),

                //!ground water
                LabelWidget(label: "Is there ground water ?".tr),
                Row(
                  children: [
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: true,
                              groupValue: reportCtrl.underGround.value,
                              toggleable: true,
                              activeColor: ColorManager.secondary,
                              onChanged: (bool? v) {
                                reportCtrl.addUnderGround(v!);
                                print(v);
                              },
                            )),
                        Text(
                          'yes'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: false,
                              groupValue: reportCtrl.underGround.value,
                              toggleable: true,
                              activeColor: ColorManager.secondary,
                              onChanged: (bool? v) {
                                reportCtrl.addUnderGround(v!);
                                print(v);
                              },
                            )),
                        Text(
                          'no'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                      ],
                    )
                  ],
                ),

                const ReportDividerWidget(),
                Obx(() => reportCtrl.underGround.value
                    ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (ctx) => SizedBox(
                                height:
                                    SizeConfig.screenHeight! / MediaSize.m2_5,
                                child: ListView.builder(
                                    itemCount:
                                        reportCtrl.underGroundWater.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          reportCtrl.groundWaterText.value =
                                              reportCtrl
                                                  .underGroundWater[index].name;
                                          reportCtrl.waterGroundId.value =
                                              reportCtrl
                                                  .underGroundWater[index].id;
                                          Navigator.pop(context);
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
                                                    color: ColorManager.grey)),
                                            child: Row(
                                              children: [
                                                Obx(() => Checkbox(
                                                    activeColor:
                                                        ColorManager.primary,
                                                    value: reportCtrl
                                                            .underGroundWaterList[
                                                        index],
                                                    onChanged: (v) {
                                                      reportCtrl
                                                              .underGroundWaterList[
                                                          index] = v;
                                                      reportCtrl.waterGroundId
                                                              .value =
                                                          reportCtrl
                                                              .underGroundWater[
                                                                  index]
                                                              .id;
                                                      reportCtrl
                                                          .addunderGroundWaterList(
                                                              index,
                                                              reportCtrl
                                                                  .waterGroundId
                                                                  .value);
                                                      print(v);
                                                    })),
                                                Flexible(
                                                  child: Text(
                                                      reportCtrl
                                                          .underGroundWater[
                                                              index]
                                                          .name,
                                                      style: getSemiBoldStyle(
                                                          color: ColorManager
                                                              .secondary)),
                                                ),
                                              ],
                                            ),
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
                              Obx(() => reportCtrl.groundWaterText.isEmpty
                                  ? BubbleLoader()
                                  : Text(reportCtrl.groundWaterText.value,
                                      textAlign: TextAlign.center,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary))),
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
                Obx(() => reportCtrl.underGroundList.isNotEmpty &&
                        reportCtrl.underGround.isTrue
                    ? SizedBox(
                        height: 45,
                        child: ListView.builder(
                          itemCount: reportCtrl.underGroundList.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorManager.secondary
                                      .withOpacity(OpicityValue.o3)),
                              child: Center(
                                child: Text(reportCtrl.underGroundList[index],
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox()),
                const ReportDividerWidget(),
                //!Land Form
                LabelWidget(label: "Land Form ".tr),
                Obx(() => GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount: reportCtrl.allLandForm.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl.onTapSelected(
                                          ctx,
                                          reportCtrl.allLandForm[index].id,
                                          reportCtrl.allLandForm[index].name);
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
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Text(
                                            reportCtrl.allLandForm[index].name,
                                            style: getSemiBoldStyle(
                                                color: ColorManager.secondary)),
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
                      child: reportCtrl.loading.value
                          ? const BubbleLoader()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(reportCtrl.landFormText.value,
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
                LabelWidget(label: "Wind direction".tr),
                Obx(() => GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount:
                                    reportCtrl.getAllWindDirection.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl.getAllWindDirectionText.value =
                                          reportCtrl
                                              .getAllWindDirection[index].name;
                                      reportCtrl.getAllWindDirectionId.value =
                                          reportCtrl
                                              .getAllWindDirection[index].id;
                                      Navigator.pop(context);
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
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Text(
                                            reportCtrl
                                                .getAllWindDirection[index]
                                                .name,
                                            style: getSemiBoldStyle(
                                                color: ColorManager.secondary)),
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
                      child: reportCtrl.loading.value
                          ? const BubbleLoader()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(reportCtrl.getAllWindDirectionText.value,
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

                LabelWidget(label: "ResponsibleAuthorities".tr),
                Obx(() => GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount: reportCtrl
                                    .responsibleAuthoritiesModel.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl.responsibleId.value =
                                          reportCtrl
                                              .responsibleAuthoritiesModel[
                                                  index]
                                              .id!;
                                      reportCtrl.responsibleText.value =
                                          reportCtrl
                                              .responsibleAuthoritiesModel[
                                                  index]
                                              .name!;
                                      Navigator.pop(context);
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
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Text(
                                            reportCtrl
                                                .responsibleAuthoritiesModel[
                                                    index]
                                                .name!,
                                            style: getSemiBoldStyle(
                                                color: ColorManager.secondary)),
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
                      child: reportCtrl.loading.value
                          ? const BubbleLoader()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(reportCtrl.responsibleText.value,
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
                //? divider
                // const ReportDividerWidget(),
                // //!Pollutant Reactivities
                // LabelWidget(label: "Pollutant Reactivities".tr),
                // Obx(() => GestureDetector(
                //     onTap: () {
                //       showModalBottomSheet(
                //         context: context,
                //         builder: (ctx) => SizedBox(
                //             height: SizeConfig.screenHeight! / MediaSize.m2_5,
                //             child: ListView.builder(
                //                 itemCount:
                //                     reportCtrl.allPollutantReactivities.length,
                //                 itemBuilder: (context, index) {
                //                   return InkWell(
                //                     onTap: () {
                //                       reportCtrl.onTapSelectedReactive(
                //                           ctx,
                //                           reportCtrl
                //                               .allPollutantReactivities[index]
                //                               .id,
                //                           reportCtrl
                //                               .allPollutantReactivities[index]
                //                               .name);
                //                     },
                //                     child: Padding(
                //                       padding: const EdgeInsets.symmetric(
                //                           horizontal: AppPadding.p60,
                //                           vertical: AppPadding.p16),
                //                       child: Container(
                //                         alignment: Alignment.center,
                //                         height: SizeConfig.screenHeight! /
                //                             MediaSize.m12,
                //                         decoration: BoxDecoration(
                //                             borderRadius: BorderRadius.circular(
                //                                 BorderRadiusValues.br10),
                //                             border: Border.all(
                //                                 width: AppSize.s1,
                //                                 color: ColorManager.grey)),
                //                         child: Text(
                //                             reportCtrl
                //                                 .allPollutantReactivities[index]
                //                                 .name,
                //                             style: getSemiBoldStyle(
                //                                 color: ColorManager.secondary)),
                //                       ),
                //                     ),
                //                   );
                //                 })),
                //       );
                //     },
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: AppPadding.p10),
                //       margin: const EdgeInsets.only(
                //           right: AppMargin.m30,
                //           left: AppMargin.m30,
                //           top: AppMargin.m20),
                //       alignment: Alignment.centerRight,
                //       height: SizeConfig.screenHeight! / MediaSize.m16,
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             width: AppSize.s1, color: ColorManager.grey),
                //         borderRadius:
                //             BorderRadius.circular(BorderRadiusValues.br5),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Text(reportCtrl.pollutantReactivitiesText.value,
                //               textAlign: TextAlign.center,
                //               style: getSemiBoldStyle(
                //                   color: ColorManager.secondary)),
                //           const Spacer(),
                //           Icon(
                //             Icons.arrow_drop_down,
                //             color: ColorManager.secondary,
                //             size: AppSize.s30,
                //           ),
                //         ],
                //       ),
                //     ))),
                //? divider
                const ReportDividerWidget(),
                //!Surface Water
                LabelWidget(label: "Surface Water".tr),
                Obx(() => GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount: reportCtrl.allSurfaceWater.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl.onTapSelectedSurface(
                                          ctx,
                                          reportCtrl.allSurfaceWater[index].id,
                                          reportCtrl
                                              .allSurfaceWater[index].name);
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
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Text(
                                            reportCtrl
                                                .allSurfaceWater[index].name,
                                            style: getSemiBoldStyle(
                                                color: ColorManager.secondary)),
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
                          Text(reportCtrl.surfaceWaterText.value,
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
                const ReportDividerWidget(),
                //!Pollutant Place
                LabelWidget(label: "Pollutant Places".tr),
                Obx(() => GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount: reportCtrl.allPollutantPlace.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl.onTapSelectedPlace(
                                          ctx,
                                          reportCtrl
                                              .allPollutantPlace[index].id,
                                          reportCtrl
                                              .allPollutantPlace[index].name);
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
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Text(
                                            reportCtrl
                                                .allPollutantPlace[index].name,
                                            style: getSemiBoldStyle(
                                                color: ColorManager.secondary)),
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
                          Text(reportCtrl.pollutantPlaceText.value,
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
                //? divider

                const ReportDividerWidget(),
                LabelWidget(label: "connotations of pollution".tr),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount: reportCtrl.semanticPollution.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl.semanticPollutionText.value =
                                          reportCtrl
                                              .semanticPollution[index].name;
                                      reportCtrl.semanticPollutionId.value =
                                          reportCtrl
                                              .semanticPollution[index].id;
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
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Row(
                                          children: [
                                            Obx(() => Checkbox(
                                                activeColor:
                                                    ColorManager.primary,
                                                value: reportCtrl
                                                        .semanticPollutionList[
                                                    index],
                                                onChanged: (v) {
                                                  reportCtrl
                                                          .semanticPollutionList[
                                                      index] = v;
                                                  reportCtrl.semanticPollutionId
                                                          .value =
                                                      reportCtrl
                                                          .semanticPollution[
                                                              index]
                                                          .id;
                                                  reportCtrl
                                                      .addsemanticPollutionList(
                                                          index,
                                                          reportCtrl
                                                              .semanticPollution[
                                                                  index]
                                                              .id);
                                                  print(v);
                                                })),
                                            Flexible(
                                              child: Text(
                                                  reportCtrl
                                                      .semanticPollution[index]
                                                      .name,
                                                  style: getSemiBoldStyle(
                                                      color: ColorManager
                                                          .secondary)),
                                            ),
                                          ],
                                        ),
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
                          Obx(() => reportCtrl.semanticPollutionText.isEmpty
                              ? BubbleLoader()
                              : Text(reportCtrl.semanticPollutionText.value,
                                  textAlign: TextAlign.center,
                                  style: getSemiBoldStyle(
                                      color: ColorManager.secondary))),
                          const Spacer(),
                          Icon(
                            Icons.arrow_drop_down,
                            color: ColorManager.secondary,
                            size: AppSize.s30,
                          ),
                        ],
                      ),
                    )),
                const ReportDividerWidget(),
                LabelWidget(label: "medium that has been contaminated".tr),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount: reportCtrl.surroundedMediums.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl.surroundedMediumsText.value =
                                          reportCtrl
                                              .surroundedMediums[index].name;
                                      reportCtrl.surroundedMediumsId.value =
                                          reportCtrl
                                              .surroundedMediums[index].id;
                                      Navigator.pop(context);
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
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Row(
                                          children: [
                                            Obx(() => Checkbox(
                                                activeColor:
                                                    ColorManager.primary,
                                                value: reportCtrl
                                                        .surroundedMediumsList[
                                                    index],
                                                onChanged: (v) {
                                                  reportCtrl
                                                          .surroundedMediumsList[
                                                      index] = v;
                                                  reportCtrl.surroundedMediumsId
                                                          .value =
                                                      reportCtrl
                                                          .surroundedMediums[
                                                              index]
                                                          .id;
                                                  reportCtrl
                                                      .addsurroundedMediumsList(
                                                          index,
                                                          reportCtrl
                                                              .surroundedMediums[
                                                                  index]
                                                              .id);
                                                  if (reportCtrl
                                                          .surroundedMediums[
                                                              index]
                                                          .name ==
                                                      "مياه") {
                                                    reportCtrl.water
                                                        .value = reportCtrl
                                                            .surroundedMediumsList[
                                                        index];
                                                  } else if (reportCtrl
                                                          .surroundedMediums[
                                                              index]
                                                          .name ==
                                                      "تربه") {
                                                    reportCtrl.earth
                                                        .value = reportCtrl
                                                            .surroundedMediumsList[
                                                        index];
                                                  } else if (reportCtrl
                                                          .surroundedMediums[
                                                              index]
                                                          .name ==
                                                      "هواء") {
                                                    reportCtrl
                                                        .air.value = reportCtrl
                                                            .surroundedMediumsList[
                                                        index];
                                                  }

                                                  print(v);
                                                })),
                                            Flexible(
                                              child: Text(
                                                  reportCtrl
                                                      .surroundedMediums[index]
                                                      .name,
                                                  style: getSemiBoldStyle(
                                                      color: ColorManager
                                                          .secondary)),
                                            ),
                                          ],
                                        ),
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
                          Obx(() => reportCtrl.surroundedMediumsText.isEmpty
                              ? BubbleLoader()
                              : Text(reportCtrl.surroundedMediumsText.value,
                                  textAlign: TextAlign.center,
                                  style: getSemiBoldStyle(
                                      color: ColorManager.secondary))),
                          const Spacer(),
                          Icon(
                            Icons.arrow_drop_down,
                            color: ColorManager.secondary,
                            size: AppSize.s30,
                          ),
                        ],
                      ),
                    )),
                const ReportDividerWidget(),
                LabelWidget(label: "The nature of the area".tr),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount: reportCtrl.natureOfEpicenter.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl.natureOfEpicenterText.value =
                                          reportCtrl
                                              .natureOfEpicenter[index].name;
                                      reportCtrl.natureOfEpicenterId.value =
                                          reportCtrl
                                              .natureOfEpicenter[index].id;
                                      Navigator.pop(context);
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
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Text(
                                            reportCtrl
                                                .natureOfEpicenter[index].name,
                                            style: getSemiBoldStyle(
                                                color: ColorManager.secondary)),
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
                          Obx(() => reportCtrl.natureOfEpicenterText.isEmpty
                              ? const BubbleLoader()
                              : Text(reportCtrl.natureOfEpicenterText.value,
                                  textAlign: TextAlign.center,
                                  style: getSemiBoldStyle(
                                      color: ColorManager.secondary))),
                          const Spacer(),
                          Icon(
                            Icons.arrow_drop_down,
                            color: ColorManager.secondary,
                            size: AppSize.s30,
                          ),
                        ],
                      ),
                    )),
                // const ReportDividerWidget(),
                // //!Weather
                //
                // LabelWidget(label: "Weather".tr),
                // Obx(() => GestureDetector(
                //     onTap: () {
                //       showModalBottomSheet(
                //         context: context,
                //         builder: (ctx) => SizedBox(
                //             height: SizeConfig.screenHeight! / MediaSize.m2_5,
                //             child: ListView.builder(
                //                 itemCount: reportCtrl.allWeather.length,
                //                 itemBuilder: (context, index) {
                //                   return InkWell(
                //                     onTap: () {
                //                       reportCtrl.onTapSelectedWeather(
                //                           ctx,
                //                           reportCtrl.allWeather[index].id,
                //                           reportCtrl.allWeather[index].name);
                //                     },
                //                     child: Padding(
                //                       padding: const EdgeInsets.symmetric(
                //                           horizontal: AppPadding.p60,
                //                           vertical: AppPadding.p16),
                //                       child: Container(
                //                         alignment: Alignment.center,
                //                         height: SizeConfig.screenHeight! /
                //                             MediaSize.m12,
                //                         decoration: BoxDecoration(
                //                             borderRadius: BorderRadius.circular(
                //                                 BorderRadiusValues.br10),
                //                             border: Border.all(
                //                                 width: AppSize.s1,
                //                                 color: ColorManager.grey)),
                //                         child: Text(
                //                             reportCtrl.allWeather[index].name,
                //                             style: getSemiBoldStyle(
                //                                 color: ColorManager.secondary)),
                //                       ),
                //                     ),
                //                   );
                //                 })),
                //       );
                //     },
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: AppPadding.p10),
                //       margin: const EdgeInsets.only(
                //           right: AppMargin.m30,
                //           left: AppMargin.m30,
                //           top: AppMargin.m20),
                //       alignment: Alignment.centerRight,
                //       height: SizeConfig.screenHeight! / MediaSize.m16,
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             width: AppSize.s1, color: ColorManager.grey),
                //         borderRadius:
                //             BorderRadius.circular(BorderRadiusValues.br5),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Text(reportCtrl.weatherText.value,
                //               textAlign: TextAlign.center,
                //               style: getSemiBoldStyle(
                //                   color: ColorManager.secondary)),
                //           const Spacer(),
                //           Icon(
                //             Icons.arrow_drop_down,
                //             color: ColorManager.secondary,
                //             size: AppSize.s30,
                //           ),
                //         ],
                //       ),
                //     ))),
                //? divider
                const ReportDividerWidget(),
                //!location
                LabelWidget(label: "Location".tr),
                Obx(() => GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount: reportCtrl.allregion.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl.regionId.value =
                                          reportCtrl.allregion[index].id;
                                      reportCtrl.regionText.value =
                                          reportCtrl.allregion[index].name;
                                      reportCtrl.getCities();
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
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Text(
                                            reportCtrl.allregion[index].name,
                                            style: getSemiBoldStyle(
                                                color: ColorManager.secondary)),
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
                          Text(reportCtrl.regionText.value,
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
                Obx(() => reportCtrl.regionId.value != 0
                    ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (ctx) => SizedBox(
                                height:
                                    SizeConfig.screenHeight! / MediaSize.m2_5,
                                child: ListView.builder(
                                    itemCount: reportCtrl.cities.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          reportCtrl.cityId.value =
                                              reportCtrl.cities[index].id;
                                          reportCtrl.cityText.value =
                                              reportCtrl.cities[index].name;
                                          Navigator.pop(context);
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
                                                    color: ColorManager.grey)),
                                            child: Text(
                                                reportCtrl.cities[index].name,
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
                              Text(reportCtrl.cityText.value,
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
                LabelWidget(label: 'Another Notes'.tr),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p12,
                      right: AppPadding.p12,
                      top: AppPadding.p12),
                  child: TextFormField(
                    controller: controllerotherNote,
                    keyboardType: TextInputType.text,
                    cursorColor: ColorManager.secondary,
                    style: TextStyle(color: ColorManager.secondary),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: AppSize.s2, color: ColorManager.secondary),
                          borderRadius: BorderRadius.circular(AppSize.s12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: AppSize.s2, color: ColorManager.secondary),
                          borderRadius: BorderRadius.circular(AppSize.s12),
                        ),
                        hintStyle: TextStyle(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.grey),
                        labelStyle: TextStyle(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.secondary)),
                    onChanged: (val) {
                      reportCtrl.changeExtentOfPolluationDescription(val);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please enter Description".tr)));
                        return 'Please enter Description'.tr;
                      }
                      return null;
                    }, // enabledBorder: InputBorder.none,
                  ),
                ),
                const ReportDividerWidget(),
                SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      Obx(() => Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: reportCtrl.imagesList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: AppMargin.m8,
                                            horizontal: AppMargin.m8),
                                        width: SizeConfig.screenWidth! /
                                            MediaSize.m5,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: FileImage(reportCtrl
                                                    .imagesList[index]),
                                                fit: BoxFit.cover),
                                            color: ColorManager.black,
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br5)),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          reportCtrl.removeImages(
                                              reportCtrl.imagesList[index]);
                                        },
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              color: ColorManager.error,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            Icons.clear,
                                            color: ColorManager.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          )),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          reportCtrl.pickImagesFormGallery();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: AppMargin.m8),
                          width: SizeConfig.screenWidth! / MediaSize.m8,
                          height: SizeConfig.screenWidth! / MediaSize.m8,
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
                  ),
                ),

                //!add images and preview images
                // Obx(() => reportCtrl.imagesList.isNotEmpty
                //     ? SizedBox(
                //         height: 120,
                //         width: double.infinity,
                //         child: ListView.builder(
                //             shrinkWrap: true,
                //             physics: const BouncingScrollPhysics(),
                //             itemCount: reportCtrl.imagesList.length,
                //             scrollDirection: Axis.horizontal,
                //             itemBuilder: (context, index) {
                //               return Stack(
                //                 children: [
                //                   Container(
                //                     margin: const EdgeInsets.symmetric(
                //                         vertical: AppMargin.m8,
                //                         horizontal: AppMargin.m8),
                //                     width:
                //                         SizeConfig.screenWidth! / MediaSize.m5,
                //                     height: 100,
                //                     decoration: BoxDecoration(
                //                         image: DecorationImage(
                //                             image: FileImage(
                //                                 reportCtrl.imagesList[index]),
                //                             fit: BoxFit.cover),
                //                         color: ColorManager.black,
                //                         borderRadius: BorderRadius.circular(
                //                             BorderRadiusValues.br5)),
                //                   ),
                //                   GestureDetector(
                //                     onTap: () {
                //                       reportCtrl.removeImages(
                //                           reportCtrl.imagesList[index]);
                //                     },
                //                     child: Container(
                //                       width: 25,
                //                       height: 25,
                //                       decoration: BoxDecoration(
                //                           color: ColorManager.error,
                //                           shape: BoxShape.circle),
                //                       child: Icon(
                //                         Icons.clear,
                //                         color: ColorManager.white,
                //                       ),
                //                     ),
                //                   )
                //                 ],
                //               );
                //             }),
                //       )
                //     : SizedBox()),
                //! Add Icon

                //? divider
                const ReportDividerWidget(),
                //!Industrial Activities
                Obx(() => Padding(
                      padding: const EdgeInsets.all(AppPadding.p20),
                      child: MultiSelectDialogField(
                        confirmText: Text(
                          'ok'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                          overflow: TextOverflow.fade,
                        ),
                        cancelText: Text(
                          'cancel'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                          overflow: TextOverflow.fade,
                        ),
                        items: reportCtrl.itemsindustrialActivities,
                        title: reportCtrl.loading.value == true
                            ? const BubbleLoader()
                            : Text("Industrial Activites".tr),
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
                          "Industrial Activites".tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                        onConfirm: (List<IndustrialActivitiesModel> results) {
                          reportCtrl
                              .getSelectedDataindustrialActivities(results);
                        },
                      ),
                    )),
                // const ReportIndustrialActivitiesWidget(),
                //? divider
                // const ReportDividerWidget(),
                // //!Industrial Polluation Source
                // Obx(() => Padding(
                //       padding: const EdgeInsets.all(AppPadding.p20),
                //       child: MultiSelectDialogField(
                //         confirmText: Text(
                //           'ok'.tr,
                //           style:
                //               getSemiBoldStyle(color: ColorManager.secondary),
                //           overflow: TextOverflow.fade,
                //         ),
                //         cancelText: Text(
                //           'cancel'.tr,
                //           style:
                //               getSemiBoldStyle(color: ColorManager.secondary),
                //           overflow: TextOverflow.fade,
                //         ),
                //         items: reportCtrl.itemsIndustrialPolluationSource,
                //         title: reportCtrl.loading.value == true
                //             ? const BubbleLoader()
                //             : Text("describe polluted medium".tr),
                //         selectedColor: ColorManager.secondary,
                //         decoration: BoxDecoration(
                //           color: ColorManager.secondary
                //               .withOpacity(OpicityValue.o1),
                //           borderRadius: const BorderRadius.all(
                //               Radius.circular(BorderRadiusValues.br10)),
                //           border: Border.all(
                //             color: ColorManager.secondary,
                //             width: AppSize.s2,
                //           ),
                //         ),
                //         buttonIcon: Icon(
                //           Icons.list,
                //           color: ColorManager.secondary,
                //         ),
                //         buttonText: Text(
                //           "describe polluted medium".tr,
                //           style:
                //               getSemiBoldStyle(color: ColorManager.secondary),
                //         ),
                //         onConfirm:
                //             (List<IndustrialPolluationSourcesModel> results) {
                //           reportCtrl.getSelectedDataIndustrialPolluationSource(
                //               results);
                //         },
                //       ),
                //     )),
                // const ReportIndustrialPolluationSourceWidget(),
                //? divider
                const ReportDividerWidget(),
                //!Polluation Source
                // const ReportPolluationSourcesWidget(),
                Obx(() => Padding(
                      padding: const EdgeInsets.all(AppPadding.p20),
                      child: MultiSelectDialogField(
                        confirmText: Text(
                          'ok'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                          overflow: TextOverflow.fade,
                        ),
                        cancelText: Text(
                          'cancel'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                          overflow: TextOverflow.fade,
                        ),
                        items: reportCtrl.itemsPolluationSources,
                        title: reportCtrl.loading.value == true
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
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                        onConfirm: (List<PolluationSourcesModel> results) {
                          reportCtrl.getSelectedDataPolluationSources(results);
                        },
                      ),
                    )),
                //? divider
                const ReportDividerWidget(),
                //!Potential Pollutants
                // const ReportPotentialPollutantsWidget(),
                Obx(() => Padding(
                      padding: const EdgeInsets.all(AppPadding.p20),
                      child: MultiSelectDialogField(
                        confirmText: Text(
                          'ok'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                          overflow: TextOverflow.fade,
                        ),
                        cancelText: Text(
                          'cancel'.tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                          overflow: TextOverflow.fade,
                        ),
                        items: reportCtrl.itemsPollutants,
                        title: reportCtrl.loading.value == true
                            ? const BubbleLoader()
                            : Text("Potential Pollutants".tr),
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
                          "Potential Pollutants".tr,
                          style:
                              getSemiBoldStyle(color: ColorManager.secondary),
                        ),
                        onConfirm: (List<PotentialPollutantsModel> results) {
                          reportCtrl.getSelectedDataPollutants(results);
                        },
                      ),
                    )),
                //? divider
                const ReportDividerWidget(),
                //!Surrounding Buildings
                // const ReportSurroundingBuildingsWidget(),
                // Obx(() => Padding(
                //       padding: const EdgeInsets.all(AppPadding.p20),
                //       child: MultiSelectDialogField(
                //         confirmText: Text(
                //           'ok'.tr,
                //           style:
                //               getSemiBoldStyle(color: ColorManager.secondary),
                //           overflow: TextOverflow.fade,
                //         ),
                //         cancelText: Text(
                //           'cancel'.tr,
                //           style:
                //               getSemiBoldStyle(color: ColorManager.secondary),
                //           overflow: TextOverflow.fade,
                //         ),
                //         items: reportCtrl.items,
                //         title: reportCtrl.loading.value == true
                //             ? const BubbleLoader()
                //             : Text("Surrounding Buildings".tr),
                //         selectedColor: ColorManager.secondary,
                //         decoration: BoxDecoration(
                //           color: ColorManager.secondary
                //               .withOpacity(OpicityValue.o1),
                //           borderRadius: const BorderRadius.all(
                //               Radius.circular(BorderRadiusValues.br10)),
                //           border: Border.all(
                //             color: ColorManager.secondary,
                //             width: AppSize.s2,
                //           ),
                //         ),
                //         buttonIcon: Icon(
                //           Icons.list,
                //           color: ColorManager.secondary,
                //         ),
                //         buttonText: Text(
                //           "Surrounding Buildings".tr,
                //           style:
                //               getSemiBoldStyle(color: ColorManager.secondary),
                //         ),
                //         onConfirm: (List<SurroundingBuildingsModel> results) {
                //           reportCtrl.getSelectedData(results);
                //         },
                //       ),
                //     )),

                LabelWidget(label: 'Surrounding Buildings'.tr),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight,
                            child: ListView.builder(
                                itemCount:
                                    reportCtrl.surroundingBuildings.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      reportCtrl
                                              .surroundingBuildingsText.value =
                                          reportCtrl
                                              .surroundingBuildings[index].name;
                                      reportCtrl.surroundingBuildingsId.value =
                                          reportCtrl
                                              .surroundingBuildings[index].id;
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppPadding.p60,
                                          vertical: AppPadding.p16),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: SizeConfig.screenHeight! /
                                            MediaSize.m12,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                BorderRadiusValues.br10),
                                            border: Border.all(
                                                width: AppSize.s1,
                                                color: ColorManager.grey)),
                                        child: Row(
                                          children: [
                                            Obx(() => Checkbox(
                                                activeColor:
                                                    ColorManager.primary,
                                                value: reportCtrl
                                                        .surroundingBuildingsList[
                                                    index],
                                                onChanged: (v) {
                                                  reportCtrl
                                                          .surroundingBuildingsList[
                                                      index] = v;
                                                  reportCtrl
                                                          .surroundingBuildingsId
                                                          .value =
                                                      reportCtrl
                                                          .surroundingBuildings[
                                                              index]
                                                          .id;

                                                  print(v);
                                                })),
                                            Expanded(
                                              child: Text(
                                                  reportCtrl
                                                      .surroundingBuildings[
                                                          index]
                                                      .name,
                                                  style: getSemiBoldStyle(
                                                      color: ColorManager
                                                          .secondary)),
                                            ),
                                            Obx(() =>
                                                reportCtrl.surroundingBuildingsList[
                                                            index] ==
                                                        true
                                                    ? Text("Distance".tr)
                                                    : const SizedBox()),
                                            Obx(() =>
                                                reportCtrl.surroundingBuildingsList[
                                                            index] ==
                                                        true
                                                    ? Expanded(
                                                        flex: 2,
                                                        child: SizedBox(
                                                          height: 40,
                                                          child: TextFormField(
                                                            initialValue: "0.0",
                                                            onFieldSubmitted:
                                                                (v) {
                                                              reportCtrl.addsurroundingBuildingsList(
                                                                  index,
                                                                  reportCtrl
                                                                          .surroundingBuildingsId
                                                                          .value =
                                                                      reportCtrl
                                                                          .surroundingBuildings[
                                                                              index]
                                                                          .id,
                                                                  double.parse(
                                                                      v));
                                                              print(reportCtrl
                                                                  .listDistance
                                                                  .length);
                                                              reportCtrl
                                                                  .listDistance
                                                                  .forEach(
                                                                      (element) {
                                                                print(element
                                                                    .toJson());
                                                              });
                                                            },
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .center,
                                                            textAlign:
                                                                TextAlign.right,
                                                            maxLines: 1,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                const InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox()),
                                          ],
                                        ),
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
                          Obx(() => reportCtrl.surroundingBuildingsText.isEmpty
                              ? const BubbleLoader()
                              : Text(reportCtrl.surroundingBuildingsText.value,
                                  textAlign: TextAlign.center,
                                  style: getSemiBoldStyle(
                                      color: ColorManager.secondary))),
                          const Spacer(),
                          Icon(
                            Icons.arrow_drop_down,
                            color: ColorManager.secondary,
                            size: AppSize.s30,
                          ),
                        ],
                      ),
                    )),

                const ReportDividerWidget(),
                ReportTextFieldWidget(
                    symbol: "M".tr,
                    onSaved: (val) {
                      double x = double.parse(controllerWidth.text) *
                          double.parse(controllerDepth.text.isEmpty
                              ? "1.0"
                              : controllerDepth.text) *
                          double.parse(controllerHeight.text.isEmpty
                              ? "0.0"
                              : controllerHeight.text);
                      controllerVolume.text = x.toString();
                    },
                    controller: controllerWidth,
                    title: "Width".tr,
                    type: TextInputType.number,
                    onSavedFunction: (val) {
                      double x = double.parse(controllerWidth.text) *
                          double.parse(controllerDepth.text.isEmpty
                              ? "1.0"
                              : controllerDepth.text) *
                          double.parse(controllerHeight.text.isEmpty
                              ? "0.0"
                              : controllerHeight.text);
                      controllerVolume.text = x.toString();
                      reportCtrl.epicenterWidth.value = double.parse(val!);
                    }),
                ReportTextFieldWidget(
                    symbol: "M".tr,
                    onSaved: (v) {
                      double x = double.parse(controllerWidth.text) *
                          double.parse(controllerDepth.text.isEmpty
                              ? "1.0"
                              : controllerDepth.text) *
                          double.parse(controllerHeight.text.isEmpty
                              ? "0.0"
                              : controllerHeight.text);
                      controllerVolume.text = x.toString();
                    },
                    controller: controllerHeight,
                    title: "Height".tr,
                    type: TextInputType.number,
                    onSavedFunction: (val) {
                      double x = double.parse(controllerWidth.text) *
                          double.parse(controllerDepth.text.isEmpty
                              ? "1.0"
                              : controllerDepth.text) *
                          double.parse(controllerHeight.text.isEmpty
                              ? "0.0"
                              : controllerHeight.text);
                      controllerVolume.text = x.toString();
                      reportCtrl.epicenterLenght.value = double.parse(val!);
                      print(reportCtrl.epicenterLenght);
                    }),
                ReportTextFieldWidget(
                    symbol: "M".tr,
                    onSaved: (val) {
                      double x = double.parse(controllerWidth.text) *
                          double.parse(controllerDepth.text.isEmpty
                              ? "1.0"
                              : controllerDepth.text) *
                          double.parse(controllerHeight.text.isEmpty
                              ? "1.0"
                              : controllerHeight.text);
                      controllerVolume.text = x.toString();
                      print(x);
                      print("Depth");
                    },
                    controller: controllerDepth,
                    title: "Depth".tr,
                    type: TextInputType.number,
                    onSavedFunction: (val) {
                      double x = double.parse(controllerWidth.text) *
                          double.parse(controllerDepth.text.isEmpty
                              ? "1.0"
                              : controllerDepth.text) *
                          double.parse(controllerHeight.text.isEmpty
                              ? "1.0"
                              : controllerHeight.text);
                      controllerVolume.text = x.toString();
                      reportCtrl.epicenterDepth.value = double.parse(val!);
                    }),
                ReportTextFieldWidget(
                    symbol: "m".tr,
                    controller: controllerVolume,
                    title: "Volume".tr,
                    type: TextInputType.number,
                    onSavedFunction: (val) {
                      reportCtrl.epicenterVolume.value = double.parse(val!);
                    }),

                Obx(() => reportCtrl.water.value == true ||
                        reportCtrl.earth.value == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reportCtrl.water.value == true &&
                                  reportCtrl.earth.value == true
                              ? LabelWidget(
                                  label:
                                      "${"Water Pollution".tr} و ${"Soil contamination".tr}")
                              : reportCtrl.water.value == true
                                  ? LabelWidget(label: "Water Pollution".tr)
                                  : reportCtrl.earth.value == true
                                      ? LabelWidget(
                                          label: "Soil contamination".tr)
                                      : const SizedBox(),
                          const ReportDividerWidget(),
                          ReportTextFieldWidget(
                              controller: controllersalinity,
                              title: "Salinity".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changesalinity(val);
                              }),
                          ReportTextFieldWidget(
                              controller: controllertotalDissolvedSolids,
                              title: "TotalDissolvedSolids".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changetotalDissolvedSolids(val);
                              }),
                          ReportTextFieldWidget(
                              controller: controllepH,
                              title: "PH".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changepH(val);
                              }),
                          ReportTextFieldWidget(
                              controller: controlleelectricalConnection,
                              title: "ElectricalConnection".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changeelectricalConnection(val);
                              }),
                          ReportTextFieldWidget(
                              controller: controllertotalOrganicCarbon,
                              title: "TotalOrganicCarbon".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changetotalOrganicCarbon(val);
                              }),
                          ReportTextFieldWidget(
                              controller: controllervolatileOrganicMatter,
                              title: "VolatileOrganicMatter".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changevolatileOrganicMatter(val);
                              }),

                          //water
                          Obx(() => reportCtrl.water.value == true
                              ? Column(
                                  children: [
                                    ReportTextFieldWidget(
                                        controller: controlleturbidity,
                                        title: "Turbidity".tr,
                                        type: TextInputType.number,
                                        onSavedFunction: (val) {
                                          reportCtrl.changeturbidity(val);
                                        }),
                                    ReportTextFieldWidget(
                                        symbol: "d".tr,
                                        controller: controllertempreture,
                                        title: "Temperature".tr,
                                        type: TextInputType.number,
                                        onSavedFunction: (val) {
                                          reportCtrl.changetemperature(val);
                                        }),
                                    ReportTextFieldWidget(
                                        controller: controllerHardness,
                                        title: "Hardness".tr,
                                        type: TextInputType.number,
                                        onSavedFunction: (val) {
                                          reportCtrl.hardness.value =
                                              val!;
                                          print(reportCtrl.hardness.value);
                                        }),
                                    ReportTextFieldWidget(
                                        controller: controllerdissolvedOxygen,
                                        title: "DissolvedOxygen".tr,
                                        type: TextInputType.number,
                                        onSavedFunction: (val) {
                                          reportCtrl.changedissolvedOxygen(val);
                                        }),
                                  ],
                                )
                              : SizedBox()),

                          //air
                        ],
                      )
                    : SizedBox()),
                Obx(() => reportCtrl.air.value == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelWidget(label: "air pollution".tr),
                          ReportTextFieldWidget(
                              symbol: "o".tr,
                              controller: controllerozone,
                              title: "Ozone".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changeozone(val);
                              }),
                          ReportTextFieldWidget(
                              symbol: "o".tr,
                              controller: controllernitrogenDioxide,
                              title: "NitrogenDioxide".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changenitrogenDioxide(val);
                              }),
                          ReportTextFieldWidget(
                              symbol: "o".tr,
                              controller: controllersulfurDioxide,
                              title: "SulfurDioxide".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changesulfurDioxide(val);
                              }),
                          ReportTextFieldWidget(
                              controller: controllerFirstCarpone,
                              title: "FirstCarpone".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.FirstCarpone.value = val!;
                                print(reportCtrl.FirstCarpone.value);
                              }),
                          ReportTextFieldWidget(
                              controller: controllerSecoundCarpone,
                              title: "SecoundCarpone".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.SecoundCarpone.value = val!;
                              }),
                          ReportTextFieldWidget(
                              symbol: "o".tr,
                              controller: controllerpM25,
                              title: "PM 25".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changepM25(val);
                              }),
                          ReportTextFieldWidget(
                              symbol: "o".tr,
                              controller: controllerpM10,
                              title: "PM 10".tr,
                              type: TextInputType.number,
                              onSavedFunction: (val) {
                                reportCtrl.changepM10(val);
                              }),
                        ],
                      )
                    : SizedBox()),
                ReportTextFieldWidget(
                    controller: controlletotalSuspendedSolids,
                    title: "TotalSuspendedSolids".tr,
                    type: TextInputType.number,
                    onSavedFunction: (val) {
                      reportCtrl.changetotalSuspendedSolids(val);
                    }),

                // ReportTextFieldWidget(
                //     controller: controllerHardness,
                //     title: "Hardness".tr,
                //     type: TextInputType.number,
                //     onSavedFunction: (val) {
                //       reportCtrl.hardness.value = double.parse(val!);
                //       print(reportCtrl.hardness.value);
                //     }),
                // ReportTextFieldWidget(
                //     controller: controllerAcidity,
                //     title: "Acidity".tr,
                //     type: TextInputType.number,
                //     onSavedFunction: (val) {
                //       reportCtrl.acidity.value = double.parse(val!);
                //       print(reportCtrl.acidity.value);
                //     }),
                // ReportTextFieldWidget(
                //     controller: controllerallKindsOfCarbon,
                //     title: "AllKindsOfCarbon".tr,
                //     type: TextInputType.number,
                //     onSavedFunction: (val) {
                //       reportCtrl.changeallKindsOfCarbon(val);
                //     }),

                ReportTextFieldWidget(
                    symbol: "d".tr,
                    controller: controllerWaterTemperature,
                    title: "WaterTemperature".tr,
                    type: TextInputType.number,
                    onSavedFunction: (val) {
                      reportCtrl.WaterTemperature.value = val!;
                    }),

                ReportTextFieldWidget(
                    symbol: "r".tr,
                    controller: controllerWindspeed,
                    title: "Wind speed".tr,
                    type: TextInputType.number,
                    onSavedFunction: (val) {
                      reportCtrl.Windspeed.value = val!;
                    }),
                ReportTextFieldWidget(
                    symbol: "r".tr,
                    controller: controllerrelativehumidity,
                    title: "relative humidity".tr,
                    type: TextInputType.number,
                    onSavedFunction: (val) {
                      reportCtrl.relativehumidity.value = val!;
                    }),
                // widget.status == 4
                //     ? Obx(() => reportCtrl.send.value
                //         ? const Center(
                //             child: CircularProgressIndicator(),
                //           )
                //         : SizedBox(
                //             width: MediaQuery.of(context).size.width,
                //             child: TextButton(
                //                 style: TextButton.styleFrom(
                //                     backgroundColor: ColorManager.lightPrimary),
                //                 onPressed: () {
                //                   reportCtrl.UpdateReport(
                //                       context: context,
                //                       epicenterId: widget.epicenterId!,
                //                       hardness: controllerHardness.text,
                //                       epicenterDepth: controllerDepth.text,
                //                       epicenterLenght: controllerHeight.text,
                //                       epicenterWidth: controllerWidth.text,
                //                       humidity: controllerrelativehumidity.text,
                //                       windSpeed: controllerWindspeed.text,
                //                       extentOfPolluationDescription:
                //                           controllerotherNote.text,
                //                       allKindsOfCarbon:
                //                           controllerallKindsOfCarbon.text,
                //                       dissolvedOxygen:
                //                           controllerdissolvedOxygen.text,
                //                       electricalConnection:
                //                           controlleelectricalConnection.text,
                //                       nitrogenDioxide:
                //                           controllernitrogenDioxide.text,
                //                       ozone: controllerozone.text,
                //                       pH: controllepH.text,
                //                       pm10: controllerpM10.text,
                //                       pm25: controllerpM25.text,
                //                       salinity: controllersalinity.text,
                //                       sulfurDioxide:
                //                           controllersulfurDioxide.text,
                //                       temperature: controllertempreture.text,
                //                       totalDissolvedSolids:
                //                           controllertotalDissolvedSolids.text,
                //                       totalOrganicCarbon:
                //                           controllertotalOrganicCarbon.text,
                //                       totalSuspendedSolids:
                //                           controlletotalSuspendedSolids.text,
                //                       turbidity: controlleturbidity.text,
                //                       volatileOrganicMatter:
                //                           controllervolatileOrganicMatter.text,
                //                       reportId: widget.report!.reportId);
                //                 },
                //                 child: Text(
                //                   "update report".tr,
                //                   style: const TextStyle(
                //                       color: Colors.white, fontSize: 18),
                //                 )),
                //           ))
                //     :
                Obx(() => reportCtrl.send.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GestureDetector(
                        onTap: () {
                          reportCtrl.sendReport(widget.epicenterId!, context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: MediaSize.m50,
                          color: ColorManager.primary,
                          child: Text(
                            'Add Report'.tr,
                            style: getLightStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ))
              ],
            ),
          )),
    ));
  }
}
