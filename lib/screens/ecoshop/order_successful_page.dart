import 'package:baus_taka/screens/ecoshop/my_orders_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../screens/ecoshop/homepage.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/outlined_button.dart';

class OrderSuccessfulPage extends StatelessWidget {
  const OrderSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              child: Center(
                child: Column(
                  children: [
                    Image.asset("assets/order_success.png"),
                    Gap(20),
                    Text(
                      "Success!",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(20),
                    Text(
                      "Your order will be delivered soon.",
                      style: TextStyle(fontSize: 20),
                    ),
                    Gap(20),
                    CustomButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => EcoHomepage()));
                      },
                      title: "Continue Shopping",
                    ),
                    Gap(20),
                    CustomOutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MyOrdersPage()));
                      },
                      title: "View Order",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
