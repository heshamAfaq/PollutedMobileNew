// import 'dart:developer';
//
// import 'package:enivronment/presentation/resources/constants_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:number_pagination/number_pagination.dart';
//
// import '../../app/app_prefs.dart';
// import '../../app/shared_widgets/loader_widget.dart';
// import '../../data/controller/epicenter/all_epicenter_controller.dart';
// import '../../data/controller/pagination_controller.dart';
// import '../epicenter/add_epicenter_screen.dart';
// import '../login/login_screen.dart';
// import '../resources/assets_manager.dart';
// import '../resources/color_manager.dart';
// import '../resources/font_manager.dart';
// import '../resources/size_manager.dart';
// import '../resources/styles_manager.dart';
// import '../resources/values_manager.dart';
// import 'widget/language_widget.dart';
// import 'widget/list_item_widget.dart';
// import 'widget/nearst_epicenters_widget.dart';
//
// // ignore: must_be_immutable
// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);
//   List<Tab> tabs = <Tab>[
//     Tab(text: 'all'.tr),
//     Tab(text: 'nearst'.tr),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final epicenterCtrl = Get.put(AllEpicenterController());
//
//     SizeConfig().init(context);
//     return DefaultTabController(
//       length: tabs.length,
//       child: Builder(builder: (context) {
//         return SafeArea(
//           child: Scaffold(
//               appBar: AppBar(
//                 leading: Container(
//                   margin: const EdgeInsets.all(AppMargin.m8),
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                     image: AssetImage(ImageAssets.splashLogo),
//                   )),
//                 ),
//                 actions: [
//                   //! change Language
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => const LanguageScreen());
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: AppMargin.m16, horizontal: AppMargin.m8),
//                       width: SizeConfig.screenWidth! / MediaSize.m6,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.circular(BorderRadiusValues.br5),
//                           border: Border.all(
//                               width: AppSize.s1,
//                               color: ColorManager.secondary)),
//                       child: Text(
//                         'language'.tr,
//                         style: getSemiBoldStyle(color: ColorManager.secondary),
//                       ),
//                     ),
//                   ),
//                   //! Add Epicenter
//                   IconButton(
//                     icon: Icon(
//                       Icons.add_circle_outline,
//                       color: ColorManager.secondary,
//                     ),
//                     onPressed: () {
//                       Get.to(() => AddEpicenterScreen());
//                     },
//                   ),
//
//                   //!logout
//                   IconButton(
//                     icon: Image.asset(
//                       ImageAssets.logout,
//                       width: SizeConfig.screenWidth! / MediaSize.m17,
//                       height: SizeConfig.screenHeight! / MediaSize.m17,
//                     ),
//                     onPressed: () {
//                       SharedPreferencesHelper.clearToken();
//                       Get.offAll(const LoginScreen());
//                     },
//                   ),
//                 ],
//                 backgroundColor: ColorManager.white,
//                 bottom: TabBar(
//                   labelColor: ColorManager.secondary,
//                   labelStyle: getBoldStyle(
//                       color: ColorManager.primary, fontSize: FontSize.s16),
//                   indicatorColor: ColorManager.secondary,
//                   overlayColor: MaterialStateProperty.resolveWith((states) {
//                     if (states.contains(MaterialState.pressed)) {
//                       return ColorManager.lightGrey;
//                     }
//                     return null;
//                   }),
//                   tabs: tabs,
//                 ),
//               ),
//               body: TabBarView(
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: [
//                   Obx(
//                     () => Container(
//                     padding: const EdgeInsets.only(
//                         bottom: AppPadding.p8,
//                         top: AppPadding.p20,
//                         right: AppPadding.p14,
//                         left: AppPadding.p14),
//                     width: double.infinity,
//                     color: ColorManager.lightGrey,
//                     child: epicenterCtrl.loading.value == true
//                         ? const LoaderWidget()
//                         : epicenterCtrl.allEpicenter.isEmpty
//                             ? Padding(
//                                 padding: const EdgeInsets.all(
//                                     AppPadding.p24),
//                                 child:
//                                     Image.asset(ImageAssets.emptyList),
//                               )
//                             : Stack(
//                                 children: [
//                                   ListView.builder(
//                                       itemCount: epicenterCtrl
//                                           .allEpicenter.length,
//                                       itemBuilder:
//                                           (BuildContext context,
//                                               index) {
//                                         return ListItemWidget(
//                                           city: epicenterCtrl
//                                               .allEpicenter[index]
//                                               .city
//                                               .name,
//                                           governorate: epicenterCtrl
//                                               .allEpicenter[index]
//                                               .city
//                                               .governorate
//                                               .name,
//                                           images: epicenterCtrl
//                                               .allEpicenter[index]
//                                               .epicenterPhotos,
//                                           title: epicenterCtrl
//                                               .allEpicenter[index]
//                                               .description,
//                                           description: epicenterCtrl
//                                               .allEpicenter[index]
//                                               .reason,
//                                           date: epicenterCtrl
//                                               .allEpicenter[index]
//                                               .creationDate,
//                                           size: epicenterCtrl
//                                               .allEpicenter[index].size,
//                                           epicenterId: epicenterCtrl
//                                               .allEpicenter[index].id,
//                                           lat: epicenterCtrl
//                                               .allEpicenter[index].lat,
//                                           long: epicenterCtrl
//                                               .allEpicenter[index].long,
//                                         );
//                                       }),
//                                   GetBuilder<PaginationController>(
//                                       init: PaginationController(),
//                                       builder: (paginationCtrl) {
//                                         return GetBuilder<AllEpicenterController>(
//                                           init: AllEpicenterController(),
//                                           builder: (controller) {
//                                             return Align(
//                                               alignment:
//                                                   Alignment.bottomCenter,
//                                               child: NumberPagination(
//                                                 onPageChanged:
//                                                     (int pageNumber) {
//                                                       controller.getAllEpicenter(pageNumber);
//
//                                                   log("page number $pageNumber");
//                                                 },
//                                                 fontSize: FontSize.s12,
//                                                 iconNext: Icon(
//                                                   paginationCtrl
//                                                       .paginationNext,
//                                                   color: ColorManager.white,
//                                                 ),
//                                                 iconPrevious: Icon(
//                                                   paginationCtrl
//                                                       .paginationPervious,
//                                                   color: ColorManager.white,
//                                                 ),
//                                                 pageTotal: 100,
//                                                 pageInit:
//                                                     1, // picked number when init page
//                                                 colorPrimary:
//                                                     ColorManager.lightGrey,
//                                                 colorSub:
//                                                     ColorManager.secondary,
//                                                 threshold: AppConstants
//                                                     .paginationNumber,
//                                               ),
//                                             );
//                                           }
//                                         );
//                                       })
//                                 ],
//                               )),
//                   ),
//                   NearstEpicentersWidget(),
//                 ],
//               )),
//         );
//       }),
//     );
//   }
// }
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:enivronment/app/constants.dart';
import 'package:enivronment/app/shared_widgets/bubbled_loader_widget.dart';
import 'package:enivronment/data/controller/epicenter/nearst_epicenters_controller.dart';
import 'package:enivronment/presentation/Home/update_report.dart';
import 'package:enivronment/presentation/report/add_report_screen.dart';
import 'package:enivronment/presentation/report/widget/report_divider_widget.dart';
import 'package:enivronment/presentation/resources/constants_manager.dart';
import 'package:enivronment/presentation/widget/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../app/app_prefs.dart';
import '../../app/shared_widgets/loader_widget.dart';
import '../../data/controller/epicenter/all_epicenter_controller.dart';
import '../epicenter/add_epicenter_screen.dart';
import '../epicenter/widgets/epicenter_radio_widget.dart';
import '../login/login_screen.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widget/language_widget.dart';
import 'widget/list_item_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  int cityId = 0;

  @override
  Widget build(BuildContext context) {
    final epicenterCtrl = Get.put(AllEpicenterController());

    List<Tab> tabs = <Tab>[
      Tab(text: 'All HotSpots'.tr),
      Tab(text: 'Nearst HotSpots'.tr),
      Tab(text: 'reports'.tr),
    ];

    SizeConfig().init(context);

    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            appBar: AppBar(
              // leading: Container(
              //   margin: const EdgeInsets.all(AppMargin.m8),
              //   decoration: const BoxDecoration(
              //       image: DecorationImage(
              //     image: AssetImage(ImageAssets.splashLogo),
              //   )),
              // ),
              title: Image.asset(
                ImageAssets.splashLogo,
                width: 50,
                height: 50,
              ),
              actions: [
                //! change Language
                InkWell(
                  onTap: () {
                    Get.off(() => const LanguageScreen());
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: AppMargin.m16, horizontal: AppMargin.m8),
                    width: SizeConfig.screenWidth! / MediaSize.m6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(BorderRadiusValues.br5),
                        border: Border.all(
                            width: AppSize.s1, color: ColorManager.secondary)),
                    child: Text(
                      'language'.tr,
                      style: getSemiBoldStyle(color: ColorManager.secondary),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => AddEpicenterScreen());
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: AppMargin.m16, horizontal: AppMargin.m8),
                      width: SizeConfig.screenWidth! / MediaSize.m6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(BorderRadiusValues.br5),
                          border: Border.all(
                              width: AppSize.s1,
                              color: ColorManager.secondary)),
                      child: Icon(
                        Icons.add,
                        color: ColorManager.secondary,
                      )),
                ),
                // SizedBox(
                //   height: 5,
                //   child: TextButton(
                //     onPressed: () {
                //       Get.to(() => AddEpicenterScreen());
                //     },
                //     style: TextButton.styleFrom(
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(4),
                //             side: BorderSide(color: ColorManager.secondary))),
                //     child: Icon(
                //       Icons.add,
                //       color: ColorManager.secondary,
                //     ),
                //   ),
                // ),
                //!
                // Add Epicenter
                // IconButton(
                //   icon: Icon(
                //     Icons.add_circle_outline,
                //     color: ColorManager.secondary,
                //   ),
                //   onPressed: () {
                //     Get.to(() => AddEpicenterScreen());
                //   },
                // ),

                //!logout
                IconButton(
                  icon: Image.asset(
                    ImageAssets.logout,
                    width: SizeConfig.screenWidth! / MediaSize.m17,
                    height: SizeConfig.screenHeight! / MediaSize.m17,
                  ),
                  onPressed: () {
                    SharedPreferencesHelper.clearToken();
                    Get.offAll(const LoginScreen());
                  },
                ),
              ],
              backgroundColor: ColorManager.white,
              bottom: TabBar(
                onTap: (index) {
                  if (index == 1) {
                    epicenterCtrl.getNearest();
                  } else if (index == 2) {
                    epicenterCtrl.getReports();
                  }
                },
                labelColor: ColorManager.secondary,
                labelStyle: getBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s16),
                indicatorColor: ColorManager.secondary,
                overlayColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return ColorManager.lightGrey;
                  }
                  return null;
                }),
                tabs: tabs,
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Obx(
                          () => GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (ctx) => SizedBox(
                                      height: SizeConfig.screenHeight! /
                                          MediaSize.m2_5,
                                      child: ListView.builder(
                                          itemCount:
                                              epicenterCtrl.allregion.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                epicenterCtrl.regionId.value =
                                                    epicenterCtrl
                                                        .allregion[index].id;
                                                epicenterCtrl.regionText.value =
                                                    epicenterCtrl
                                                        .allregion[index].name;
                                                epicenterCtrl
                                                    .onTapSelectedRegion();
                                                epicenterCtrl.getAllCities(
                                                    epicenterCtrl
                                                        .allregion[index].id);
                                                Navigator.pop(context);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            AppPadding.p60,
                                                        vertical:
                                                            AppPadding.p16),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height:
                                                      SizeConfig.screenHeight! /
                                                          MediaSize.m12,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              BorderRadiusValues
                                                                  .br10),
                                                      border: Border.all(
                                                          width: AppSize.s1,
                                                          color: ColorManager
                                                              .grey)),
                                                  child: Text(
                                                      epicenterCtrl
                                                          .allregion[index]
                                                          .name,
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
                                height:
                                    SizeConfig.screenHeight! / MediaSize.m16,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: AppSize.s1,
                                      color: ColorManager.grey),
                                  borderRadius: BorderRadius.circular(
                                      BorderRadiusValues.br5),
                                ),
                                child: epicenterCtrl.loading.value == true
                                    ? const BubbleLoader()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(epicenterCtrl.regionText.value,
                                              textAlign: TextAlign.center,
                                              style: getSemiBoldStyle(
                                                  color:
                                                      ColorManager.secondary)),
                                          const Spacer(),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: ColorManager.secondary,
                                            size: AppSize.s30,
                                          ),
                                        ],
                                      ),
                              )),
                        ),
                        Obx(
                          () => epicenterCtrl.allCities.isEmpty
                              ? const SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (ctx) => SizedBox(
                                          height: SizeConfig.screenHeight! /
                                              MediaSize.m2_5,
                                          child: ListView.builder(
                                              itemCount: epicenterCtrl
                                                  .allCities.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    epicenterCtrl.cityId.value =
                                                        epicenterCtrl
                                                            .allCities[index]
                                                            .id;
                                                    epicenterCtrl
                                                            .cityName.value =
                                                        epicenterCtrl
                                                            .allCities[index]
                                                            .name;
                                                    // epicenterCtrl
                                                    //     .onTapSelected();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal:
                                                            AppPadding.p60,
                                                        vertical:
                                                            AppPadding.p16),
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
                                                              width: AppSize.s1,
                                                              color:
                                                                  ColorManager
                                                                      .grey)),
                                                      child: Text(
                                                          epicenterCtrl
                                                              .allCities[index]
                                                              .name,
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
                                    height: SizeConfig.screenHeight! /
                                        MediaSize.m16,
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
                                        Text(epicenterCtrl.cityName.value,
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
                                  )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextField(
                              onChanged: (v) {
                                if (v.isNotEmpty) {
                                  epicenterCtrl.idSearch.value = 0;
                                  epicenterCtrl.searchName.value =
                                      v.isEmpty ? "" : v;
                                } else {
                                  epicenterCtrl.defaultSearch();
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Search by name or id".tr,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                          color: Colors.grey))),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (v) {
                                if (v.isNotEmpty) {
                                  epicenterCtrl.searchName.value = "";
                                  epicenterCtrl.idSearch.value =
                                      v.isEmpty ? 0 : int.parse(v);
                                } else {
                                  epicenterCtrl.defaultSearch();
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Search id".tr,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                          color: Colors.grey))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextButton(
                        onPressed: () {
                          if (epicenterCtrl.idSearch.value == 0 &&
                              epicenterCtrl.searchName.value == "") {
                            epicenterCtrl.defaultSearch();
                          } else {
                            epicenterCtrl.search(
                                id: epicenterCtrl.idSearch.value,
                                name: epicenterCtrl.searchName.value);
                            // epicenterCtrl.search();
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: ColorManager.lightPrimary),
                        child: Text("search".tr,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    Expanded(
                        child: Obx(() => Container(
                              padding: const EdgeInsets.only(
                                  bottom: AppPadding.p8,
                                  top: AppPadding.p20,
                                  right: AppPadding.p14,
                                  left: AppPadding.p14),
                              width: double.infinity,
                              color: ColorManager.lightGrey,
                              child: epicenterCtrl.loading.value == true
                                  ? const LoaderWidget()
                                  : epicenterCtrl.listEpicenters.isEmpty
                                      ? Center(
                                          child:
                                              Text("Not found epicenters".tr))
                                      : SmartRefresher(
                                          controller:
                                              epicenterCtrl.refreshController,
                                          enablePullUp: true,
                                          enablePullDown: false,
                                          onLoading: () async {
                                            await epicenterCtrl.loadMore();
                                            epicenterCtrl.refreshController
                                                .loadComplete();
                                          },
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: epicenterCtrl
                                                  .listEpicenters.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return ListItemWidget(
                                                  onNavigate: () async {
                                                    await epicenterCtrl
                                                        .getEpicenters(
                                                            epicenterCtrl
                                                                .listEpicenters[
                                                                    index]
                                                                .id!);

                                                    Get.to(
                                                        () => AddReportScreen(
                                                              epicenterId:
                                                                  epicenterCtrl
                                                                      .listEpicenters[
                                                                          index]
                                                                      .id!,
                                                            ));
                                                  },
                                                  // report: epicenterCtrl.epicintersModel!
                                                  //     .epicenters![index],
                                                  reportId: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .reportId,
                                                  status: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .status,
                                                  city: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .city!
                                                      .name!,
                                                  governorate: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .city!
                                                      .governorate!
                                                      .name!,
                                                  images: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .epicenterPhotos!,
                                                  title: epicenterCtrl
                                                          .listEpicenters[index]
                                                          .description ??
                                                      '',
                                                  description: epicenterCtrl
                                                          .listEpicenters[index]
                                                          .description ??
                                                      '',
                                                  date: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .creationDate!,
                                                  size: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .size!
                                                      .toDouble(),
                                                  epicenterId: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .id!,
                                                  lat: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .lat!,
                                                  long: epicenterCtrl
                                                      .listEpicenters[index]
                                                      .long!,
                                                );
                                              }),
                                        ),
                            ))),
                    // SizedBox(
                    //     height: 60,
                    //     child: Obx(() {
                    //       var totalItemCount =
                    //           int.parse(epicenterCtrl.totalItem.value);
                    //       var total = totalItemCount / 10;
                    //       return NumberPagination(
                    //         onPageChanged: (int pageNumber) {
                    //           log("page number $pageNumber");
                    //           // ctx.getAllEpicenter(pageNumber);
                    //           epicenterCtrl.changPageNum(pageNumber);
                    //         },
                    //         fontSize: FontSize.s12,
                    //         iconNext: Icon(
                    //           epicenterCtrl.paginationNext,
                    //           color: ColorManager.white,
                    //         ),
                    //         iconPrevious: Icon(
                    //           epicenterCtrl.paginationPervious,
                    //           color: ColorManager.white,
                    //         ),
                    //         pageTotal: total.ceil(),
                    //         pageInit: 1,
                    //         // picked number when init page
                    //         colorPrimary: ColorManager.lightGrey,
                    //         colorSub: ColorManager.secondary,
                    //         threshold: AppConstants.paginationNumber,
                    //       );
                    //     }))
                  ],
                ),

                Obx(() => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.lightGrey,
                          ),
                          child: NearstEpicenterRadioWidget(
                            enumName: NearstEpicenterRadio,
                            allValue: NearstEpicenterRadio.all,
                            onChangedAll: (val) => epicenterCtrl
                                .onRadioChange(val ?? NearstEpicenterRadio.all),
                            notVisitedValue: NearstEpicenterRadio.notVisited,
                            onChangedNotVisited: (val) =>
                                epicenterCtrl.onRadioChange(
                                    val ?? NearstEpicenterRadio.notVisited),
                            visitedValue: NearstEpicenterRadio.visited,
                            onChangedVisited: (val) =>
                                epicenterCtrl.onRadioChange(
                                    val ?? NearstEpicenterRadio.visited),
                            groupValue: epicenterCtrl.charcter.value,
                          ),
                        ),
                        //? divider
                        const ReportDividerWidget(),
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.only(
                                  bottom: AppPadding.p8,
                                  top: AppPadding.p20,
                                  right: AppPadding.p14,
                                  left: AppPadding.p14),
                              width: double.infinity,
                              color: ColorManager.lightGrey,
                              child: epicenterCtrl.load.value
                                  ? const LoaderWidget()
                                  : epicenterCtrl.markers == <Marker>{}
                                      ? Padding(
                                          padding: const EdgeInsets.all(
                                              AppPadding.p24),
                                          child: Image.asset(
                                              ImageAssets.emptyLocation),
                                        )
                                      : Stack(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            GoogleMap(
                                              initialCameraPosition:
                                                  CameraPosition(
                                                target: LatLng(
                                                    epicenterCtrl.locationData!
                                                        .latitude!,
                                                    epicenterCtrl.locationData!
                                                        .longitude!),
                                                zoom: 14.4746,
                                              ),
                                              mapType: MapType.satellite,
                                              markers: epicenterCtrl.markers,
                                              myLocationEnabled: true,
                                              myLocationButtonEnabled: true,
                                              onMapCreated: (GoogleMapController
                                                  controller) {},
                                            ),
                                            Container(
                                              width: 80,
                                              color: ColorManager.white,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: ButtonTheme(
                                                  alignedDropdown: true,
                                                  child: DropdownButton<String>(
                                                    dropdownColor: Colors.white,
                                                    underline: SizedBox(),
                                                    // Initial Value
                                                    value: epicenterCtrl
                                                        .dropdownvalue.value,

                                                    // Down Arrow Icon
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_down),

                                                    // Array list of items
                                                    items: epicenterCtrl.items
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    // After selecting the desired option,it will
                                                    // change button value to selected value
                                                    onChanged:
                                                        (String? newValue) {
                                                      epicenterCtrl
                                                          .dropdownvalue
                                                          .value = newValue!;
                                                      epicenterCtrl.onSelect();
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                        ),
                      ],
                    )),
                // NearestEpicentersWidget(),
                // Obx(() => epicenterCtrl.loading.value
                //     ? const Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     : epicenterCtrl.epicintersModel!.epicenters!.isEmpty
                //         ? const Center(
                //             child: Text("no found data"),
                //           )
                //         : ListView.builder(
                //             itemCount: epicenterCtrl
                //                 .epicintersModel!.epicenters!.length,
                //             shrinkWrap: true,
                //             physics: const BouncingScrollPhysics(),
                //             itemBuilder: (_, index) {
                //               return Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Container(
                //                   decoration: BoxDecoration(
                //                       border: Border.all(
                //                           color: ColorManager.primary),
                //                       borderRadius: BorderRadius.circular(8)),
                //                   child: ListTile(
                //                     onTap: () {
                //                       Get.to(() => EpicentersDetails(
                //                             data: epicenterCtrl
                //                                 .epicintersModel!
                //                                 .epicenters![index],
                //                           ));
                //                     },
                //                     subtitle: Row(
                //                       children: [
                //                         Text(
                //                           "${DateTime.tryParse(epicenterCtrl.epicintersModel!.epicenters![index].creationDate!)}"
                //                               .substring(0, 16),
                //                           style: getBoldStyle(
                //                               color: ColorManager.secondary,
                //                               fontSize: 10),
                //                         ),
                //                         Icon(
                //                           Icons.calendar_month,
                //                           color: ColorManager.secondary,
                //                           size: 20,
                //                         ),
                //                       ],
                //                     ),
                //                     title: Text(epicenterCtrl.epicintersModel!
                //                             .epicenters![index].description ??
                //                         'null'),
                //                     trailing: const Icon(
                //                         Icons.arrow_forward_ios,
                //                         color: Colors.black),
                //                   ),
                //                 ),
                //               );
                //
                //
                //
                //
                //             }))
                Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 30, vertical: 10),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         flex: 3,
                    //         child: TextField(
                    //           onChanged: (v) {
                    //             print(v);
                    //             epicenterCtrl.searchEpcintersReports(name: v);
                    //           },
                    //           decoration: InputDecoration(
                    //               hintText: "Search by name or id".tr,
                    //               focusedBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(4),
                    //                   borderSide:
                    //                       const BorderSide(color: Colors.grey)),
                    //               enabledBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(4),
                    //                   borderSide: const BorderSide(
                    //                       color: Colors.grey))),
                    //         ),
                    //       ),
                    //       SizedBox(width: 5),
                    //       Expanded(
                    //         flex: 1,
                    //         child: TextField(
                    //           onChanged: (v) {
                    //             epicenterCtrl.searchEpcintersReportsById(
                    //                 id: int.tryParse(v));
                    //           },
                    //           decoration: InputDecoration(
                    //               hintText: "Search id".tr,
                    //               focusedBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(4),
                    //                   borderSide:
                    //                       const BorderSide(color: Colors.grey)),
                    //               enabledBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(4),
                    //                   borderSide: const BorderSide(
                    //                       color: Colors.grey))),
                    //         ),
                    //       ),
                    //       // Expanded(
                    //       //   flex: 1,
                    //       //   child: Column(
                    //       //     children: [
                    //       //       GestureDetector(
                    //       //         onTap: () async {
                    //       //           final date = await epicenterCtrl
                    //       //               .showCalender(context: context);
                    //       //           print(date!.toIso8601String());
                    //       //           epicenterCtrl.searchEpcintersReports(
                    //       //               startDate: date.toIso8601String());
                    //       //         },
                    //       //         child: Icon(
                    //       //           Icons.calendar_month,
                    //       //           size: 30,
                    //       //           color: ColorManager.primary,
                    //       //         ),
                    //       //       ),
                    //       //       Container(
                    //       //         height: 20,
                    //       //         width: 1,
                    //       //         color: ColorManager.primary,
                    //       //       ),
                    //       //       GestureDetector(
                    //       //         onTap: () async {
                    //       //           final date = await epicenterCtrl
                    //       //               .showCalender(context: context);
                    //       //           print(date!.toIso8601String());
                    //       //           epicenterCtrl.searchEpcintersReports(
                    //       //               endDate: date.toIso8601String());
                    //       //         },
                    //       //         child: Icon(
                    //       //           Icons.calendar_month,
                    //       //           size: 30,
                    //       //           color: ColorManager.primary,
                    //       //         ),
                    //       //       ),
                    //       //     ],
                    //       //   ),
                    //       // )
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Obx(
                            () => GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => SizedBox(
                                        height: SizeConfig.screenHeight! /
                                            MediaSize.m2_5,
                                        child: ListView.builder(
                                            itemCount:
                                                epicenterCtrl.allregion.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  epicenterCtrl
                                                          .regionId2.value =
                                                      epicenterCtrl
                                                          .allregion[index].id;
                                                  epicenterCtrl
                                                          .regionText2.value =
                                                      epicenterCtrl
                                                          .allregion[index]
                                                          .name;
                                                  epicenterCtrl
                                                      .onTapSelectedRegion2();
                                                  epicenterCtrl.getAllCities2(
                                                      epicenterCtrl
                                                          .regionId2.value);
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          AppPadding.p60,
                                                      vertical: AppPadding.p16),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: SizeConfig
                                                            .screenHeight! /
                                                        MediaSize.m12,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                BorderRadiusValues
                                                                    .br10),
                                                        border: Border.all(
                                                            width: AppSize.s1,
                                                            color: ColorManager
                                                                .grey)),
                                                    child: Text(
                                                        epicenterCtrl
                                                            .allregion[index]
                                                            .name,
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
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m16,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br5),
                                  ),
                                  child: epicenterCtrl.loading.value == true
                                      ? const BubbleLoader()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                                epicenterCtrl.regionText2.value,
                                                textAlign: TextAlign.center,
                                                style: getSemiBoldStyle(
                                                    color: ColorManager
                                                        .secondary)),
                                            const Spacer(),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: ColorManager.secondary,
                                              size: AppSize.s30,
                                            ),
                                          ],
                                        ),
                                )),
                          ),
                          Obx(
                            () => epicenterCtrl.allCities2.isEmpty
                                ? const SizedBox()
                                : GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (ctx) => SizedBox(
                                            height: SizeConfig.screenHeight! /
                                                MediaSize.m2_5,
                                            child: ListView.builder(
                                                itemCount: epicenterCtrl
                                                    .allCities2.length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      epicenterCtrl
                                                              .cityId2.value =
                                                          epicenterCtrl
                                                              .allCities2[index]
                                                              .id;
                                                      epicenterCtrl
                                                              .cityName2.value =
                                                          epicenterCtrl
                                                              .allCities2[index]
                                                              .name;
                                                      // epicenterCtrl
                                                      //     .onTapSelected2();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal:
                                                              AppPadding.p60,
                                                          vertical:
                                                              AppPadding.p16),
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
                                                                width:
                                                                    AppSize.s1,
                                                                color:
                                                                    ColorManager
                                                                        .grey)),
                                                        child: Text(
                                                            epicenterCtrl
                                                                .allCities2[
                                                                    index]
                                                                .name,
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
                                      height: SizeConfig.screenHeight! /
                                          MediaSize.m16,
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
                                          Text(epicenterCtrl.cityName2.value,
                                              textAlign: TextAlign.center,
                                              style: getSemiBoldStyle(
                                                  color:
                                                      ColorManager.secondary)),
                                          const Spacer(),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: ColorManager.secondary,
                                            size: AppSize.s30,
                                          ),
                                        ],
                                      ),
                                    )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextField(
                              onChanged: (v) {
                                if (v.isNotEmpty) {
                                  epicenterCtrl.idSearchReport.value = 0;
                                  epicenterCtrl.searchNameReport.value =
                                  v.isEmpty ? "" : v;
                                } else {
                                  epicenterCtrl.defaultSearchReport();
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Search by name or id".tr,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                          color: Colors.grey))),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (v) {
                                if (v.isNotEmpty) {
                                  epicenterCtrl.searchNameReport.value = "";
                                  epicenterCtrl.idSearchReport.value =
                                  v.isEmpty ? 0 : int.parse(v);
                                } else {
                                  epicenterCtrl.defaultSearchReport();
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Search id".tr,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                          color: Colors.grey))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextButton(
                        onPressed: () {
                          if (epicenterCtrl.idSearchReport.value == 0 &&
                              epicenterCtrl.searchNameReport.value == "") {
                            epicenterCtrl.defaultSearchReport();
                          } else {
                            epicenterCtrl.searchReport(
                                id: epicenterCtrl.idSearchReport.value,
                                name: epicenterCtrl.searchNameReport.value);
                            // epicenterCtrl.search();
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: ColorManager.lightPrimary),
                        child: Text("search".tr,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    Expanded(
                        child: Obx(() => Container(
                              padding: const EdgeInsets.only(
                                  bottom: AppPadding.p8,
                                  top: AppPadding.p20,
                                  right: AppPadding.p14,
                                  left: AppPadding.p14),
                              width: double.infinity,
                              color: ColorManager.lightGrey,
                              child: epicenterCtrl.loadReports.value == true
                                  ? const LoaderWidget()
                                  : epicenterCtrl.listReports.isEmpty
                                      ? Center(
                                          child:
                                              Text("Not found epicenters".tr))
                                      : SmartRefresher(
                                          controller:
                                              epicenterCtrl.refreshController2,
                                          enablePullUp: true,
                                          enablePullDown: false,
                                          onLoading: () async {
                                            await epicenterCtrl.loadMore2();
                                            epicenterCtrl.refreshController2
                                                .loadComplete();
                                          },
                                          child: ListView.builder(
                                              itemCount: epicenterCtrl
                                                  .listReports.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return ListItemWidget(
                                                  onNavigate: () async {
                                                    await epicenterCtrl
                                                        .getEpicenters(
                                                            epicenterCtrl
                                                                .listReports[
                                                                    index]
                                                                .id!);

                                                    Get.to(() =>
                                                        UpdateReportScreen(
                                                          report: epicenterCtrl
                                                              .reportModel,
                                                          epicenterId:
                                                              epicenterCtrl
                                                                  .listReports[
                                                                      index]
                                                                  .id!,
                                                        ));
                                                  },
                                                  // report: epicenterCtrl.epicintersModel!
                                                  //     .epicenters![index],
                                                  reportId: epicenterCtrl
                                                      .listReports[index]
                                                      .reportId,
                                                  status: epicenterCtrl
                                                      .listReports[index]
                                                      .status,
                                                  city: epicenterCtrl
                                                      .listReports[index]
                                                      .city!
                                                      .name!,
                                                  governorate: epicenterCtrl
                                                      .listReports[index]
                                                      .city!
                                                      .governorate!
                                                      .name!,
                                                  images: epicenterCtrl
                                                      .listReports[index]
                                                      .epicenterPhotos!,
                                                  title: epicenterCtrl
                                                          .listReports[index]
                                                          .description ??
                                                      '',
                                                  description: epicenterCtrl
                                                          .listReports[index]
                                                          .description ??
                                                      '',
                                                  date: epicenterCtrl
                                                      .listReports[index]
                                                      .creationDate!,
                                                  size: epicenterCtrl
                                                      .listReports[index].size!
                                                      .toDouble(),
                                                  epicenterId: epicenterCtrl
                                                      .listReports[index].id!,
                                                  lat: epicenterCtrl
                                                      .listReports[index].lat!,
                                                  long: epicenterCtrl
                                                      .listReports[index].long!,
                                                );
                                              }),
                                        ),
                            ))),
                  ],
                ),
              ],
            )));
  }
}
