import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../models/report_model.dart';
import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class ReportDetailsPage extends StatelessWidget {
  final ReportModel report;
  ReportDetailsPage({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.4),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.campaign,
                    color: Colors.white,
                  ),
                  Gap(4),
                  Text(
                    "Reported",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Gap(10),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Image.asset(
                        "assets/delete_large.png",
                        width: 60,
                      ),
                      content: Text(
                        "Delete this report?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 58, 148, 61),
                                Color.fromARGB(255, 70, 197, 75),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.gradientColor,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.of(context).pop();
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => StartedWasteJobPage()));
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.4),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 50.0),
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage(report.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    text: report.location,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  Icon(Icons.directions_outlined, color: Colors.white),
                ],
              ),
            ),
            Gap(30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    text: report.date,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  Icon(Icons.calendar_month_outlined, color: Colors.white),
                ],
              ),
            ),
            Container(
              height: 2,
              color: AppColors.placeholderColor.withOpacity(.1),
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TitleText(
                text: report.title,
                color: Colors.black,
                fontSize: 26,
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                report.details,
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
