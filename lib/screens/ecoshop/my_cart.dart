// ignore_for_file: must_be_immutable

import 'package:baus_taka/screens/ecoshop/checkout_page.dart';
import 'package:baus_taka/screens/ecoshop/homepage.dart';
import 'package:baus_taka/widgets/shared_widgets/custom_button.dart';
import 'package:baus_taka/widgets/shared_widgets/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/ecoshop_widgets/secondary_appbar.dart';
import '../../widgets/shared_widgets/title_text.dart';

class MyCartPage extends StatelessWidget {
  MyCartPage({super.key});

  RxInt qty = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: secondaryAppBarWidget(context, "My Cart"),
      body: Container(
        child: Column(
          children: [
            Gap(30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 9,
                    spreadRadius: 1,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 100,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/flask.webp",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: "Hydroflask",
                        color: Colors.black,
                        fontSize: 19,
                      ),
                      Gap(7),
                      TitleText(
                        text: "2 bottles, 800.00",
                        color: AppColors.primaryColor,
                        fontSize: 15,
                      ),
                    ],
                  ),
                  Gap(10),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (qty.value > 0) {
                                  qty.value--;
                                }
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.grey.withOpacity(.1),
                                ),
                              ),
                              color: Colors.black,
                            ),
                            Gap(15),
                            Obx(
                              () => TitleText(
                                  text: "${qty.value}",
                                  color: Colors.black,
                                  fontSize: 24),
                            ),
                            Gap(15),
                            IconButton(
                              onPressed: () {
                                qty.value++;
                              },
                              icon: Icon(
                                Icons.add,
                                size: 20,
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.gradientColor),
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Gap(10),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.grey[200],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Remove",
                                  style: TextStyle(
                                    color: AppColors.placeholderColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(10),
                                Icon(
                                  Icons.delete,
                                  color: AppColors.placeholderColor,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: .1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(
                        text: "Product",
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                      TitleText(
                        text: "Amount",
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ],
                  ),
                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(
                        text: "Hydroflask x 2",
                        color: Colors.grey.withOpacity(.6),
                        fontSize: 15,
                      ),
                      TitleText(
                        text: "Ksh. 800.00",
                        color: Colors.grey.withOpacity(.6),
                        fontSize: 15,
                      ),
                    ],
                  ),
                  Gap(30),
                  Text(
                    "------------------------------------------------------------------------------------------------",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(.6),
                    ),
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(
                        text: "Total Price",
                        color: Color.fromARGB(255, 17, 80, 131),
                        fontSize: 16,
                      ),
                      TitleText(
                        text: "Ksh 800.00",
                        color: AppColors.primaryColor,
                        fontSize: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CheckoutPage()));
                },
                title: "Checkout",
              ),
            ),
            Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomOutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => EcoHomepage()));
                },
                title: "Continue Shopping",
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final double dashWidth = 5;
    final double dashSpace = 5;

    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, size.height / 2),
        Offset(currentX + dashWidth, size.height / 2),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
