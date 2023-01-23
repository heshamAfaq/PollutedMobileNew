import 'package:enivronment/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class DisplayActivitiesScreen extends StatelessWidget {
  const DisplayActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("تعديل الانشطه الصناعيه",
            style: TextStyle(color: ColorManager.primary)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (v) {},
              decoration: const InputDecoration(hintText: "ادخل الوصف"),
            )
          ],
        ),
      ),
    );
  }
}
