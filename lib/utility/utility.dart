import 'package:enivronment/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utility {
  static showBottomSheet(BuildContext context, Widget widget) {
    Get.bottomSheet(
      Container(
        height: Get.height,
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: ColorManager.primary,width: 2)
        ),
        child: widget,
      ),
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      isDismissible: true,
    );
  }
}
