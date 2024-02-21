import 'package:baus_taka/screens/eco-champion/new_champion_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class EcoChampionApplyPage extends StatelessWidget {
  EcoChampionApplyPage({super.key});

  RxBool showAutofilledBox = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: TitleText(
          text: "Become an Eco-champion",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => Visibility(
              visible: showAutofilledBox.value,
              child: Container(
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 58, 148, 61),
                      Color.fromARGB(255, 70, 197, 75),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                 
                    Text(
                      "Application sent successfully",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        showAutofilledBox.value = false;
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            child: Image.asset(
              "assets/eco_champion.png",
              fit: BoxFit.cover,
              width: 200,
            ),
          ),
          Gap(30),
          Text(
            "Who is an Eco Champion?",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "An Eco Champion leads the way in environmental stewardship. Ready to join them? Click below to apply.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.withOpacity(.5),
              ),
            ),
          ),
          Gap(20),
          Container(
            width: MediaQuery.of(context).size.width * .3,
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
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NewChampionPage()));
              },
              child: Text(
                "Apply",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
