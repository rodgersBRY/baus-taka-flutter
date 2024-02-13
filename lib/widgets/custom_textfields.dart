import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController editingController;
  final FocusNode focusNode;

  const EmailTextField(
      {super.key, required this.editingController, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: editingController,
      decoration: InputDecoration(
        hintText: "Your Email",
        hintStyle: TextStyle(color: AppColors.placeholderColor),
        prefixIcon: Icon(Icons.email, color: AppColors.placeholderColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.placeholderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.placeholderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.placeholderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController editingController;
  final FocusNode focusNode;

  const CustomPasswordTextField({
    super.key,
    required this.hintText,
    required this.editingController,
    required this.focusNode,
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: widget.editingController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.placeholderColor),
        prefixIcon: Icon(Icons.lock, color: AppColors.placeholderColor),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.placeholderColor),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.placeholderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.placeholderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.placeholderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
