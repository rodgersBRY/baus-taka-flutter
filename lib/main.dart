import 'package:baus_taka/screens/ecoshop/my_orders_page.dart';
import 'package:baus_taka/screens/ecoshop/payment_page.dart';
import 'package:flutter/material.dart';

import 'screens/ecoshop/homepage.dart';

// import './screens/onboarding/splashscreen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EcoHomepage(),
    );
  }
}
