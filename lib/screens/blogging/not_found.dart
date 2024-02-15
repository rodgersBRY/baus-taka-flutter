import 'package:baus_taka/widgets/shared_widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/custom_searchbar.dart';

class NotFoundPage extends StatelessWidget {
  NotFoundPage({super.key});

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          hintText: "Search",
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _scrollTabItem(Icons.recycling, "Recycling", true),
                  Gap(30),
                  _scrollTabItem(Icons.nature, "Environment", false),
                  Gap(30),
                  _scrollTabItem(Icons.newspaper, "News", false),
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
                  text: "Not Found",
                  color: Colors.black,
                  fontSize: 27,
                ),
                Gap(20),
                Text(
                  "We're sorry, the keyword you were looking for could not be found. Please search with another keyword",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
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
