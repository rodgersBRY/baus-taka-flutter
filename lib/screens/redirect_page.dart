import 'package:baus_taka/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RedirectPage extends StatefulWidget {
  const RedirectPage({super.key});

  @override
  State<RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  @override
  void initState() {
    super.initState();
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
                        Image.asset("assets/redirect_image.png"),
                        Gap(20),
                        Text(
                          "Success",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(20),
                        Text(
                          "Redirecting you to the dashboard shortly",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.placeholderColor,
                          ),
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
