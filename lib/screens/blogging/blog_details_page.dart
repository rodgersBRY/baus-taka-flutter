import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_input_text.dart';
import '../../widgets/shared_widgets/title_text.dart';

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
              icon: SvgPicture.asset(
                "assets/icons/vertical-dots.svg",
                width: 30,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              color: Colors.black,
            ),
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
                                  size: 30,
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
                                  Icons.favorite_border,
                                  size: 30,
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
                                SvgPicture.asset(
                                  "assets/icons/share.svg",
                                  width: 30,
                                ),
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
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                color: Colors.grey.withOpacity(.3),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return ListTile(
                    minVerticalPadding: 15.0,
                    leading: CircleAvatar(
                      child: Text('JK'),
                      radius: 30,
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Mary Odoo",
                              style: TextStyle(fontSize: 19),
                            ),
                            Text(
                              "Awesome",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Gap(15),
                        Text(
                          "4 mins ago",
                          style: TextStyle(color: AppColors.placeholderColor),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 60,
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            size: 30,
                          ),
                          Gap(5),
                          Text(
                            "0",
                            style: TextStyle(
                                color: AppColors.placeholderColor,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: 3,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         leading: CircleAvatar(
              //           child: Text('JK'),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey.withOpacity(.6),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.attach_file_outlined),
              ),
              Expanded(
                child: CustomInputArea(
                  editingController: commentController,
                  focusNode: commentFocusNode,
                  hintText: "Comment here",
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.send)),
            ],
          ),
        ));
  }
}
