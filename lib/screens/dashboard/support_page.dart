import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/shared_widgets/title_text.dart';
import '../../widgets/shared_widgets/two_widget_appbar.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: twoWidgetAppBar(title: "Support", context: context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .2,
              child:
                  Image.asset("assets/support_image.png", fit: BoxFit.contain),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .7,
              margin: const EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                children: [
                  TitleText(
                    text: "Hey. We're here to help",
                    color: Colors.black,
                    fontSize: 28,
                  ),
                  Text(
                    "Got any question about our services? We are ready to assist and support you.",
                    style: TextStyle(color: Colors.grey, fontSize: 19.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            _supportContainer(
              title: "Chat With us",
              detail: "Talk to our agents",
              icon: Icons.question_answer,
              avatarColor: Colors.redAccent,
            ),
            _supportContainer(
              title: "Call us",
              detail: "(+254)755 001 001",
              icon: Icons.phone,
              avatarColor: Colors.purple,
            ),
            _supportContainer(
              title: "Mail Us",
              detail: "support@baustaka.co.ke",
              icon: Icons.mail,
              avatarColor: Colors.green,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 1, width: 100, color: Colors.grey),
                  Gap(10),
                  Text(
                    "Social",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Gap(10),
                  Container(height: 1, width: 100, color: Colors.grey),
                ],
              ),
            ),
            Gap(10),
            _supportContainer(
              title: "Facebook",
              detail: "Baustaka",
              icon: Icons.face,
              avatarColor: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _supportContainer({
    required String title,
    required String detail,
    required IconData icon,
    required Color avatarColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(5),
              Text(
                detail,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Expanded(child: Container()),
          CircleAvatar(
            child: Icon(icon, color: Colors.white),
            backgroundColor: avatarColor,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: .5),
      ),
    );
  }
}
