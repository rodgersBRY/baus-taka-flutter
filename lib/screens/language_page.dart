import 'package:baus_taka/widgets/shared_widgets/two_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

// ignore: must_be_immutable
class LanguagePage extends StatelessWidget {
  LanguagePage({super.key});

  RxString selectedValue = 'english'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: twoWidgetAppBar(title: "Language", context: context),
      body: Obx(
        () => Column(
          children: [
            RadioListTile(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: "english",
              groupValue: selectedValue.value,
              onChanged: (value) {
                selectedValue.value = value!;
              },
              title: Text("English"),
            ),
            RadioListTile(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: "kiswahili",
              groupValue: selectedValue.value,
              onChanged: (value) {
                selectedValue.value = value!;
              },
              title: Text("Kiswahili"),
            ),
          ],
        ),
      ),
    );
  }
}
