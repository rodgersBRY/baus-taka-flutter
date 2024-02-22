import 'dart:ui';

import 'package:baus_taka/screens/waste_manager/job_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class WastePickupJobsPage extends StatelessWidget {
  WastePickupJobsPage({super.key});

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
        actions: [
          IconButton(
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
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => JobDetailsPage()));
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        "Disposal - Pending",
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
                                    color: Colors.black.withOpacity(.4),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Pickup Address",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.place,
                                                    color: Colors.white),
                                                Text(
                                                  "Old town, Mombasa",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Booked on",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.event,
                                                    color: Colors.white),
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
