import 'package:baus_taka/utils/app_colors.dart';
import 'package:baus_taka/widgets/custom_searchbar.dart';
import 'package:baus_taka/widgets/shared_widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class BlogDetailsPage extends StatelessWidget {
  BlogDetailsPage({super.key});

  final commentController = TextEditingController();
  final commentFocusNode = FocusNode();

  String productText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hasbeen the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ";

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
            IconButton(
              onPressed: () {
                //   Navigator.of(context)
                //       .push(MaterialPageRoute(builder: (context) => MyCartPage()));
              },
              icon: Icon(
                Icons.vertical_distribute_outlined,
                size: 30,
                color: Colors.black,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              color: Colors.black,
            ),
          ],
        ),
        body: SingleChildScrollView(
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
                    image: AssetImage("assets/env_3.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
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
                      children: [
                        Text("Admin",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        Text(
                          "3 days ago",
                          style: TextStyle(color: AppColors.placeholderColor),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.mode_comment_outlined,
                                ),
                                Gap(4),
                                Text("2"),
                              ],
                            ),
                          ),
                          Gap(10),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.heart_broken,
                                ),
                                Gap(4),
                                Text("738"),
                              ],
                            ),
                          ),
                          Gap(10),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.share),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
                  text: "WHAT IS WASTE SEPARATION?",
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              Gap(10),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    productText,
                    style: TextStyle(fontSize: 17),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey.withOpacity(.6),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.attachment),
              ),
              Expanded(
                child: CustomSearchBar(
                    editingController: commentController,
                    focusNode: commentFocusNode,
                    hintText: "Comment here"),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.send)),
            ],
          ),
        ));
  }
}
