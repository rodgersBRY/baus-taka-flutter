// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../models/notification_model.dart';
import '../../widgets/shared_widgets/bottom_navigation.dart';
import '../../widgets/shared_widgets/custom_searchbar.dart';
import './notifications_page.dart';

class DashboardHomepage extends StatefulWidget {
  const DashboardHomepage({super.key});

  @override
  State<DashboardHomepage> createState() => _DashboardHomepageState();
}

class _DashboardHomepageState extends State<DashboardHomepage> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

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
      body: SlidingUpPanel(
        color: Colors.transparent,
        maxHeight: MediaQuery.of(context).size.height,
        minHeight: MediaQuery.of(context).size.height * .1,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/env_1.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomSearchBar(
                            editingController: _searchController,
                            focusNode: _searchFocusNode,
                            hintText: "Search",
                          ),
                        ),
                        Gap(10),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.aspect_ratio, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        panelBuilder: (controller) => PanelWidget(scrollController: controller),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController scrollController;
  PanelWidget({super.key, required this.scrollController});

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
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          color: Colors.white.withOpacity(.5),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.zero,
            children: [
              Gap(20),
              Center(
                child: Container(
                  width: 70,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Gap(36),
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: _notifications.length,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           padding: const EdgeInsets.all(15),
              //           margin: const EdgeInsets.only(bottom: 20.0),
              //           child: Row(
              //             children: [
              //               Container(
              //                 child: Image.asset(
              //                   _notifications[index].imageUrl,
              //                   width: 70,
              //                 ),
              //               ),
              //               Gap(10),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     _notifications[index].title,
              //                     style: TextStyle(
              //                         fontSize: 17, fontWeight: FontWeight.bold),
              //                   ),
              //                   Gap(5),
              //                   Text(
              //                     _notifications[index].subtitle,
              //                     style: TextStyle(fontSize: 17),
              //                   ),
              //                   Gap(5),
              //                   Row(
              //                     children: [
              //                       Icon(Icons.calendar_month),
              //                       Gap(5),
              //                       Text(
              //                         _notifications[index].date,
              //                         style: TextStyle(fontSize: 17),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //               Expanded(child: Container()),
              //               CircleAvatar(
              //                 child:
              //                     Icon(Icons.chevron_right, color: Colors.white),
              //                 backgroundColor: AppColors.primaryColor,
              //               )
              //             ],
              //           ),
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(15),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.black.withOpacity(.2),
              //                 blurRadius: 6,
              //                 spreadRadius: 2.0,
              //                 offset: Offset(2, 2),
              //               ),
              //             ],
              //           ),
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
