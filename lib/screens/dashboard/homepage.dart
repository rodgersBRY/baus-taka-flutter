import 'package:baus_taka/screens/dashboard/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/shared_widgets/bottom_navigation.dart';

class DashboardHomepage extends StatelessWidget {
  const DashboardHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.vertical_distribute,
            size: 30,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          color: Colors.black,
        ),
        title: Image.asset("assets/logo_outline.png", width: 80),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationsPage()));
            },
            icon: SvgPicture.asset(
              "assets/icons/notification-badge.svg",
              width: 40,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            color: Colors.black,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
