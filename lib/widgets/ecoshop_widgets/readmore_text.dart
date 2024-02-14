
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class ReadMoreText extends StatelessWidget {
  final String text;
  final int maxLength;

  RxBool isExpanded = false.obs;

  ReadMoreText({super.key, required this.text, required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Obx(() => Text(
              isExpanded.value
                  ? text
                  : (text.length > maxLength
                      ? text.substring(0, maxLength) + "..."
                      : text),
            )),
        if (text.length > maxLength)
          GestureDetector(
              onTap: () {
                isExpanded.value = !isExpanded.value;
              },
              child: Obx(() => Text(
                    isExpanded.value ? "Read Less" : "Read More",
                    style: TextStyle(
                      color: AppColors.gradientColor,
                    ),
                  )))
      ],
    );
  }
}