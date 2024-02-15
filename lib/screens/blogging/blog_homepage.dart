import 'dart:ui';

import 'package:baus_taka/screens/blogging/blog_details_page.dart';
import 'package:baus_taka/utils/app_colors.dart';
import 'package:baus_taka/widgets/shared_widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/custom_searchbar.dart';

class BlogHomePage extends StatelessWidget {
  BlogHomePage({super.key});

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
          hintText: "Search",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => MyCartPage()));
            },
            icon: Icon(
              Icons.fireplace_sharp,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
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
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlogDetailsPage()));
                      },
                      child: _blogItem(),
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

  Widget _blogItem() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/env_3.jpg"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Expanded(child: Container()),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/logo_outline.png",
                              width: 150,
                            ),
                          ),
                        ),
                        Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleText(
                              text: "WHAT IS WASTE SEPARATION?",
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.heart_broken,
                                          color: Colors.white,
                                        ),
                                        Gap(4),
                                        Text(
                                          "7 likes",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gap(10),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.mode_comment_outlined,
                                          color: Colors.white,
                                        ),
                                        Gap(4),
                                        Text(
                                          "3 Comments",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gap(10),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.share,
                                          color: Colors.white,
                                        ),
                                        Gap(4),
                                        Text(
                                          "Share",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text("Admin",
                                    style: TextStyle(
                                        color: AppColors.placeholderColor)),
                                Gap(3),
                                Text("|",
                                    style: TextStyle(
                                        color: AppColors.placeholderColor)),
                                Gap(3),
                                Text("3 days ago",
                                    style: TextStyle(
                                        color: AppColors.placeholderColor)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
