
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../screens/ecoshop/my_cart.dart';
import '../custom_searchbar.dart';

class TopBar extends StatelessWidget {
  final FocusNode searchFocusNode;
  final TextEditingController searchController;

  TopBar(
      {super.key,
      required this.searchFocusNode,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
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
          ),
          Gap(10),
          Expanded(
            child: CustomSearchBar(
              editingController: searchController,
              focusNode: searchFocusNode,
            ),
          ),
          Gap(10),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyCartPage()));
            },
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
