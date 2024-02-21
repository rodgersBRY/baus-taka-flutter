import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/ecoshop_widgets/readmore_text.dart';
import '../../widgets/shared_widgets/custom_input_text.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class PostDetailssPage extends StatelessWidget {
  PostDetailssPage({super.key});

  final commentsController = TextEditingController();
  final commentsFocusNode = FocusNode();

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
          text: "Post",
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: ReadMoreText(text: productText, maxLength: 200),
          ),
          Gap(10),
          Container(
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
          Gap(20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                        "James Kariuki",
                        style: TextStyle(
                          color: AppColors.placeholderColor,
                          fontSize: 19,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "3 days ago",
                        style: TextStyle(
                          color: AppColors.placeholderColor,
                          fontSize: 19,
                        ),
                      ),
                      Gap(10),
                      Icon(Icons.favorite_outline),
                      Gap(5),
                      Text(
                        "8",
                        style: TextStyle(
                          color: AppColors.placeholderColor,
                          fontSize: 19,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Very beautiful! Where is it located?",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.withOpacity(.1),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.attach_file_outlined),
            ),
            Expanded(
              child: CustomInputArea(
                editingController: commentsController,
                focusNode: commentsFocusNode,
                hintText: "Comment here",
              ),
            ),  
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.near_me,
                size: 30,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
