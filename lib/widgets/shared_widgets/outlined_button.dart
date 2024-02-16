import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomOutlinedButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Ink(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
