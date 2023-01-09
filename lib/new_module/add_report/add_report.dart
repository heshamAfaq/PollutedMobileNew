import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAddReport extends StatelessWidget {
  const NewAddReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("add report".tr),
      ),
    );
  }
}
