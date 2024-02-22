import 'dart:ui';

import 'package:baus_taka/screens/explore_section/community_details_page.dart';
import 'package:baus_taka/screens/explore_section/new_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/ecoshop_widgets/readmore_text.dart';
import '../../widgets/shared_widgets/title_text.dart';
import 'post_details_page.dart';

// ignore: must_be_immutable
class ExplorePostsPage extends StatelessWidget {
  ExplorePostsPage({super.key});

  RxBool showAutofilledBox = true.obs;
  // RxBool showSearchField = false.obs;

  RxString selectedContent = "Posts".obs;
  RxInt qty = 0.obs;
  String productText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
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
          text: "Explore",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // showSearchField.value = true;
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
          Obx(
            () => Visibility(
              visible: showAutofilledBox.value,
              child: Container(
                width: MediaQuery.of(context).size.width * .95,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 58, 148, 61),
                      Color.fromARGB(255, 70, 197, 75),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    Text(
                      "Post Published successfully",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        showAutofilledBox.value = false;
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _scrollTabItem(Icons.recycling, "Posts"),
                Gap(30),
                _scrollTabItem(Icons.nature, "Challenges"),
                Gap(30),
                _scrollTabItem(Icons.newspaper, "Communities"),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => PageView(
                children: [
                  if (selectedContent.value == "Posts")  _postsPageView(context),
                  if (selectedContent.value == "Challenges")
                    ListView(
                      children: [
                        ...List.generate(
                          2,
                          (index) => _challengesPageView(context),
                        ),
                        Gap(30),
                      ],
                    ),
                  if (selectedContent.value == "Communities")
                    // Widgets to display communities content
                    ListView(
                      children: [
                        ...List.generate(
                          1,
                          (index) => _communitiesPageView(context),
                        ),
                        Gap(30),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ExploreNewPostPage()));
        },
        child: Image.asset(
          "assets/add_text_icon.png",
          width: 25,
        ),
      ),
    );
  }

  Widget _scrollTabItem(IconData icon, String label) {
    // final isActive = label == selectedContent.value;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        selectedContent.value = label;
      },
      child: Container(
        width: 150,
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.grey),
            ),
            Gap(5),
            Icon(icon, color: Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _postsPageView(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(.4),
                        radius: 25,
                        child: Image.asset(
                          "assets/logo_outline.png",
                          width: 30,
                        ),
                      ),
                      Gap(10),
                      Text(
                        "Alecky",
                        style: TextStyle(
                          color: AppColors.placeholderColor,
                          fontSize: 19,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "1 week ago",
                  style: TextStyle(
                    color: AppColors.placeholderColor,
                    fontSize: 19,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ReadMoreText(text: productText, maxLength: 100),
          ),
          Gap(10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PostDetailsPage()),
              );
            },
            child: Container(
              height: 320,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/cbo_1.jpg"),
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
                            color: Colors.black.withOpacity(.7),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            "1/2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.black.withOpacity(.4),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                  Gap(5),
                                  Text(
                                    "739",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.forum_outlined,
                                    color: Colors.white,
                                  ),
                                  Gap(5),
                                  Text(
                                    "3 comments",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _challengesPageView(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(.4),
                        radius: 25,
                        child: Image.asset(
                          "assets/logo_outline.png",
                          width: 30,
                        ),
                      ),
                      Gap(10),
                      Text(
                        "Alecky",
                        style: TextStyle(
                          color: AppColors.placeholderColor,
                          fontSize: 19,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "1 week ago",
                  style: TextStyle(
                    color: AppColors.placeholderColor,
                    fontSize: 19,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ReadMoreText(text: productText, maxLength: 100),
          ),
          Gap(10),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 320,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/cbo_1.jpg"),
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
                            color: Colors.black.withOpacity(.7),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            "1/2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.black.withOpacity(.4),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                  Gap(5),
                                  Text(
                                    "739",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.forum_outlined,
                                    color: Colors.white,
                                  ),
                                  Gap(5),
                                  Text(
                                    "3 comments",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.groups,
                                    color: Colors.white,
                                  ),
                                  Gap(5),
                                  Text(
                                    "32 participants",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _communitiesPageView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CommunityDetailsPage()));
      },
      child: Container(
        height: 320,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/cbo_1.jpg"),
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
                      color: Colors.black.withOpacity(.4),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.pending_actions,
                          color: Colors.white,
                        ),
                        Gap(4),
                        Text(
                          "Pending",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.4),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      "1/4",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(.4),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: "CBO 1",
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                ),
                                Gap(4),
                                Text(
                                  "Old town, Mombasa",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.event,
                                  color: Colors.white,
                                ),
                                Gap(4),
                                Text(
                                  "27 May from 09:00",
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
          ],
        ),
      ),
    );
  }
}
