// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../models/notification_model.dart';
import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/bottom_navigation.dart';
import '../../widgets/shared_widgets/title_text.dart';
import './waste_manager_notifications_page.dart';

class WasteManagerHomepage extends StatelessWidget {
  WasteManagerHomepage({super.key});

  RxBool _switchVal = false.obs;

  static final LatLng _kMapCenter =
      LatLng(-1.2733806337508538, 36.8143121620124);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.vertical_distribute,
              size: 30,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            color: Colors.black,
          );
        }),
        title: Image.asset("assets/logo_outline.png", width: 80),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WasteManagerNotificationsPage()));
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
      drawer: Drawer(
        backgroundColor: AppColors.primaryColor,
        child: Column(
          children: [
            Container(
              height: 260,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/top_banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 3),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/logo_outline.png",
                                width: 150,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.all(5),
                              child: Icon(Icons.edit,
                                  color: Colors.white, size: 20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 58, 148, 61),
                                    Color.fromARGB(255, 70, 197, 75),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.gradientColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          TitleText(
                            text: "Alecky",
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          TitleText(
                            text: "0710988567",
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _drawerListTile(
                icon: Icons.restore, label: "Pickups", onTap: () {}),
            _drawerListTile(
                icon: Icons.business_center, label: "Jobs", onTap: () {}),
            _drawerListTile(
                icon: Icons.notifications,
                label: "Notifications",
                onTap: () {}),
            _drawerListTile(
                icon: Icons.g_translate_outlined,
                label: "Switch Language",
                onTap: () {}),
            _drawerListTileWithTrailingIcon(
              leadingIcon: Icons.switch_account_outlined,
              label: "Switch to Client",
              onTap: () {},
              trailingIcon:
                  Icon(Icons.open_in_new_outlined, color: Colors.white),
            ),
            _drawerListTile(icon: Icons.logout, label: "Logout", onTap: () {}),
            Expanded(child: Container()),
            Center(
              child: Text("App Version - V2.00",
                  style: TextStyle(color: Colors.white)),
            ),
            Gap(20),
          ],
        ),
      ),
      body: SlidingUpPanel(
        color: Colors.transparent,
        maxHeight: MediaQuery.of(context).size.height * .73,
        minHeight: MediaQuery.of(context).size.height * .1,
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _kInitialPosition,
            ),
            Column(
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
                        color: Colors.black.withOpacity(.4),
                        border: Border(
                          bottom: BorderSide(
                            width: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 136, 182, 219),
                            child: Image.asset("assets/logo_outline.png",
                                width: 30),
                          ),
                          Gap(20),
                          TitleText(
                            text: "Hey, Alecky",
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          Expanded(child: Container()),
                          Obx(
                            () => Switch(
                                activeColor: AppColors.primaryColor,
                                trackColor:
                                    MaterialStateProperty.all(Colors.white),
                                value: _switchVal.value,
                                onChanged: (val) {
                                  _switchVal.value = val;
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        panelBuilder: (controller) => PanelWidget(scrollController: controller),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(),
      bottomNavigationBar: CustomBottomBar(),
    );
  }

  Widget _drawerListTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white.withOpacity(.2)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(label, style: TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }

  Widget _drawerListTileWithTrailingIcon({
    required IconData leadingIcon,
    required String label,
    required VoidCallback onTap,
    required Widget trailingIcon,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white.withOpacity(.2)),
        child: Icon(
          leadingIcon,
          color: Colors.white,
        ),
      ),
      title: Text(label, style: TextStyle(color: Colors.white)),
      trailing: trailingIcon,
      onTap: onTap,
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController scrollController;
  PanelWidget({super.key, required this.scrollController});

  List<NotificationModel> _notifications = [
    NotificationModel(
      title: "Report Illegal Dumping",
      subtitle: "Keep your environment clean",
      date: "27 May from 9:00",
      imageUrl: "assets/report.png",
    ),
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
          color: Colors.black.withOpacity(.4),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.zero,
            children: [
              Gap(20),
              // drag handle bar
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
              Gap(50),
              ...List.generate(4, (index) => _panelListItem(index))
            ],
          ),
        ),
      ),
    );
  }

  Widget _panelListItem(index) {
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
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
  }
}
