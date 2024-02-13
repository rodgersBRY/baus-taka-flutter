import 'package:flutter/material.dart';

import './intro_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IntroPage()));
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
                        Image.asset("assets/splash_logo.png"),
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
