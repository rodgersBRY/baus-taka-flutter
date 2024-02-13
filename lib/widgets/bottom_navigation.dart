import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_bag, size: 40),
                Expanded(
                  child: Text(
                    "Eco Shop",
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/icons/blog_icon.png",
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
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/icons/events_icon.png",
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
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/icons/explore_icon.png",
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
      onPressed: () {},
      child: Image.asset(
        "assets/icons/home_icon.png",
        width: 30,
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      shape: CircleBorder(),
    );
  }
}
