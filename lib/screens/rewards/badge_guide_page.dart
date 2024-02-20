import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

class BadgGuidePage extends StatelessWidget {
  const BadgGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
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
          );
        }),
        title: TitleText(
          text: "Badge Guide",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              _guideItem(
                context,
                "Your Path to Eco Achievement",
                "Welcome to our Badge Guide! This is your journey towards becoming an eco-savvy champion. Here's what you need to know:",
              ),
              Gap(20),
              _guideItemWithImage(
                context,
                "Green Guru Badge: ",
                "Start your green journey here. Earn this badge by completing the first set of eco-friendly actions. Remember, each step brings you closer to making a real difference.",
                "assets/medal.png",
              ),
              Gap(20),
              _guideItemWithImage(
                context,
                "Eco Explore Badge: ",
                "You're stepping up your game! To earn the Green Guru badge, build on your eco exploration. Complete more tasks and embrace sustainable living with enthusiasm.",
                "assets/silver_medal.png",
              ),
              Gap(20),
              _guideItemWithImage(
                context,
                "Planet Protector Badge",
                "Congratulations, you're a true eco-hero! The Planet Protector badge is the pinnacle of achievement. Only those who've truly embraced a green lifestyle can unlock this badge.",
                "assets/trophy_cup.png",
              ),
              Gap(20),
              _guideItem(
                context,
                "Redeeming Points: ",
                "As you complete badges, you'll earn points. Points can be redeemed exclusively into your app wallet. Use them for discounts on app services and Ecoshop purchases.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _guideItem(BuildContext context, String title, String info) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
          ),
          Gap(5),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColors.placeholderColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _guideItemWithImage(
      BuildContext context, String title, String info, String imagePath) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              Image.asset(imagePath, width: 40),
            ],
          ),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColors.placeholderColor,
            ),
          ),
        ],
      ),
    );
  }
}
