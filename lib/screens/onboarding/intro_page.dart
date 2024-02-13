import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/slider_indicator.dart';
import './login_page.dart';

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
        child: PageView.builder(
          itemCount: _pages.length,
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentpage = page;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _pages[index],
                Gap(60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      3,
                      (index) => Indicator(
                          isActive: _currentpage == index ? true : false),
                    ),
                  ],
                ),
              ],
            );
          },
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
