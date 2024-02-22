import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

AppBar twoWidgetAppBar({required String title, required BuildContext context}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.chevron_left,
        size: 30,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      color: Colors.black,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}