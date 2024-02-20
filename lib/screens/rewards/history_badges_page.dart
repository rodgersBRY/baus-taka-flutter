import 'package:baus_taka/screens/rewards/redemption_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

class HistoryBadgesPage extends StatelessWidget {
  const HistoryBadgesPage({super.key});

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
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    TitleText(
                      text: "My Balance",
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    Gap(30),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/dollar_coin.png"),
                          Column(
                            children: [
                              Text(
                                "Points",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 231, 11)),
                              ),
                              Gap(10),
                              Text(
                                "2,000",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 231, 11)),
                              ),
                            ],
                          ),
                          Gap(10),
                          Text(
                            "=",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 231, 11)),
                          ),
                          Gap(10),
                          Image.asset("assets/debit_card.png"),
                          Gap(10),
                          Column(
                            children: [
                              Text(
                                "Ksh",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 231, 11)),
                              ),
                              Gap(10),
                              Text(
                                "240",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 231, 11)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Image.asset("assets/trophy_cup_large.png")
              ],
            ),
          ),
          Gap(20),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicator: BoxDecoration(),
                    tabs: [
                      Tab(
                        child: Text(
                          "History",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Badges",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _historyContainer(),
                        _badgeContainer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RedemptionPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Redeem",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.east,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Gap(60),
        ],
      ),
    );
  }

  Widget _historyContainer() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 19),
          ),
          ...List.generate(
            5,
            (index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.autorenew, color: Colors.white, size: 30),
              ),
              title: Text(
                "Converted to Ksh",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              subtitle: Text(
                "August 7 2021, 7:03pm",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              ),
              trailing: Container(
                width: 100,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "+1248",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Gap(10),
                    Image.asset("assets/dollar_coin.png"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _badgeContainer() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            3,
            (index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(.3),
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      offset: Offset(1, 4),
                    ),
                  ]),
              child: ListTile(
                leading: Image.asset("assets/bronze.png"),
                title: Text.rich(
                  TextSpan(
                    text: "Bronze ",
                    style: TextStyle(
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
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    Stack(
                      children: [
                        Container(
                          width: 180,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: AppColors.placeholderColor.withOpacity(.4),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 10,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "completed",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: AppColors.placeholderColor,
                      ),
                    ),
                  ],
                ),
                trailing: Image.asset("assets/medal.png", width: 50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
