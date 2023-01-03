import 'package:flutter/material.dart';

import '../../../app/shared_widgets/label_widget.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import 'report_divider_widget.dart';

class ReportTextFieldWidget extends StatelessWidget {
  const ReportTextFieldWidget({
    Key? key,
    required this.title,
    this.onSavedFunction,
    required this.type,
    this.controller,
    this.symbol,
    this.onSaved,
    this.intialValue,
  }) : super(key: key);
  final String title;
  final TextInputType type;
  final Function(String?)? onSavedFunction;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final String? intialValue;
  final String? symbol;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelWidget(label: title),
        Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.p12, right: AppPadding.p12, top: AppPadding.p12),
          child: TextFormField(
            onFieldSubmitted: onSaved,
            controller: controller,
            keyboardType: type,
            cursorColor: ColorManager.secondary,
            style: TextStyle(color: ColorManager.secondary),
            // initialValue: intialValue,
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(symbol ?? '',style:const TextStyle(
                    fontSize: 12
                  )),
                ),
                hintText: intialValue,
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
            onChanged: onSavedFunction,
            /*
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter $title';
              }
              return null;
            }, 
            */ // enabledBorder: InputBorder.none,
          ),
        ),
        //? divider
        const ReportDividerWidget(),
      ],
    );
  }
}
