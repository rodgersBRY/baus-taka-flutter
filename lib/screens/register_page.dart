import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';
import './number_verify_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool? isChecked = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              // alignment: Alignment.center,
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
              "Create an account",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Your Email",
                  hintStyle: TextStyle(color: AppColors.placeholderColor),
                  prefixIcon:
                      Icon(Icons.email, color: AppColors.placeholderColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.placeholderColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: AppColors.placeholderColor),
                  prefixIcon:
                      Icon(Icons.lock, color: AppColors.placeholderColor),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.placeholderColor),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.placeholderColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: AppColors.placeholderColor),
                  prefixIcon:
                      Icon(Icons.lock, color: AppColors.placeholderColor),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.placeholderColor),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.placeholderColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? val) {
                      setState(() {
                        isChecked = val!;
                      });
                    }),
                Text(
                  "Accept ",
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Terms of Service ",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
                Text(
                  "and ",
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            Gap(20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.gradientColor,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => PhoneVerifyPage()));
                },
                child: Text(
                  "Register",
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
