import 'package:baus_taka/utils/app_colors.dart';
import 'package:baus_taka/widgets/shared_widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/custom_searchbar.dart';
import 'my_cart.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({super.key});

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
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
        title: CustomSearchBar(
          focusNode: searchFocusNode,
          editingController: searchController,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyCartPage()));
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
          Center(
            child: TitleText(
              text: "Pick a category",
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: 17,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleText(
                          text: "Bottles",
                          color: AppColors.primaryColor,
                          fontSize: 19,
                        ),
                        Container(
                          width: 100,
                          child: Image.asset(
                            "assets/wraps.webp",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          blurRadius: 2,
                          spreadRadius: 2.0,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
