// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:baus_taka/widgets/shared_widgets/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/custom_input_text.dart';
import '../../widgets/shared_widgets/title_text.dart';

class PickupWastePage extends StatelessWidget {
  PickupWastePage({super.key});

  RxBool _switchVal = false.obs;

  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  static final LatLng _kMapCenter =
      LatLng(-1.2733806337508538, 36.8143121620124);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
            text: "Pickup Waste",
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
        body: SlidingUpPanel(
          color: Colors.transparent,
          maxHeight: MediaQuery.of(context).size.height * .4,
          minHeight: MediaQuery.of(context).size.height * .4,
          body: Container(
            child: Stack(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomInputArea(
                                  editingController: _searchController,
                                  focusNode: _searchFocusNode,
                                  hintText: "Search your location",
                                ),
                              ),
                              Gap(10),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.gps_fixed,
                                    color: Colors.white, size: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          panelBuilder: (controller) =>
              PanelWidget(scrollController: controller),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
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
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Gap(10),
            // drag handle bar
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .3,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.6),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Gap(30),
            Text(
              "Work Station",
              style: TextStyle(color: Colors.black, fontSize: 19),
            ),
            Gap(10),
            CustomOutlinedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => SelectSubscriptionPage()));
              },
              title: "Select",
            ),
            Gap(30),
            Container(
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
                      title: "Next Step",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Image.asset("assets/bottom_people.png")
          ],
        ),
      ),
    );
  }
}
