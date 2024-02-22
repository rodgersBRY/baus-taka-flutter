import 'package:baus_taka/screens/plastic_donations/plastics_summary_page.dart';
import 'package:baus_taka/widgets/shared_widgets/custom_orange_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/progress_rounded_containers.dart';
import '../../widgets/shared_widgets/title_text.dart';

// ignore: must_be_immutable
class DonatePlasticPickupTypePage extends StatelessWidget {
  DonatePlasticPickupTypePage({super.key});

  List<Map<String, String>> pickupTypes = [
    {"title": "Cart", "price": "Ksh 150"},
    {"title": "Tuktuk", "price": "Ksh 200"},
    {"title": "Lorry", "price": "Ksh 3000"}
  ];

  List<String> _oftenList = ["Monthly", "Daily", "Weekly"];

  RxInt selectedRadioTile = 0.obs;

  setSelectedRadioTile(int val) {
    selectedRadioTile.value = val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
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
          );
        }),
        title: TitleText(
          text: "Donate Plastic",
          color: AppColors.secondaryOrangeColor,
          fontSize: 22,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  markedContainer(AppColors.secondaryOrangeColor),
                  dashedContainer(AppColors.secondaryOrangeColor),
                  markedContainer(AppColors.secondaryOrangeColor),
                  dashedContainer(AppColors.secondaryOrangeColor),
                  circularContainer(AppColors.secondaryOrangeColor),
                  dashedContainer(Colors.grey.withOpacity(.4)),
                  borderContainer(),
                ],
              ),
            ),
            TitleText(
              text: "Pickup using",
              color: Colors.black,
              fontSize: 17,
            ),
            Gap(20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    pickupTypes.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10,
                      ),
                      margin: const EdgeInsets.only(right: 20.0, bottom: 15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.secondaryOrangeColor, width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Text(
                            pickupTypes[index]["title"]!,
                            style: TextStyle(
                                color: AppColors.secondaryOrangeColor,
                                fontSize: 18),
                          ),
                          Text(
                            pickupTypes[index]['price']!,
                            style: TextStyle(
                                color: AppColors.secondaryOrangeColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                border: Border(
                  top: BorderSide(
                    width: 2.0,
                    color: AppColors.secondaryOrangeColor,
                  ),
                ),
              ),
              child: ListTile(
                title: TitleText(
                  text: "Pickup date & time",
                  color: Colors.black,
                  fontSize: 18,
                ),
                trailing: Obx(() => Radio(
                      fillColor: MaterialStateProperty.all(
                          AppColors.secondaryOrangeColor),
                      value: 1,
                      groupValue: selectedRadioTile.value,
                      onChanged: (val) {
                        setSelectedRadioTile(val!);
                      },
                    )),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .7,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We will reach out to confirm date & time of collection",
                    style: TextStyle(
                        color: AppColors.placeholderColor, fontSize: 15),
                  ),
                  Gap(20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.placeholderColor.withOpacity(.6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Schedule Time",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Gap(30),
            TitleText(
              text: "How often",
              color: Colors.black,
              fontSize: 17,
            ),
            Gap(20),
            // choose pickup frequency
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    _oftenList.length,
                    (index) => Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      margin: const EdgeInsets.only(right: 20.0, bottom: 15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.secondaryOrangeColor, width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          _oftenList[index],
                          style: TextStyle(
                            color: AppColors.secondaryOrangeColor,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(50),
            // payment row
            Container(
              child: Row(
                children: [
                  TitleText(
                    text: "PAYMENT:",
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  Gap(10),
                  Image.asset("assets/mpesa_logo.png", width: 90),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => PaymentPage()));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            "Change",
                            style: TextStyle(
                                color: AppColors.secondaryOrangeColor,
                                fontSize: 16),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // buttons row
            Expanded(child: Container()),
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.chevron_left,
                        size: 40,
                        color: AppColors.secondaryOrangeColor,
                      ),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.secondaryOrangeColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: CustomOrangeButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DonatePlasticWasteSummaryPage()));
                      },
                      title: "Next Step",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
