import 'package:baus_taka/utils/app_colors.dart';
import 'package:baus_taka/widgets/shared_widgets/custom_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/shared_widgets/title_text.dart';

class WalletNumberPage extends StatefulWidget {
  WalletNumberPage({super.key});

  @override
  State<WalletNumberPage> createState() => _WalletNumberPageState();
}

class _WalletNumberPageState extends State<WalletNumberPage> {
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
            text: "Deposit",
            color: AppColors.primaryColor,
            fontSize: 22,
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    Gap(30),
                    Image.asset("assets/piggy_bank.png"),
                    Gap(20),
                    Text(
                      "Input Mpesa Number",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Please use a number that is capable of receiving Mpesa transactions",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.placeholderColor),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .6,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _amountController,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          hintText: "0712345678",
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.5), fontSize: 40),
                        ),
                      ),
                    ),
                    Gap(20),
                    Container(
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
                        onPressed: () {},
                        child: Ink(
                          child: Text(
                            "Deposit",
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
                    Gap(20),
                    CustomKeyboard(controller: _amountController)
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
