
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';
import '../../widgets/shared_widgets/two_widget_appbar.dart';
import './review_details_page.dart';

class ReviewProductsPage extends StatelessWidget {
  const ReviewProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: twoWidgetAppBar(title: "Review Products"),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _scrollTabItem(Icons.check, "Placed", true),
                    Gap(30),
                    _scrollTabItem(Icons.checklist_rtl, "Delivered", false),
                    Gap(30),
                    _scrollTabItem(Icons.checklist_rtl, "Collected", false),
                  ],
                ),
              ),
            ),
            Gap(30),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/env_3.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Gap(2),
                            Text(
                              "5/5",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(80),
                  Container(
                    color: Colors.black.withOpacity(.5),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _itemDescriptionWidget("Product Name", "Hydro Flask"),
                        Gap(10),
                        _itemDescriptionWidget("Date", "27 May from 09:00"),
                        Gap(10),
                        _itemDescriptionWidget("Order ID", "#876578"),
                        Gap(10),
                        _itemDescriptionWidget("Amount", "Ksh. 800.00"),
                        Gap(10),
                        _itemDescriptionWidget("Status", "Delivered"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ReviewDetailsPage()));
                    },
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.rate_review,
                              color: AppColors.primaryColor),
                          Gap(10),
                          TitleText(
                            text: "Review",
                            color: AppColors.primaryColor,
                            fontSize: 17,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemDescriptionWidget(String label, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleText(
          text: label,
          color: Colors.white,
          fontSize: 15,
        ),
        TitleText(
          text: text,
          color: Colors.white,
          fontSize: 15,
        ),
      ],
    );
  }

  Widget _scrollTabItem(IconData icon, String label, bool active) {
    return Container(
      width: 150,
      child: Row(
        children: [
          Icon(icon, color: active ? Colors.green : Colors.grey),
          Gap(5),
          Text(
            label,
            style: TextStyle(color: active ? Colors.green : Colors.grey),
          ),
        ],
      ),
    );
  }
}
