import 'package:baus_taka/screens/rewards/badge_guide_page.dart';
import 'package:baus_taka/screens/rewards/history_badges_page.dart';
import 'package:baus_taka/screens/rewards/rewards_homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BAUS TAKA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: RewardsHomepage(),
    );
  }
}
