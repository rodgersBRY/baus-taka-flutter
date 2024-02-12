import 'dart:async';

import 'package:baus_taka/screens/login_page.dart';
import 'package:baus_taka/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int _currentpage = 0;

  final List<Widget> _pages = [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/mission_lottie.gif",
            width: 240,
          ),
          Gap(50),
          Text(
            "Join us in the mission to make our planet cleaner through efficient waste management",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.gradientColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Gap(10),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              Gap(10),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/recycle_lottie.gif",
            width: 240,
          ),
          Gap(50),
          Text(
            "Join the Green Movement! Be part of a community that cares about the environment.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              Gap(10),
              Container(
                height: 10,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.gradientColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Gap(10),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/truck_lottie.gif",
            width: 240,
          ),
          Gap(50),
          Text(
            "Hassle-free waste collection and disposal with our efficient services",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              Gap(10),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              Gap(10),
              Container(
                height: 10,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.gradientColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentpage);

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentpage < _pages.length - 1) {
        _currentpage++;
      } else {
        _timer.cancel();
      }

      _pageController.animateToPage(
        _currentpage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.contain),
        ),
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentpage = page;
            });
          },
          children: _pages,
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(right: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gradientColor),
          child: Container(
            width: 60,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                Gap(5),
                Text(
                  "Skip",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }
}
