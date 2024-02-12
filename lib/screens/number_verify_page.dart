import 'package:baus_taka/screens/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';

class PhoneVerifyPage extends StatefulWidget {
  const PhoneVerifyPage({super.key});

  @override
  State<PhoneVerifyPage> createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/top_banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: AppColors.gradientColor),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  heightFactor: 1.7,
                  child: Container(
                    width: 200,
                    child: Image.asset("assets/banner_logo.png"),
                  ),
                ),
              ],
            ),
            Gap(20),
            Text(
              "Enter your phone number",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Gap(5),
            Text(
              "We will send you a verification code",
              style: TextStyle(fontSize: 16, color: AppColors.placeholderColor),
            ),
            Gap(10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "254",
                    style: TextStyle(fontSize: 40),
                  ),
                  Expanded(
                    child: Container(
                      child: TextField(
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          hintText: "(0) 000-00-0000",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 40),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.gradientColor,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => OtpPage()));
                },
                child: Text(
                  "Next",
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
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Expanded(child: Container()),
            Image.asset("assets/bottom_people.png"),
            Container(
              height: 80,
              width: double.infinity,
              child: Image.asset("assets/bottom_banner.png", fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
