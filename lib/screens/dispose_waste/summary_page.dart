import 'package:baus_taka/screens/dispose_waste/waste_payment_processing_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_button.dart';
import '../../widgets/shared_widgets/title_text.dart';

class WasteSummaryPage extends StatelessWidget {
  const WasteSummaryPage({super.key});

  Widget _summaryContainer({required String title, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey.withOpacity(.4),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            text: title,
            color: Colors.black,
            fontSize: 15,
          ),
          Gap(5),
          Text(
            value,
            style: TextStyle(color: Colors.black, fontSize: 19),
          )
        ],
      ),
    );
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
          text: "Dispose Waste",
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(50),
            TitleText(
              text: "Summary",
              color: AppColors.primaryColor,
              fontSize: 25,
            ),
            _summaryContainer(title: "Pickup Address", value: "Mombasa, Kenya"),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Colors.grey.withOpacity(.4),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: "Pickup using",
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      Gap(5),
                      Text(
                        "Cart",
                        style: TextStyle(color: Colors.black, fontSize: 19),
                      )
                    ],
                  ),
                  Container(
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
                      onPressed: () {},
                      child: Ink(
                        child: Text(
                          "Ksh 150",
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
            ),
            _summaryContainer(
                title: "Pickup Date & Time",
                value: "We will reach out to confirm"),
            _summaryContainer(title: "How Often", value: "One Time"),
            _summaryContainer(title: "Type of Waste", value: "Paper"),
            _summaryContainer(title: "No. of Waste Bags", value: "1"),
            _summaryContainer(title: "Mpesa Number", value: "0712345637"),
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
                        color: AppColors.primaryColor,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WastePaymentPage()));
                      },
                      title: "Make Request",
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
