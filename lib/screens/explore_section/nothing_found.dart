import 'package:baus_taka/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../widgets/shared_widgets/title_text.dart';

class ExploreNothingFoundPage extends StatelessWidget {
  ExploreNothingFoundPage({super.key});

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: TitleText(
          text: "Explore",
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _scrollTabItem(Icons.recycling, "Posts", true),
                  Gap(30),
                  _scrollTabItem(Icons.nature, "Challenges", false),
                  Gap(30),
                  _scrollTabItem(Icons.newspaper, "Communities", false),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            child: Image.asset(
              "assets/not_found.png",
              fit: BoxFit.cover,
            ),
          ),
          Gap(30),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: Column(
              children: [
                TitleText(
                  text: "Nothing Found",
                  color: Colors.black,
                  fontSize: 27,
                ),
                Gap(20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "tap to refresh",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        child: Image.asset(
          "assets/add_text_icon.png",
          width: 25,
        ),
      ),
    );
  }

  Widget _scrollTabItem(IconData icon, String label, bool active) {
    return Container(
      width: 150,
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(color: active ? Colors.green : Colors.grey),
          ),
          Gap(5),
          Icon(icon, color: Colors.green),
        ],
      ),
    );
  }
}
