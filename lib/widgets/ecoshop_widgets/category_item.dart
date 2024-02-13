
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../shared_widgets/title_text.dart';

class CategoryWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  const CategoryWidget(
      {super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: .1),
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              width: 150,
            ),
          ),
        ),
        Gap(5),
        TitleText(
          text: title,
          color: Colors.black,
          fontSize: 16,
        ),
      ],
    );
  }
}