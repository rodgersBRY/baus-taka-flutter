// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:baus_taka/widgets/shared_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_orange_button.dart';
import '../../widgets/shared_widgets/title_text.dart';

class StartedWasteJobPage extends StatelessWidget {
  StartedWasteJobPage({super.key});

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
          text: "Pickup Jobs",
          color: AppColors.primaryColor,
          fontSize: 22,
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
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController scrollController;
  PanelWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.4),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            border: Border(
              top: BorderSide(color: Colors.white, width: 3.0),
            ),
          ),
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.zero,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black54,
                      ),
                      child: Text(
                        "Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Image.asset(
                                  "assets/upcoming_pickup.png",
                                  width: 60,
                                ),
                                content: Text(
                                  "You are about to mark this request as Collected",
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
                                          color: AppColors.primaryColor,
                                          width: 2.0),
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color.fromARGB(
                                              255, 58, 148, 61),
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
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             StartedWasteJobPage()));
                                      },
                                      child: Text(
                                        "Collect",
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      title: "Pick up",
                    ),
                  ),
                ],
              ),
              Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pickup Address",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.place, color: Colors.white),
                          Text(
                            "Old town, Mombasa",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booked on",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.event, color: Colors.white),
                          Gap(2),
                          Text(
                            "27 August 2021, 7:03pm",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Gap(20),
              _currentLocationRow("Current Location", "Miritini"),
              Gap(20),
              _pickupLocationRow("30KM to the next point"),
              Gap(20),
              _currentLocationRow("Pickup Location", "Mairakani, Mombasa"),
              Gap(20),
              _pickupLocationRow("6.4KM to the next point"),
              Gap(20),
              Row(
                children: [
                  Icon(Icons.place, color: Colors.red),
                  Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Drop-off Station",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                        ),
                      ),
                      TitleText(
                        text: "Mombasa Transfer Station",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ],
                  )
                ],
              ),
              Gap(10),
              _summaryContainer(
                  title: "Pickup Address", value: "Mombasa, Kenya"),
              _summaryContainer(title: "Booking for", value: "Residential"),
              _summaryContainer(
                  title: "Pickup Date & Time",
                  value: "We will reach out to confirm"),
              _summaryContainer(title: "How Often", value: "One Time"),
              _summaryContainer(title: "Type of Waste", value: "Paper"),
              _summaryContainer(title: "No. of Waste Bags", value: "1"),
              Gap(10),
              CustomOrangeButton(onPressed: () {}, title: "Cancel"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentLocationRow(String label, String text) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
            border: Border.all(color: Colors.white, width: 4.0),
          ),
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(.7),
              ),
            ),
            TitleText(
              text: text,
              color: Colors.white,
              fontSize: 18,
            ),
          ],
        )
      ],
    );
  }

  Widget _pickupLocationRow(String text) {
    return Row(
      children: [
        Gap(10),
        Expanded(
          child: FittedBox(
            child: Text(
              "-----------------------------------------------------------------",
              style: TextStyle(
                color: Colors.white.withOpacity(.6),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Text(
            text,
            style: TextStyle(color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }

  Widget _summaryContainer({required String title, required String value}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey.withOpacity(.2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            text: title,
            color: Colors.white,
            fontSize: 15,
          ),
          Gap(5),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 19),
          )
        ],
      ),
    );
  }
}
