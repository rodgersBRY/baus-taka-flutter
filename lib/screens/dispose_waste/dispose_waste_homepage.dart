// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:baus_taka/widgets/shared_widgets/two_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/custom_input_text.dart';
import '../../widgets/shared_widgets/progress_rounded_containers.dart';
import '../../widgets/shared_widgets/title_text.dart';
import './waste_type_page.dart';

class DisposeWasteHomepage extends StatelessWidget {
  DisposeWasteHomepage({super.key});

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
        appBar: twoWidgetAppBar(title: "Dispose Waste", context: context),
        body: SlidingUpPanel(
          color: Colors.transparent,
          maxHeight: MediaQuery.of(context).size.height * .5,
          minHeight: MediaQuery.of(context).size.height * .5,
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: _kInitialPosition,
              ),
              Column(
                children: [
                  Container(
                    height: 70,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        circularContainer(AppColors.primaryColor),
                        dashedContainer(Colors.grey.withOpacity(.4)),
                        borderContainer(),
                        dashedContainer(Colors.grey.withOpacity(.4)),
                        borderContainer(),
                        dashedContainer(Colors.grey.withOpacity(.4)),
                        borderContainer(),
                      ],
                    ),
                  ),
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
                              child: CustomInputArea(
                                editingController: _searchController,
                                focusNode: _searchFocusNode,
                                hintText: "Search your location",
                              ),
                            ),
                            Gap(10),
                            Visibility(
                              visible: !_searchFocusNode.hasFocus,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.gps_fixed,
                                    color: Colors.white, size: 30),
                              ),
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

  RxInt selectedRadioTile = 1.obs;

  setSelectedRadioTile(int val) {
    selectedRadioTile.value = val;
  }

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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.home_outlined, size: 30),
                title: TitleText(
                  text: "Residential",
                  color: Colors.black,
                  fontSize: 18,
                ),
                trailing: Obx(() => Radio(
                      fillColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                      value: 1,
                      groupValue: selectedRadioTile.value,
                      onChanged: (val) {
                        setSelectedRadioTile(val!);
                      },
                    )),
              ),
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              child: ListTile(
                  leading: Icon(Icons.home_outlined, size: 30),
                  title: TitleText(
                    text: "Commercial",
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  trailing: Obx(() => Radio(
                        fillColor:
                            MaterialStateProperty.all(AppColors.primaryColor),
                        value: 2,
                        groupValue: selectedRadioTile.value,
                        onChanged: (val) {
                          setSelectedRadioTile(val!);
                        },
                      ))
                  // onTap: setSelectedRadioTile(2),
                  ),
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              child: ListTile(
                  leading: Icon(Icons.home_outlined, size: 30),
                  title: TitleText(
                    text: "Corporate",
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  trailing: Obx(() => Radio(
                        fillColor:
                            MaterialStateProperty.all(AppColors.primaryColor),
                        value: 3,
                        groupValue: selectedRadioTile.value,
                        onChanged: (val) {
                          setSelectedRadioTile(val!);
                        },
                      ))
                  // onTap: setSelectedRadioTile(3),
                  ),
            ),
            Gap(30),
            CustomButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WasteTypePage()));
                },
                title: "Next step"),
            Expanded(child: Container()),
            Image.asset("assets/bottom_people.png"),
          ],
        ),
      ),
    );
  }
}
