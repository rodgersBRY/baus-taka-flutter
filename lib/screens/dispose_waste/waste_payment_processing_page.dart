import 'package:baus_taka/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../dashboard/homepage.dart';

class WastePaymentPage extends StatefulWidget {
  const WastePaymentPage({super.key});

  @override
  State<WastePaymentPage> createState() => _WastePaymentPageState();
}

class _WastePaymentPageState extends State<WastePaymentPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DashboardHomepage()));
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
                Image.asset("assets/process_order.png"),
                Gap(20),
                Text(
                  "Processing payment",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(20),
                Text(
                  "You will receive an MPESA popup shortly",
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
