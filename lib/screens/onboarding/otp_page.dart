import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import './redirect_page.dart';
import '../../utils/app_colors.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
              "Enter code sent to your phone",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Gap(5),
            Text(
              "We sent it to +25471829335",
              style: TextStyle(fontSize: 16, color: AppColors.placeholderColor),
            ),
            Gap(10),
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: Container(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: Container(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: Container(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Din't receive the OTP?",
                  style: TextStyle(
                      color: AppColors.placeholderColor, fontSize: 15),
                ),
                Gap(2),
                GestureDetector(
                  child: Text(
                    "Resend OTP",
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 15),
                  ),
                )
              ],
            ),
            Gap(30),
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
                      MaterialPageRoute(builder: (context) => RedirectPage()));
                },
                child: Text(
                  "Verify",
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
