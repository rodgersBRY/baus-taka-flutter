import 'package:baus_taka/widgets/shared_widgets/two_widget_appbar.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_input_text.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final _chatController = TextEditingController();
  final _chatFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: twoWidgetAppBar(title: "Chat", context: context),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(164, 211, 211, 211),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.attach_file_outlined),
              ),
              Expanded(
                child: CustomInputArea(
                    editingController: _chatController,
                    focusNode: _chatFocusNode,
                    hintText: "Write message here..."),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: AppColors.primaryColor,
                  )),
            ],
          ),
        ));
  }
}
