import 'package:baus_taka/screens/dashboard/homepage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../screens/ecoshop/homepage.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/outlined_button.dart';

class FeedbackSuccessPage extends StatelessWidget {
  const FeedbackSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: Container()),
        Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * .7,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Image.asset("assets/feedback.png"),
                      ),
                      Positioned(
                        bottom: 65,
                        right: 130,
                        child: Image.asset(
                          "assets/confetti_bag.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Success!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(10),
                Text(
                  "Thank you. We value your feedback.",
                  style: TextStyle(fontSize: 18),
                ),
                Gap(40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => EcoHomepage(),
                        ),
                      );
                    },
                    title: "Continue Shopping",
                  ),
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomOutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => DashboardHomepage(),
                        ),
                      );
                    },
                    title: "Home",
                  ),
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
