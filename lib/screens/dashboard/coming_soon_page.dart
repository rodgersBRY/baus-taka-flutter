import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/shared_widgets/bottom_navigation.dart';
import '../../widgets/shared_widgets/outlined_button.dart';
import '../../widgets/shared_widgets/two_widget_appbar.dart';

class ComingSoonPage extends StatelessWidget {
  ComingSoonPage({super.key});

  final FocusNode searchFocusNode = FocusNode();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        searchFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: twoWidgetAppBar(title: "Coming Soon", context: context),
        body: Column(
          children: [
            Expanded(child: Container()),
            Container(
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/loading.png",
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                    Gap(40),
                    Text(
                      "This screen is still under development :)",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Gap(20),
                    CustomOutlinedButton(
                      onPressed: () {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (context) => MyOrdersPage()));
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomFloatingButton(),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
