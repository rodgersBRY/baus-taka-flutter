import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../models/events_model.dart';
import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class EventsDetailsPage extends StatelessWidget {
  final EventModel event;
  EventsDetailsPage({super.key, required this.event});

  final commentController = TextEditingController();
  final commentFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
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
          ),
          Gap(10),
          GestureDetector(
            onTap: () {},
            child: Container(
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
          ),
          Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 50.0),
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage(event.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    text: event.location,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  Icon(Icons.directions_outlined, color: Colors.white),
                ],
              ),
            ),
            Gap(30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    text: event.date,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  Icon(Icons.calendar_month_outlined, color: Colors.white),
                ],
              ),
            ),
            Container(
              height: 2,
              color: AppColors.placeholderColor.withOpacity(.1),
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TitleText(
                text: event.title,
                color: Colors.black,
                fontSize: 26,
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                event.details,
                style: TextStyle(fontSize: 17),
              ),
            ),
            Gap(20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  ...List.generate(
                    event.hashTags.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "#${event.hashTags[index]}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              margin:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 58, 148, 61),
                    Color.fromARGB(255, 70, 197, 75),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10),
                color: AppColors.gradientColor,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle, color: Colors.white),
                    Gap(5),
                    Text(
                      "Join Event",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
