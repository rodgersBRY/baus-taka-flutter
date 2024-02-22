import 'package:baus_taka/screens/blogging/blog_homepage.dart';
import 'package:baus_taka/screens/dashboard/homepage.dart';
import 'package:baus_taka/screens/ecoshop/homepage.dart';
import 'package:baus_taka/screens/events_section/events_homepage.dart';
import 'package:baus_taka/screens/explore_section/explore_posts_page.dart';
import 'package:baus_taka/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1,
      notchMargin: 5.0,
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => EcoHomepage()));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/icons/shop-outlined.svg",
                  width: 40,
                ),
                Expanded(
                  child: Text(
                    "Eco Shop",
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BlogHomePage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icons/blog-outline.svg",
                    width: 40,
                  ),
                  Expanded(
                      child: Text(
                    "Blog",
                  ))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EventsHomePage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icons/events-outline.svg",
                    width: 40,
                  ),
                  Expanded(
                      child: Text(
                    "Events",
                  ))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ExplorePostsPage()),
        );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icons/explore-outline.svg",
                    width: 40,
                  ),
                  Expanded(
                      child: Text(
                    "Explore",
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DashboardHomepage()),
        );
      },
      child: SvgPicture.asset(
        "assets/icons/home-outline.svg",
        width: 25,
        color: Colors.white,
      ),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    );
  }
}
