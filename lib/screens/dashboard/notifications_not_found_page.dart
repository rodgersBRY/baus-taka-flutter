import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/bottom_navigation.dart';

class NotifcationsErrorPageage extends StatelessWidget {
  NotifcationsErrorPageage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 30,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //   Navigator.of(context)
              //       .push(MaterialPageRoute(builder: (context) => MyCartPage()));
            },
            icon: Icon(
              Icons.refresh,
              size: 30,
              color: Colors.black,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
            child: Image.asset(
              "assets/notification_error.png",
              fit: BoxFit.cover,
            ),
          ),
          Gap(30),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: Column(
              children: [
                Text(
                  "No new notifications",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
