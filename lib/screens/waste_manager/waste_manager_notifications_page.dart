import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../models/notification_model.dart';
import '../../utils/app_colors.dart';

// ignore: must_be_immutable
class WasteManagerNotificationsPage extends StatelessWidget {
  WasteManagerNotificationsPage({super.key});

  List<NotificationModel> _notifications = [
    NotificationModel(
      title: "Upcoming Pickups",
      subtitle: "You have one incoming pickup",
      date: "27 May from 9:00",
      imageUrl: "assets/upcoming_pickup.png",
    ),
    NotificationModel(
      title: "Upcoming Events",
      subtitle: "World Environment Day",
      date: "27 May from 9:00",
      imageUrl: "assets/upcoming_events.png",
    ),
    NotificationModel(
      title: "New Deals",
      subtitle: "Check out new deals",
      date: "27 May from 9:00",
      imageUrl: "assets/new_deals.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
            icon: SvgPicture.asset(
              "assets/icons/trash.svg",
              width: 30,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        _notifications[index].imageUrl,
                        width: 70,
                      ),
                    ),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _notifications[index].title,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Gap(5),
                        Text(
                          _notifications[index].subtitle,
                          style: TextStyle(fontSize: 17),
                        ),
                        Gap(5),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Gap(5),
                            Text(
                              _notifications[index].date,
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    CircleAvatar(
                      child: Icon(Icons.chevron_right, color: Colors.white),
                      backgroundColor: AppColors.primaryColor,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 6,
                      spreadRadius: 2.0,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
