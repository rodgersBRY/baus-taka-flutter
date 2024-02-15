import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/ecoshop_widgets/readmore_text.dart';
import '../../widgets/shared_widgets/slider_indicator.dart';
import '../../widgets/shared_widgets/title_text.dart';
import './feedback_success_page.dart';

// ignore: must_be_immutable
class ReviewDetailsPage extends StatelessWidget {
  ReviewDetailsPage({super.key});
  RxInt _selectedIndex = 0.obs;
  RxInt characterLength = 0.obs;
  RxDouble ratingValue = 3.0.obs;
  RxBool isChecked = false.obs;
  String productText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.only(top: 25),
                  color: Colors.black.withOpacity(.3),
                ),
              ),
            ),
            Row(
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  color: Colors.black,
                ),
                Expanded(child: Container()),
                Center(
                  child: Text(
                    "Review Product",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/env_2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                            isActive:
                                _selectedIndex.value == index ? true : false,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(30),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  children: [
                    TitleText(
                      text: "HydroFlask",
                      color: Colors.black,
                      fontSize: 30,
                    ),
                    Spacer(),
                    ...List.generate(
                      4,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 19,
                      ),
                    ),
                    Icon(
                      Icons.star_border,
                      size: 21,
                    ),
                    TitleText(
                        text: "(40 Reviews)",
                        color: Colors.black,
                        fontSize: 12),
                  ],
                ),
              ),
            ),
            Gap(20),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: ReadMoreText(
                text: productText,
                maxLength: 250,
              ),
            ),
            Gap(10),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: TextField(
                onChanged: (val) {
                  characterLength.value = val.length;
                },
                maxLines: 4,
                decoration: InputDecoration(
                  suffixIcon: Obx(() => Text("${characterLength.value}/500")),
                  hintText: "Comment",
                  hintStyle: TextStyle(color: AppColors.placeholderColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.placeholderColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.placeholderColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Gap(20),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TitleText(
                    text: "Rate this product out of 5",
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => Slider(
                            activeColor: AppColors.primaryColor,
                            value: ratingValue.value,
                            onChanged: (newVal) {
                              ratingValue.value = newVal;
                            },
                            min: 0.0,
                            max: 5.0,
                            divisions: 5,
                            label: '$ratingValue',
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Obx(
                            () => Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.black,
                                value: isChecked.value,
                                onChanged: (bool? val) {
                                  isChecked.value = val!;
                                }),
                          ),
                          Text(
                            "Confirm",
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Gap(20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _outlinedButton(() {
                    Navigator.of(context).pop();
                  }, "Cancel"),
                  _solidButton(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FeedbackSuccessPage()));
                  }, "submit"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _outlinedButton(VoidCallback function, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.placeholderColor, width: .7),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: function,
        child: Ink(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
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

  Widget _solidButton(VoidCallback function, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 58, 148, 61),
            Color.fromARGB(255, 70, 197, 75),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.gradientColor,
      ),
      child: ElevatedButton(
        onPressed: function,
        child: Ink(
          child: Text(
            label,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
