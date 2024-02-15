import 'package:baus_taka/screens/dashboard/chat_page.dart';
import 'package:baus_taka/screens/dashboard/coming_soon_page.dart';
import 'package:baus_taka/screens/dashboard/update_profile_page.dart';
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
      home: ComingSoonPage(),
    );
  }
}
