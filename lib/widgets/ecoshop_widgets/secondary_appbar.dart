import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

AppBar secondaryAppBarWidget(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
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
    title: TitleText(
      color: AppColors.primaryColor,
      fontSize: 27,
      text: title,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/shop-outlined.svg",
          width: 35,
          color: AppColors.primaryColor,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        color: Colors.black,
      ),
    ],
  );
}

class SecondaryAppBar extends StatelessWidget {
  final String title;

  SecondaryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
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
      title: TitleText(
        color: AppColors.primaryColor,
        fontSize: 27,
        text: title,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.storefront_outlined,
            size: 30,
            color: AppColors.primaryColor,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          color: Colors.black,
        ),
      ],
    );
  }
}
