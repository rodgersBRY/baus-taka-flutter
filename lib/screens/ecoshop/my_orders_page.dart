import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TitleText(
          color: AppColors.primaryColor,
          text: "My Orders",
          fontSize: 23,
        ),
      ),
    );
  }
}
