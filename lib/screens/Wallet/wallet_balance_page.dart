// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/title_text.dart';

class WalletBalancePage extends StatelessWidget {
  WalletBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
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
          );
        }),
        title: TitleText(
          text: "My Wallet",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.paid,
              size: 30,
              color: AppColors.primaryColor,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            color: Colors.black,
          ),
        ],
      ),
      body: SlidingUpPanel(
        color: Colors.transparent,
        maxHeight: MediaQuery.of(context).size.height * .9,
        minHeight: MediaQuery.of(context).size.height * .6,
        body: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/coin.png"),
                            Gap(10),
                            TitleText(
                              text: "Current Balance",
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ],
                        ),
                        Gap(20),
                        TitleText(
                          text: "Ksh 1,275",
                          color: Colors.white,
                          fontSize: 50,
                        ),
                        Gap(20),
                        Container(
                          width: 180,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryColor,
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Ink(
                              child: Text(
                                "Topup",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Image.asset(
                        "assets/wallet.png",
                        fit: BoxFit.cover,
                        width: 140,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        panelBuilder: (controller) => PanelWidget(scrollController: controller),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController scrollController;

  PanelWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        controller: scrollController,
        children: [
          Gap(10),
          // drag handle bar
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .3,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.6),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Gap(30),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: "Transactions",
                  color: Colors.black,
                  fontSize: 17,
                ),
                Icon(
                  Icons.swap_vert,
                  color: Colors.black,
                  size: 20,
                )
              ],
            ),
          ),
          ...List.generate(
            16,
            (index) => ListTile(
              title: TitleText(
                text: "0712345678",
                color: Colors.black,
                fontSize: 18,
              ),
              subtitle: Text.rich(
                TextSpan(
                  text: "Pending: ",
                  style: TextStyle(color: Colors.green),
                  children: [
                    TextSpan(
                      text: "2nd Jun 2023",
                      style: TextStyle(color: AppColors.placeholderColor),
                    ),
                  ],
                ),
              ),
              trailing: Text(
                "Ksh 1200.00",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
