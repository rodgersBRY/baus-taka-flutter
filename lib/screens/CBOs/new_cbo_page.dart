import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

class NewCBOPage extends StatelessWidget {
  NewCBOPage({super.key});

  final _cboTitleTextController = TextEditingController();
  final _descTextController = TextEditingController();
  final _cboFocusNode = FocusNode();
  final _descFocusNode = FocusNode();

  static final LatLng _kMapCenter =
      LatLng(-1.2733806337508538, 36.8143121620124);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          text: "New CBO",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is the name/title of the CBO?",
              style: TextStyle(fontSize: 18),
            ),
            Gap(10),
            TextField(
              focusNode: _cboFocusNode,
              controller: _cboTitleTextController,
              decoration: InputDecoration(
                hintText: "10",
                hintStyle: TextStyle(color: AppColors.placeholderColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.placeholderColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.placeholderColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.placeholderColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Gap(20),
            Text(
              "Tell us more about it",
              style: TextStyle(fontSize: 18),
            ),
            Gap(10),
            TextField(
              focusNode: _descFocusNode,
              controller: _descTextController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(color: AppColors.placeholderColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.placeholderColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.placeholderColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.placeholderColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Gap(20),
            Text(
              "Add upto 5 photos",
              style: TextStyle(fontSize: 18),
            ),
            Gap(10),
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
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  4,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 12.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/env_1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.close,
                                color: Colors.white, size: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 58, 148, 61),
                                  Color.fromARGB(255, 70, 197, 75),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              color: AppColors.gradientColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Icon(
                    Icons.add_circle,
                    color: AppColors.primaryColor,
                    size: 35,
                  ),
                ),
              ],
            ),
            Gap(20),
            Text(
              "Where is the CBO Located",
              style: TextStyle(fontSize: 18),
            ),
            Gap(10),
            Expanded(
              child: Container(
                height: 200,
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(14.0)),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Old town, Mombasa",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             PaymentPage()));
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Change",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
