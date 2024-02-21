import 'package:baus_taka/screens/eco-champion/apply_page.dart';
import 'package:baus_taka/screens/eco-champion/new_champion_page.dart';
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
      home: EcoChampionApplyPage(),
    );
  }
}
