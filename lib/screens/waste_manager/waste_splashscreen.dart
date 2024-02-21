import 'package:baus_taka/utils/app_colors.dart';
import 'package:flutter/material.dart';

import './waste_manager_homepage.dart';

class WasteManagerSplashscreen extends StatefulWidget {
  const WasteManagerSplashscreen({super.key});

  @override
  State<WasteManagerSplashscreen> createState() =>
      _WasteManagerSplashscreenState();
}

class _WasteManagerSplashscreenState extends State<WasteManagerSplashscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => WasteManagerHomepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Expanded(child: Container()),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset("assets/banner_logo.png"),
                        Text(
                          "Switching to Waste Manager",
                          style: TextStyle(color: AppColors.primaryColor, fontSize: 19),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
