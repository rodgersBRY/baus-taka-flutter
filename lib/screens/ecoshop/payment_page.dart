import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class PaymentPage extends StatelessWidget {
  final _numberController = TextEditingController();
  final _numberFocusNode = FocusNode();

  RxInt characterCount = 0.obs;

  PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: GestureDetector(
        onTap: () {
          _numberFocusNode.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
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
              text: "Payment",
              fontSize: 23,
            ),
            bottom: TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(color: Colors.green),
              tabs: [
                Tab(
                  icon: Image.asset("assets/mpesa_logo.png", width: 70),
                ),
                Tab(
                  icon: Row(
                    children: [
                      Icon(
                        Icons.wallet,
                      ),
                      Gap(5),
                      Text(
                        "Wallet",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Tab(
                  icon: Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                      ),
                      Gap(5),
                      Text(
                        "CARD",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _mpesaTabContainer(context),
              _walletTabContainer(),
              _cardTabContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Container _mpesaTabContainer(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: "Phone Number",
                children: [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            Gap(10),
            Obx(
              () => TextField(
                keyboardType: TextInputType.number,
                controller: _numberController,
                focusNode: _numberFocusNode,
                onChanged: (val) {
                  characterCount.value = val.length;
                },
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: AppColors.placeholderColor),
                  suffix: characterCount.value != 10
                      ? Icon(Icons.error, color: Colors.red)
                      : Icon(Icons.check, color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.placeholderColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.placeholderColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              title: "Save & Exit",
            ),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }

  Container _walletTabContainer() {
    return Container(
      child: Column(
        children: [
          Text("wallet"),
        ],
      ),
    );
  }

  Container _cardTabContainer() {
    return Container(
      child: Column(
        children: [
          Text("card"),
        ],
      ),
    );
  }
}
