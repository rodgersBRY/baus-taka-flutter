import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../models/report_model.dart';
import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';
import './new_report_page.dart';
import './report_details_page.dart';

// ignore: must_be_immutable
class ReportsHomePage extends StatelessWidget {
  ReportsHomePage({super.key});

  List<ReportModel> _reportedItems = [
    ReportModel(
      title: "Paris Bridge Community Cleanup",
      location: "Old Town, Mombasa",
      date: "27 May from 09:00",
      details:
          '''There is a serious illegal dumping going on which started a week ago at Margaret Olanga’s open land near Jomvu Girls High School. the garbage looks toxic and its a threat to neighborhood. Learn all the fundamentals of composting and how to turn organic waste into nutrient-rich soil for your garden. Learn the fundamentals of composting and how to turn organic waste into nutrient-rich soil for your garden.''',
      imageUrl: "assets/events_1.jpg",
    ),
    ReportModel(
      title: "Paris Bridge Community Cleanup",
      location: "Old Town, Mombasa",
      date: "27 May from 09:00",
      details:
          '''There is a serious illegal dumping going on which started a week ago at Margaret Olanga’s open land near Jomvu Girls High School. the garbage looks toxic and its a threat to neighborhood. Learn all the fundamentals of composting and how to turn organic waste into nutrient-rich soil for your garden. Learn the fundamentals of composting and how to turn organic waste into nutrient-rich soil for your garden.''',
      imageUrl: "assets/events_1.jpg",
    ),
    ReportModel(
      title: "Paris Bridge Community Cleanup",
      location: "Old Town, Mombasa",
      date: "27 May from 09:00",
      details:
          '''There is a serious illegal dumping going on which started a week ago at Margaret Olanga’s open land near Jomvu Girls High School. the garbage looks toxic and its a threat to neighborhood. Learn all the fundamentals of composting and how to turn organic waste into nutrient-rich soil for your garden. Learn the fundamentals of composting and how to turn organic waste into nutrient-rich soil for your garden.''',
      imageUrl: "assets/events_1.jpg",
    ),
  ];

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
            onPressed: () {
              Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NewReportPage()),
        );
            },
            child: Text(
              "Report",
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
          Gap(10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Gap(20),
            Expanded(
              child: ListView.builder(
                itemCount: _reportedItems.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ReportDetailsPage(
                                report: _reportedItems[index],
                              )));
                    },
                    child: Container(
                      height: 320,
                      margin: const EdgeInsets.only(bottom: 30.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_reportedItems[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
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
                                Container(
                                  margin: const EdgeInsets.all(10.0),
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
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                color: Colors.black.withOpacity(.4),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TitleText(
                                      text: _reportedItems[index].title,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.white,
                                              ),
                                              Gap(4),
                                              Text(
                                                _reportedItems[index].location,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.event,
                                                color: Colors.white,
                                              ),
                                              Gap(4),
                                              Text(
                                                _reportedItems[index].date,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _outlinedButton(VoidCallback onPressed, String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Ink(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
