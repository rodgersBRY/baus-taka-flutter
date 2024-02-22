import 'dart:ui';

import 'package:baus_taka/screens/CBOs/cbo_details_page.dart';
import 'package:baus_taka/screens/CBOs/new_cbo_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class CBOHomePage extends StatelessWidget {
  CBOHomePage({super.key});

  List<Map<String, dynamic>> _cboListItems = [
    {
      "title": "CBO 1",
      "location": "Old Town, Mombasa",
      "date": "27 May from 09:00",
      "details":
          '''Lorem ipsum, dolor sit amet consectetur adipisicing elit. Officiis commodi, quo eaque ratione cumque ut.''',
      "imageUrl": "assets/cbo_1.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
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
        title: TitleText(
          text: "My CBOs",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => NewCBOPage()));
            },
            child: Text(
              "Register",
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
                itemCount: _cboListItems.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CBODetailsPage(
                                cbo: _cboListItems[index],
                              )));
                    },
                    child: Container(
                      height: 320,
                      margin: const EdgeInsets.only(bottom: 30.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_cboListItems[index]['imageUrl']),
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
                                        Icons.pending_actions,
                                        color: Colors.white,
                                      ),
                                      Gap(4),
                                      Text(
                                        "Pending",
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
                                  child: Text(
                                    "1/4",
                                    style: TextStyle(color: Colors.white),
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
                                      text: _cboListItems[index]['title'],
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
                                                _cboListItems[index]
                                                    ['location'],
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
                                                _cboListItems[index]['date'],
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
}
