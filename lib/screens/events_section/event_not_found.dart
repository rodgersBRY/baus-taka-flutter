import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_searchbar.dart';

// ignore: must_be_immutable
class EventsNotFoundPage extends StatelessWidget {
  EventsNotFoundPage({super.key});

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

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
      body: Column(
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
          Gap(80),
          Container(
            child: Image.asset(
              "assets/not_found.png",
              fit: BoxFit.cover,
            ),
          ),
          Gap(30),
          Text(
            "NO beach cleanup events",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54,
            ),
          ),
          Expanded(child: Container()),
        ],
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
