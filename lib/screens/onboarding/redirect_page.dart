import 'package:baus_taka/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../ecoshop/homepage.dart';

class RedirectPage extends StatefulWidget {
  const RedirectPage({super.key});

  @override
  State<RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => EcoHomepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.asset(
          "assets/bottom_banner.png",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Expanded(child: Container()),
        Container(
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/redirect_image.png"),
                Gap(20),
                Text(
                  "Success",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(20),
                Text(
                  "Redirecting you to the dashboard shortly",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.placeholderColor,
                  ),
                ),
                Gap(20),
                Image.asset(
                  "assets/loading.png",
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
      ],
    ));
  }
}
