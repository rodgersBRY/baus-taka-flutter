import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_searchbar.dart';
import '../../widgets/ecoshop_widgets/category_item.dart';
import '../../widgets/ecoshop_widgets/grid_item.dart';
import '../../widgets/shared_widgets/bottom_navigation.dart';
import '../../widgets/shared_widgets/slider_indicator.dart';
import '../../widgets/shared_widgets/title_text.dart';
import './my_cart.dart';

class EcoHomepage extends StatefulWidget {
  EcoHomepage({super.key});

  @override
  State<EcoHomepage> createState() => _EcoHomepageState();
}

class _EcoHomepageState extends State<EcoHomepage> {
  final FocusNode searchFocusNode = FocusNode();

  final TextEditingController searchController = TextEditingController();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        searchFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: CustomSearchBar(
            focusNode: searchFocusNode,
            editingController: searchController,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyCartPage()));
              },
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Gap(10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              height: 200,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage('assets/env_1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(fontSize: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                              child: Text("Products for a Greener tomorrow"),
                            ),
                          ),
                          Gap(30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                3,
                                (index) => Indicator(
                                  isActive:
                                      _selectedIndex == index ? true : false,
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleText(
                      text: "Categories",
                      color: Colors.black,
                      fontSize: 19,
                    ),
                    TitleText(
                      text: "See all",
                      color: AppColors.gradientColor,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryWidget(
                      imagePath: "assets/flask.webp", title: "Bottles"),
                  CategoryWidget(imagePath: "assets/bags.webp", title: "Bags"),
                  CategoryWidget(
                      imagePath: "assets/wraps.webp", title: "Wraps"),
                  CategoryWidget(
                      imagePath: "assets/cutlery.webp", title: "Cutlery"),
                ],
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleText(
                      text: "Best Selling",
                      color: Colors.black,
                      fontSize: 19,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt_outlined, size: 30),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GridItem();
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomFloatingButton(),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
