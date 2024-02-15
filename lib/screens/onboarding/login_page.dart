import 'package:baus_taka/widgets/shared_widgets/custom_textfields.dart';
import 'package:baus_taka/widgets/shared_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import './redirect_page.dart';
import './register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
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
              Gap(30),
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
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: AppColors.placeholderColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Create an account",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => RedirectPage()));
                },
                title: "Login",
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 1,
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                    Text("Or sign in with"),
                    Container(
                      width: 100,
                      height: 1,
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Image.asset(
                          "assets/number_icon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Image.asset(
                          "assets/google_icon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Image.asset(
                          "assets/apple_icon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
              Gap(10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Image.asset("assets/bottom_banner.png",
                      fit: BoxFit.cover),
                ),
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

    super.dispose();
  }
}
