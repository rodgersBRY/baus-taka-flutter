import 'dart:ui';

import 'package:baus_taka/screens/pickups/pickup_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class PickupsHomePage extends StatelessWidget {
  PickupsHomePage({super.key});

  static final LatLng _kMapCenter =
      LatLng(-1.2733806337508538, 36.8143121620124);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

  List<Map<String, dynamic>> _pickupList = [
    {
      "status": "Accepted",
      "location": "Old town, Mombasa",
      "date": "27 August 2021, 7:03pm",
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
          text: "Pickups",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
        actions: [
          _pickupList.isEmpty
              ? IconButton(
                  onPressed: () {
                    //   Navigator.of(context)
                    //       .push(MaterialPageRoute(builder: (context) => MyCartPage()));
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 30,
                    color: Colors.black,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  color: Colors.black,
                )
              : IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => NewReportPage()),
                    // );
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/magnifying-glass.svg",
                    width: 30,
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
              child: _pickupList.isEmpty
                  ? _noPickupsContainer(context)
                  : ListView.builder(
                      itemCount: _pickupList.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => PickupDetailsPage()),
                            );
                          },
                          child: Container(
                            height: 250,
                            margin: const EdgeInsets.only(bottom: 30.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: GoogleMap(
                                    initialCameraPosition: _kInitialPosition,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(14.0)),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4.0, sigmaY: 4.0),
                                        child: Container(
                                          width: double.infinity,
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
                                          child: Center(
                                            child: Text(
                                              "Disposal - ${_pickupList[index]['status']}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(14.0),
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5.0, sigmaY: 5.0),
                                        child: Container(
                                          // height: 90,
                                          color: Colors.black.withOpacity(.4),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  _rowContainer("Placed"),
                                                  _rowContainer("Confirmed"),
                                                  _rowContainer("Picked Up"),
                                                ],
                                              ),
                                              Gap(15),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          color: Colors.white,
                                                        ),
                                                        Gap(4),
                                                        Text(
                                                          _pickupList[index]
                                                              ['location'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
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
                                                          _pickupList[index]
                                                              ['date'],
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

  Widget _noPickupsContainer(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Container(
            child: Image.asset(
              "assets/upcoming_pickup.png",
              fit: BoxFit.cover,
              width: 300,
            ),
          ),
          Gap(30),
          Text(
            "No Upcoming Pickups",
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
    );
  }

  Widget _rowContainer(String label) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        Gap(8),
        Container(
          width: 120,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
