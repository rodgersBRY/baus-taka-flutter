import 'package:baus_taka/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/shared_widgets/custom_input_text.dart';
import '../../widgets/shared_widgets/title_text.dart';

class ExploreNewPostPage extends StatelessWidget {
  ExploreNewPostPage({super.key});

  final commentsController = TextEditingController();
  final commentsFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: TitleText(
          text: "New Post",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => NewCBOPage()));
            },
            child: Container(
              width: 80,
              // padding: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                child: Text(
                  "Post",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 17),
                ),
              ),
            ),
          ),
          Gap(10),
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
                hintText: "What's on your mind",
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
