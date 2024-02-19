import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

class RedemptionPage extends StatelessWidget {
  const RedemptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              // Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.chevron_left,
              size: 30,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            color: Colors.black,
          );
        }),
        title: TitleText(
          text: "Redemption",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Redemption Rules",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .7,
              child: Text(
                "Create a discount coupon and use during checkout",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.placeholderColor,
                ),
              ),
            ),
            Gap(60),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                child: Text(
                  "Your point balance is 2000 worth Ksh 240. How many to be redeemed?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Gap(30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 40,
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "1248",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Gap(20),
            Center(
              child: Text(
                "Worth Ksh 160",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.placeholderColor.withOpacity(.7),
                ),
              ),
            ),
            Gap(30),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .5,
                height: 80,
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              "You have successfully redeemed 1248 points. You have received Ksh 160. Check balance for confirmation",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            actions: [
                              Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .5,
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
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Ok",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: Ink(
                    child: Text(
                      "Redeem",
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
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            Gap(30),
            Text(
              "Your coupons",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
