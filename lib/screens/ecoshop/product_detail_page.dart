// ignore_for_file: must_be_immutable

import 'package:baus_taka/utils/app_colors.dart';
import 'package:baus_taka/widgets/shared_widgets/custom_button.dart';
import 'package:baus_taka/widgets/shared_widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../widgets/custom_searchbar.dart';
import '../../widgets/shared_widgets/slider_indicator.dart';

class ProductDetailsPage extends StatelessWidget {
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;
  RxInt qty = 0.obs;

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
          Container(
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
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.gradientColor),
                ),
                color: Colors.white,
              ),
            ]),
          ),
          TitleText(
            text: "Ksh. 400.00",
            color: AppColors.gradientColor,
            fontSize: 27,
          ),
          CustomButton(onPressed: () {}, title: "Add to cart"),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  final FocusNode searchFocusNode;
  final TextEditingController searchController;

  TopBar(
      {super.key,
      required this.searchFocusNode,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
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
          Gap(10),
          Expanded(
            child: CustomSearchBar(
              editingController: searchController,
              focusNode: searchFocusNode,
            ),
          ),
          Gap(10),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
