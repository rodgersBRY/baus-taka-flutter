import 'package:baus_taka/utils/app_colors.dart';
import 'package:baus_taka/widgets/shared_widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../widgets/shared_widgets/custom_searchbar.dart';
import 'my_cart.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({super.key});

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
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
        title: CustomSearchBar(
          focusNode: searchFocusNode,
          editingController: searchController,
          hintText: "Search",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyCartPage()));
            },
            icon: SvgPicture.asset(
              "assets/icons/shopping-cart-active.svg",
              color: AppColors.primaryColor,
              width: 40,
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
                    padding: const EdgeInsets.only(left: 15),
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
