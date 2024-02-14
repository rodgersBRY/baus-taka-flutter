// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/ecoshop_widgets/readmore_text.dart';
import '../../widgets/ecoshop_widgets/top_bar.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/slider_indicator.dart';
import '../../widgets/shared_widgets/title_text.dart';

class ProductDetailsPage extends StatelessWidget {
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;
  RxInt qty = 0.obs;
  String productText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50.0),
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              image: DecorationImage(
                image: AssetImage("assets/env_1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopBar(
                  searchController: searchController,
                  searchFocusNode: searchFocusNode,
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        3,
                        (index) => Indicator(
                            isActive: _selectedIndex == index ? true : false),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              child: Row(children: [
                TitleText(
                  text: "HydroFlask",
                  color: Colors.black,
                  fontSize: 27,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    if (qty.value > 0) {
                      qty.value--;
                    }
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey.withOpacity(.2),
                    ),
                  ),
                  color: Colors.black,
                ),
                Gap(15),
                Obx(
                  () => TitleText(
                      text: "${qty.value}", color: Colors.black, fontSize: 24),
                ),
                Gap(15),
                IconButton(
                  onPressed: () {
                    qty.value++;
                  },
                  icon: Icon(
                    Icons.add,
                    size: 30,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.gradientColor),
                  ),
                  color: Colors.white,
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TitleText(
              text: "Ksh. 400.00",
              color: AppColors.gradientColor,
              fontSize: 27,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ReadMoreText(text: productText, maxLength: 350),
          ),
          Gap(30),
          CustomButton(onPressed: () {}, title: "Add to cart"),
        ],
      ),
    );
  }
}

