import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class ReportsNotFoundPage extends StatelessWidget {
  ReportsNotFoundPage({super.key});

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_left,
            size: 30,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          color: Colors.black,
        ),
        title: TitleText(
          text: "Illegal Dumping",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Report",
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
          Gap(10),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Container(
              child: Image.asset(
                "assets/report_large.png",
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
            Gap(30),
            Text(
              "No new reports yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey.withOpacity(.5),
              ),
            ),
            Gap(10),
            Container(
              width: MediaQuery.of(context).size.width * .4,
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: AppColors.primaryColor),
                    Gap(5),
                    Text(
                      "Refresh",
                      style: TextStyle(color: AppColors.primaryColor),
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
