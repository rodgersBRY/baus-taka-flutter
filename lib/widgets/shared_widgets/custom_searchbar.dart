import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController editingController;
  final FocusNode focusNode;
  final String hintText;

  const CustomSearchBar({
    super.key,
    required this.editingController,
    required this.focusNode,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 239, 239),
        borderRadius: BorderRadiusDirectional.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: editingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            suffixIcon: SvgPicture.asset(
              "assets/icons/magnifying-glass.svg",
              height: 10,
              width: 10,
            ),
          ),
        ),
      ),
    );
  }
}
