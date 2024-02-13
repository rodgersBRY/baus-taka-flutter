import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../shared_widgets/title_text.dart';


class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 2,
            spreadRadius: 2.0,
            offset: Offset(0, 2 / 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              "assets/env_2.jpg",
              fit: BoxFit.contain,
              width: double.maxFinite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Row(
              children: [
                TitleText(
                  text: "HydroFlask",
                  color: Colors.black,
                  fontSize: 20,
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.orange),
                TitleText(text: "5.0", color: Colors.grey, fontSize: 12),
                TitleText(text: "(12)", color: Colors.grey, fontSize: 12),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Row(
              children: [
                TitleText(text: "Qty: 1 bag", color: Colors.grey, fontSize: 12),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 7.0, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: "Ksh 400",
                  color: AppColors.gradientColor,
                  fontSize: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.gradientColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}