import 'package:baus_taka/widgets/shared_widgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import './number_verify_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  bool? isChecked = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
        confirmPasswordFocusNode.unfocus();
      },
      child: Scaffold(
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
                      icon:
                          Icon(Icons.arrow_back, size: 30, color: Colors.white),
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
                child: CustomTextField(
                  hintText: "Your Email",
                  prefixIcon: Icons.mail,
                  editingController: emailController,
                  focusNode: emailFocusNode,
                ),
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomPasswordTextField(
                  hintText: "Password",
                  editingController: passwordController,
                  focusNode: passwordFocusNode,
                ),
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomPasswordTextField(
                  hintText: "Confirm Password",
                  editingController: confirmPasswordController,
                  focusNode: confirmPasswordFocusNode,
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PhoneVerifyPage()));
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
                child:
                    Image.asset("assets/bottom_banner.png", fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
