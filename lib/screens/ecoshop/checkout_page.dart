// ignore_for_file: must_be_immutable

import 'package:baus_taka/screens/ecoshop/processing_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/ecoshop_widgets/secondary_appbar.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/title_text.dart';
import './payment_page.dart';

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
    return GestureDetector(
      onTap: () {
        _couponFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: secondaryAppBarWidget(context, "Checkout"),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
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
                            "We've auto-filled your shipping and billing info",
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentPage()));
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              "Change",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 14),
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
                                color:
                                    AppColors.placeholderColor.withOpacity(.1)),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    AppColors.placeholderColor.withOpacity(.1)),
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
                title: "Place an order",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "MPESA",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Gap(20),
                                Row(
                                  children: [
                                    Icon(Icons.chevron_right),
                                    Gap(5),
                                    Expanded(
                                      child: Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard",
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    Icon(Icons.chevron_right),
                                    Gap(5),
                                    Expanded(
                                      child: Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard",
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(15),
                                Container(
                                  width: 200,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "0789678564",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Gap(20),
                                CustomButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProcessPaymentPage()));
                                  },
                                  title: "PAY NOW",
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
              Expanded(child: Container()),
            ],
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
