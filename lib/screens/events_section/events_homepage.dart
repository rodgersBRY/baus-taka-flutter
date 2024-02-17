import 'dart:ui';

import 'package:baus_taka/screens/events_section/event_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../models/events_model.dart';
import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_searchbar.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class EventsHomePage extends StatelessWidget {
  EventsHomePage({super.key});

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  List<EventModel> _eventItems = [
    EventModel(
      title: "Paris Bridge Community Cleanup",
      location: "Old Town, Mombasa",
      date: "27 May from 09:00",
      details:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
      hashTags: ["BEACHLEANUP", "BAUS"],
      imageUrl: "assets/events_1.jpg",
    ),
    EventModel(
      title: "Paris Bridge Community Cleanup",
      location: "Old Town, Mombasa",
      date: "27 May from 09:00",
      details:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
      hashTags: ["BEACHLEANUP", "BAUS"],
      imageUrl: "assets/events_2.jpg",
    ),
    EventModel(
      title: "Paris Bridge Community Cleanup",
      location: "Old Town, Mombasa",
      date: "27 May from 09:00",
      details:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
      hashTags: ["BEACHLEANUP", "BAUS"],
      imageUrl: "assets/events_3.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_left,
            size: 30,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          color: Colors.black,
        ),
        title: CustomSearchBar(
          focusNode: searchFocusNode,
          editingController: searchController,
          hintText: "Search Events",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => MyCartPage()));
            },
            icon: SvgPicture.asset(
              "assets/icons/fire.svg",
              width: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  Expanded(child: _outlinedButton(() {}, "All")),
                  Gap(20),
                  Expanded(child: _outlinedButton(() {}, "Upcoming")),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _eventItems.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EventsDetailsPage(
                                event: _eventItems[index],
                              )));
                    },
                    child: Container(
                      height: 320,
                      margin: const EdgeInsets.only(bottom: 30.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_eventItems[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.6),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.diversity_1_outlined,
                                        color: Colors.white,
                                      ),
                                      Gap(4),
                                      Text(
                                        "32",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.6),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.share_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          ClipRRect(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TitleText(
                                      text: _eventItems[index].title,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.white,
                                              ),
                                              Gap(4),
                                              Text(
                                                _eventItems[index].location,
                                                style: TextStyle(
                                                    color: Colors.white),
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
                                                _eventItems[index].date,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EventsDetailsPage(
                                        event: _eventItems[index],
                                      )));
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(14),
                                ),
                                border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.primaryColor, width: 2),
                                  left: BorderSide(
                                      color: AppColors.primaryColor, width: 2),
                                  right: BorderSide(
                                      color: AppColors.primaryColor, width: 2),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add,
                                      color: AppColors.primaryColor),
                                  Gap(5),
                                  Text(
                                    "Join Event",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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

  Widget _outlinedButton(VoidCallback onPressed, String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Ink(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
