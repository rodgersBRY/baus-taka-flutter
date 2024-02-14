// ignore_for_file: must_be_immutable

import 'package:baus_taka/screens/ecoshop/payment_page.dart';
import 'package:baus_taka/widgets/ecoshop_widgets/secondary_appbar.dart';
import 'package:baus_taka/widgets/shared_widgets/custom_button.dart';
import 'package:baus_taka/widgets/shared_widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController _couponController = TextEditingController();
  final FocusNode _couponFocusNode = FocusNode();
  RxBool showAutofilledBox = true.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          _couponFocusNode.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SecondaryAppBar(title: "Checkout"),
                Gap(20),
                Obx(() => Visibility(
                      visible: showAutofilledBox.value,
                      child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                            Gap(10),
                            Text(
                              "We've auto-filled your shipping and billinf info",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                    )),
                Gap(20),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleText(
                                text: "Your Address",
                                color: Colors.black,
                                fontSize: 19),
                            Container(
                              width: 17.0,
                              height: 17.0,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: .3),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Chania Estate, Thika, Kiambu",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Change",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 14),
                                  ),
                                  Icon(Icons.chevron_right)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(20),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(
                            text: "Collect at shop",
                            color: Colors.black,
                            fontSize: 19,
                          ),
                          Text(
                            "This removes the rider fee",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      Container(
                        width: 17.0,
                        height: 17.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: .3),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleText(
                        text: "PAYMENT",
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/mpesa_logo.png",
                            width: 130,
                            height: 50,
                          ),
                          TitleText(
                            text: "078926372",
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Change",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 14),
                              ),
                              Icon(Icons.chevron_right)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(30),
                Container(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: TextField(
                          controller: _couponController,
                          focusNode: _couponFocusNode,
                          decoration: InputDecoration(
                            hintText: "Coupon",
                            hintStyle:
                                TextStyle(color: AppColors.placeholderColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.placeholderColor
                                      .withOpacity(.1)),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.placeholderColor
                                      .withOpacity(.1)),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.maxFinite,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 58, 148, 61),
                                Color.fromARGB(255, 70, 197, 75),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: AppColors.gradientColor,
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Ink(
                              child: Text(
                                "Apply",
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
                    ],
                  ),
                ),
                Gap(20),
                Container(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                            text: "Sub-total:",
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          TitleText(
                            text: "Ksh 800.00",
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                            text: "Rider Fee:",
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          TitleText(
                            text: "Ksh 240.00",
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                            text: "TOTAL:",
                            color: Colors.black,
                            fontSize: 17,
                          ),
                          TitleText(
                            text: "Ksh 1075.00",
                            color: AppColors.primaryColor,
                            fontSize: 17,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(.3)),
                Expanded(child: Container()),
                CustomButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentPage()));
                    },
                    title: "Place an order"),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }
}
