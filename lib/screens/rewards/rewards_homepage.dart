import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/slider_indicator.dart';
import '../../widgets/shared_widgets/title_text.dart';
import './badge_guide_page.dart';
import './redeem_points_page.dart';

class RewardsHomepage extends StatefulWidget {
  const RewardsHomepage({super.key});

  @override
  State<RewardsHomepage> createState() => _RewardsHomepageState();
}

class _RewardsHomepageState extends State<RewardsHomepage> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> _rewardsList = [
    {
      "title": "Account Creation",
      "date": "August 7 2021",
      "time": "7:03pm",
      "points": "10"
    },
    {
      "title": "Waste Disposal",
      "date": "August 7 2021",
      "time": "7:03pm",
      "points": "5"
    },
    {
      "title": "Referrals",
      "date": "August 7 2021",
      "time": "7:03pm",
      "points": "20"
    },
    {
      "title": "Referrals",
      "date": "August 7 2021",
      "time": "7:03pm",
      "points": "10"
    },
    {
      "title": "Promotion",
      "date": "August 7 2021",
      "time": "7:03pm",
      "points": "25"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
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
          );
        }),
        title: TitleText(
          text: "Rewards",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BadgGuidePage()));
            },
            icon: SvgPicture.asset(
              "assets/icons/information-bubble.svg",
              color: AppColors.primaryColor,
              width: 30,
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            height: 180,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                text: "Green Guru",
                                color: Colors.white,
                                fontSize: 35,
                              ),
                              Gap(15),
                              Text.rich(
                                TextSpan(
                                  text: "65 points ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "(level 1)",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(10),
                              Stack(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Image.asset("assets/medal.png"),
                      ],
                    ));
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            width: 130,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  5,
                  (index) => Indicator(
                    isActive: _selectedIndex == index ? true : false,
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          ...List.generate(
            _rewardsList.length,
            (index) => ListTile(
              title: TitleText(
                text: _rewardsList[index]['title'],
                color: Colors.black,
                fontSize: 20,
              ),
              subtitle: Text.rich(
                TextSpan(
                  text: "${_rewardsList[index]['date']},  ",
                  style: TextStyle(color: Colors.black54),
                  children: [
                    TextSpan(
                      text: _rewardsList[index]['time'],
                    ),
                  ],
                ),
              ),
              trailing: Container(
                width: 140,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "+${_rewardsList[index]['points']} points",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Image.asset("assets/medal.png"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            width: MediaQuery.of(context).size.width * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RedeemPointsPage()),
                );
              },
              child: Ink(
                child: Text(
                  "Redeem",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
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
          Gap(50),
        ],
      ),
    );
  }
}
