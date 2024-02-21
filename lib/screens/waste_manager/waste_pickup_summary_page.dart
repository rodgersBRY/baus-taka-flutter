import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class WastePickupSummaryPage extends StatelessWidget {
  WastePickupSummaryPage({super.key});

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
          text: "Pick up Waste",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
        actions: [
          Obx(
            () => Switch(
                activeColor: AppColors.primaryColor,
                trackColor: MaterialStateProperty.all(Colors.white),
                value: _switchVal.value,
                onChanged: (val) {
                  _switchVal.value = val;
                }),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: _kInitialPosition,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
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
                              child: TitleText(
                                text: "Summary",
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(10),
            _summaryContainer(title: "Pickup Address", value: "Mombasa, Kenya"),
            _summaryContainer(title: "Booking for", value: "Residential"),
            _summaryContainer(
                title: "Pickup Date & Time",
                value: "We will reach out to confirm"),
            _summaryContainer(title: "How Often", value: "One Time"),
            _summaryContainer(title: "Type of Waste", value: "Paper"),
            _summaryContainer(title: "No. of Waste Bags", value: "1"),
            Gap(20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.chevron_left,
                        size: 40,
                        color: AppColors.primaryColor,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => WasteSummaryPage()));
                      },
                      title: "Start",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
            color: Colors.black,
            fontSize: 15,
          ),
          Gap(5),
          Text(
            value,
            style: TextStyle(color: Colors.black, fontSize: 19),
          )
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
