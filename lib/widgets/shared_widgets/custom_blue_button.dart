import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomBlueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomBlueButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 27, 133, 219),
            const Color.fromRGBO(33, 150, 243, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryBlueColor,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Ink(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
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
