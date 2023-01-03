// import 'package:enivronment/domain/model/EpicintersModel.dart';
// import 'package:enivronment/presentation/resources/font_manager.dart';
// import 'package:enivronment/presentation/resources/styles_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../resources/color_manager.dart';
//
// class EpicentersDetails extends StatelessWidget {
//   const EpicentersDetails({Key? key, this.data}) : super(key: key);
//   final Epicenters? data;
//
//   @override
//   Widget build(BuildContext context) {
//     double volume=
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorManager.white,
//         leading: IconButton(
//           onPressed: () => Get.back(),
//           icon: const Icon(Icons.arrow_back_ios),
//           color: ColorManager.primary,
//         ),
//         title: Text("${data!.description}",
//             style: TextStyle(color: ColorManager.primary, fontSize: 18)),
//       ),
//       body: SingleChildScrollView(
//         child: data!.report == null
//             ? const Center(
//                 child: Text("لايوجد تقرير"),
//               )
//             : Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("HotSpot Size".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!. ?? "0.0"}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Polluation Size".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.polluationSize ?? "0.0"}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Land Form ".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.landForm!.name}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Pollutant Reactivities".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.pollutantReactivity!.name}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Pollutant Places".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.pollutantPlace!.name}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Surface Water".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.surfaceWater!.name}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Weather".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.weather!.name}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Location".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.city!.name}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Another Notes".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(
//                             " : ${data!.report!.extentOfPolluationDescription}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("Industrial Activites".tr,
//                         style: getBoldStyle(
//                             color: ColorManager.primary,
//                             fontSize: FontSize.s16)),
//                   ),
//                   SizedBox(
//                     height: 40,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount:
//                             data!.report!.reportIndustrialActivities!.length,
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: (_, index) => Container(
//                               width: 120,
//                               decoration: BoxDecoration(
//                                   color: ColorManager.secondary,
//                                   borderRadius: BorderRadius.circular(20)),
//                               child: Center(
//                                 child: Text(
//                                     "${data!.report!.reportIndustrialActivities![index].industrialActivity!.name}",
//                                     textAlign: TextAlign.center,
//                                     style: getBoldStyle(
//                                         color: ColorManager.white,
//                                         fontSize: FontSize.s10)),
//                               ),
//                             )),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   SizedBox(
//                     height: 150,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: data!.report!.reportPhotos!.length,
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: (_, index) => Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image.network(
//                                   "https://environmentapp.afaqci.com//Files/Photos/Reports/${data!.report!.reportPhotos![index].photo!}",
//                                   fit: BoxFit.cover),
//                             )),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("describe polluted medium".tr,
//                         style: getBoldStyle(
//                             color: ColorManager.primary,
//                             fontSize: FontSize.s16)),
//                   ),
//                   SizedBox(
//                     height: 40,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: data!
//                             .report!.reportIndustrialPolluationSources!.length,
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: (_, index) => Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 2),
//                               child: Container(
//                                 width: 120,
//                                 decoration: BoxDecoration(
//                                     color: ColorManager.secondary,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: Center(
//                                   child: Text(
//                                       "${data!.report!.reportIndustrialPolluationSources![index].industrialPolluationSource!.name}",
//                                       textAlign: TextAlign.center,
//                                       style: getBoldStyle(
//                                           color: ColorManager.white,
//                                           fontSize: FontSize.s10)),
//                                 ),
//                               ),
//                             )),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("polluted medium".tr,
//                         style: getBoldStyle(
//                             color: ColorManager.primary,
//                             fontSize: FontSize.s16)),
//                   ),
//                   SizedBox(
//                     height: 40,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: data!.epicenterPolluationSources!.length,
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: (_, index) => Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 2),
//                               child: Container(
//                                 width: 120,
//                                 decoration: BoxDecoration(
//                                     color: ColorManager.secondary,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: Center(
//                                   child: Text(
//                                       "${data!.epicenterPolluationSources![index].polluationSource!.name}",
//                                       style: getBoldStyle(
//                                           color: ColorManager.white,
//                                           fontSize: FontSize.s12)),
//                                 ),
//                               ),
//                             )),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("Potential Pollutants".tr,
//                         style: getBoldStyle(
//                             color: ColorManager.primary,
//                             fontSize: FontSize.s16)),
//                   ),
//                   SizedBox(
//                     height: 40,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount:
//                             data!.report!.reportPotentialPollutants!.length,
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: (_, index) => Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 2),
//                               child: Container(
//                                 width: 120,
//                                 decoration: BoxDecoration(
//                                     color: ColorManager.secondary,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: Center(
//                                   child: Text(
//                                       "${data!.report!.reportPotentialPollutants![index].potentialPollutant!.name}",
//                                       overflow: TextOverflow.ellipsis,
//                                       textAlign: TextAlign.center,
//                                       style: getBoldStyle(
//                                           color: ColorManager.white,
//                                           fontSize: FontSize.s10)),
//                                 ),
//                               ),
//                             )),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("Surrounding Buildings".tr,
//                         textAlign: TextAlign.center,
//                         style: getBoldStyle(
//                             color: ColorManager.primary,
//                             fontSize: FontSize.s10)),
//                   ),
//                   SizedBox(
//                     height: 40,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount:
//                             data!.report!.reportSurroundingBuildings!.length,
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: (_, index) => Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 2),
//                               child: Container(
//                                 width: 120,
//                                 decoration: BoxDecoration(
//                                     color: ColorManager.secondary,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: Center(
//                                   child: Text(
//                                       "${data!.report!.reportSurroundingBuildings![index].surroundingBuilding!.name}",
//                                       overflow: TextOverflow.ellipsis,
//                                       textAlign: TextAlign.center,
//                                       style: getBoldStyle(
//                                           color: ColorManager.white,
//                                           fontSize: FontSize.s10)),
//                                 ),
//                               ),
//                             )),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Temperature".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.temperature}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Salinity".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.salinity}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("TotalDissolvedSolids".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.totalDissolvedSolids}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("TotalSuspendedSolids".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.totalSuspendedSolids}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("PH".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.ph}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Turbidity".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.turbidity}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("ElectricalConnection".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.electricalConnection}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("DissolvedOxygen".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.dissolvedOxygen}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("TotalOrganicCarbon".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.totalOrganicCarbon}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("VolatileOrganicMatter".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.volatileOrganicMatter}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("Ozone".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.ozone}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("AllKindsOfCarbon".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.allKindsOfCarbon}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("NitrogenDioxide".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.nitrogenDioxide}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("SulfurDioxide".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.sulfurDioxide}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("PM 25".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.pM25}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     endIndent: 50,
//                     indent: 50,
//                     color: ColorManager.lightPrimary,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text("PM 10".tr,
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                         Text(" : ${data!.report!.pM10}",
//                             style: getBoldStyle(
//                                 color: ColorManager.primary,
//                                 fontSize: FontSize.s16)),
//                       ],
//                     ),
//                   ),
//                   // const SizedBox(
//                   //   height: 25,
//                   // ),
//                   // Center(
//                   //   child: SizedBox(
//                   //     width: MediaQuery.of(context).size.width - 100,
//                   //     child: TextButton(
//                   //       onPressed: () {
//                   //         Get.to(() => const UpdateReport());
//                   //       },
//                   //       style: TextButton.styleFrom(
//                   //           backgroundColor: ColorManager.primary,
//                   //           shape: RoundedRectangleBorder(
//                   //               borderRadius: BorderRadius.circular(8))),
//                   //       child: Text("update report".tr,
//                   //           style: const TextStyle(
//                   //               color: Colors.white, fontSize: 15)),
//                   //     ),
//                   //   ),
//                   // ),
//                   // const SizedBox(
//                   //   height: 25,
//                   // )
//                 ],
//               ),
//       ),
//     );
//   }
// }
