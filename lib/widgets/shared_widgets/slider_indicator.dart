
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      width: isActive ? 22.0 : 8.0,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
