import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/custom_textfields.dart';
import '../../widgets/shared_widgets/two_widget_appbar.dart';

class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({super.key});

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: twoWidgetAppBar(title: "Update Profile", context: context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Gap(60),
              Center(
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.primaryColor, width: 3),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/flask.webp",
                            width: 150,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(5),
                          child: Icon(Icons.edit, color: Colors.white),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 58, 148, 61),
                                Color.fromARGB(255, 70, 197, 75),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.gradientColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(30),
              CustomTextField(
                editingController: _nameTextController,
                focusNode: _nameFocusNode,
                prefixIcon: Icons.person,
                hintText: "Alecky",
              ),
              Gap(30),
              CustomTextField(
                editingController: _emailTextController,
                focusNode: _emailFocusNode,
                prefixIcon: Icons.mail_outline,
                hintText: "abc@gmail.com",
              ),
              Gap(30),
              CustomTextField(
                editingController: _phoneTextController,
                focusNode: _phoneFocusNode,
                prefixIcon: Icons.phone_outlined,
                hintText: "0712345678",
              ),
              Gap(30),
              CustomPasswordTextField(
                hintText: "************",
                editingController: _passwordTextController,
                focusNode: _passwordFocusNode,
              ),
              Gap(30),
              CustomButton(onPressed: () {}, title: "Update"),
            ],
          ),
        ),
      ),
    );
  }
}
