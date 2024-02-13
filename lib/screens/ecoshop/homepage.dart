import 'package:baus_taka/utils/app_colors.dart';
import 'package:baus_taka/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/custom_searchbar.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Gap(10),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_bag,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Gap(10),
                Expanded(
                  child: CustomSearchBar(
                    focusNode: searchFocusNode,
                    editingController: searchController,
                  ),
                ),
                Gap(10),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
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
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage('assets/env_1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                      isActive: _selectedIndex == index
                                          ? true
                                          : false)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomFloatingButton(),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      width: isActive ? 22.0 : 8.0,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
