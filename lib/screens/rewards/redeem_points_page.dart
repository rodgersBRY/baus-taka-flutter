import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_keyboard.dart';
import '../../widgets/shared_widgets/slider_indicator.dart';
import '../../widgets/shared_widgets/title_text.dart';

class RedeemPointsPage extends StatefulWidget {
  const RedeemPointsPage({super.key});

  @override
  State<RedeemPointsPage> createState() => _RedeemPointsPageState();
}

class _RedeemPointsPageState extends State<RedeemPointsPage> {
  int _selectedIndex = 0;

  final _amountController = TextEditingController();
  final _amountFocusNode = FocusNode();

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
            icon: SvgPicture.asset(
              "assets/icons/information-bubble.svg",
              color: AppColors.primaryColor,
              width: 30,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            height: 180,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                text: "Green Guru",
                                color: Colors.white,
                                fontSize: 35,
                              ),
                              Gap(15),
                              Text.rich(
                                TextSpan(
                                  text: "65 points ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "(level 1)",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(10),
                              Stack(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Image.asset("assets/medal.png"),
                      ],
                    ));
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            width: 130,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  5,
                  (index) => Indicator(
                    isActive: _selectedIndex == index ? true : false,
                  ),
                ),
              ],
            ),
          ),
          Gap(30),
          Text(
            "Points to redeem",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .6,
            child: TextField(
              controller: _amountController,
              focusNode: _amountFocusNode,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.none,
              style: TextStyle(fontSize: 40),
              decoration: InputDecoration(
                hintText: "100",
                hintStyle:
                    TextStyle(color: Colors.grey.withOpacity(.5), fontSize: 40),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          Text(
            "Worth Ksh 160",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.placeholderColor.withOpacity(.7),
            ),
          ),
          Gap(30),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 58, 148, 61),
                  Color.fromARGB(255, 70, 197, 75),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(10),
              color: AppColors.gradientColor,
            ),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => WalletNumberPage()));
              },
              child: Ink(
                child: Text(
                  "Redeem",
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
          Gap(10),
          CustomKeyboard(controller: _amountController)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
