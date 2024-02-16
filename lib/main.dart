import 'package:baus_taka/screens/blogging/blog_details_page.dart';
import 'package:baus_taka/screens/blogging/blog_homepage.dart';
import 'package:baus_taka/screens/dashboard/homepage.dart';
import 'package:baus_taka/screens/dashboard/notifications_page.dart';
import 'package:baus_taka/screens/ecoshop/category_list_page.dart';
import 'package:baus_taka/screens/ecoshop/checkout_page.dart';
import 'package:baus_taka/screens/ecoshop/homepage.dart';
import 'package:baus_taka/screens/ecoshop/my_orders_page.dart';
import 'package:baus_taka/screens/ecoshop/review_products_page.dart';
import 'package:baus_taka/screens/svg_screen.dart';
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
      home: MyOrdersPage(),
    );
  }
}
