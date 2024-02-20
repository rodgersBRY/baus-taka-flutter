// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/custom_input_text.dart';
import '../../widgets/shared_widgets/title_text.dart';

class NewReportPage extends StatelessWidget {
  NewReportPage({super.key});

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
              // Navigator.of(context).pop();
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
            text: "Illegal Dumping",
            color: AppColors.primaryColor,
            fontSize: 22,
          ),
        ),
        body: SlidingUpPanel(
          color: Colors.transparent,
          maxHeight: MediaQuery.of(context).size.height * .7,
          minHeight: MediaQuery.of(context).size.height * .3,
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

  final _messageTextController = TextEditingController();
  final _messageFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          controller: scrollController,
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
              height: 180,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 60,
                    color: AppColors.placeholderColor,
                  ),
                  Text(
                    "Upload Image",
                    style: TextStyle(
                      color: AppColors.placeholderColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10.0),
                border:
                    Border.all(color: AppColors.placeholderColor, width: .5),
              ),
            ),
            Gap(30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10.0),
                border: Border.all(color: AppColors.primaryColor, width: .5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  maxLines: 4,
                  controller: _messageTextController,
                  focusNode: _messageFocusNode,
                  decoration: InputDecoration(
                    hintText: "Message",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Gap(30),
            CustomButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => PlasticWasteTypePage()));
              },
              title: "Report",
            ),
            Gap(30),
            Container(
              height: 150,
              child: Image.asset(
                "assets/report_large.png",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}
