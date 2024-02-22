import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/shared_widgets/custom_orange_button.dart';
import '../../widgets/shared_widgets/progress_rounded_containers.dart';
import '../../widgets/shared_widgets/title_text.dart';
import './pickup_type_page.dart';

// ignore: must_be_immutable
class DonatePlasticWasteTypePage extends StatelessWidget {
  DonatePlasticWasteTypePage({super.key});
  final _wasteBagsController = TextEditingController();
  final _wasteBagsFocusNode = FocusNode();

  List<String> listOfWaste = [
    "Paper",
    'E-Waste',
    'Food Waste',
    'Furniture',
    'Construction',
    'Plastic',
    "Glass",
    "Plastic"
  ];

  RxInt selectedRadioTile = 1.obs;
  setSelectedRadioTile(int val) {
    selectedRadioTile.value = val;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _wasteBagsFocusNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    circularContainer(AppColors.secondaryOrangeColor),
                    dashedContainer(Colors.grey.withOpacity(.4)),
                    borderContainer(),
                    dashedContainer(Colors.grey.withOpacity(.4)),
                    borderContainer(),
                  ],
                ),
              ),
              TitleText(
                text: "Type of waste",
                color: Colors.black,
                fontSize: 17,
              ),
              Gap(20),
              Container(
                child: Wrap(
                  children: [
                    ...List.generate(
                      listOfWaste.length,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10,
                        ),
                        margin:
                            const EdgeInsets.only(right: 20.0, bottom: 15.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.secondaryOrangeColor, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          listOfWaste[index],
                          style: TextStyle(
                              color: AppColors.secondaryOrangeColor,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20),
              Container(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          border: Border(
                            top: BorderSide(
                              width: 2.0,
                              color: AppColors.secondaryOrangeColor,
                            ),
                          ),
                        ),
                        child: ListTile(
                          title: TitleText(
                            text: "Mixed",
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
                    ),
                    Gap(10),
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          border: Border(
                            top: BorderSide(
                              width: 2.0,
                              color: AppColors.secondaryOrangeColor,
                            ),
                          ),
                        ),
                        child: ListTile(
                            title: FittedBox(
                              child: TitleText(
                                text: "Segregated",
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            trailing: Obx(() => Radio(
                                  fillColor: MaterialStateProperty.all(
                                      AppColors.secondaryOrangeColor),
                                  value: 2,
                                  groupValue: selectedRadioTile.value,
                                  onChanged: (val) {
                                    setSelectedRadioTile(val!);
                                  },
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20),
              Text(
                "No. of waste bags",
                style: TextStyle(fontSize: 18),
              ),
              Gap(10),
              TextField(
                keyboardType: TextInputType.number,
                controller: _wasteBagsController,
                focusNode: _wasteBagsFocusNode,
                decoration: InputDecoration(
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
              Gap(50),
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
                                  DonatePlasticPickupTypePage()));
                        },
                        title: "Next Step",
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Center(child: Image.asset("assets/bottom_people.png")),
            ],
          ),
        ),
      ),
    );
  }
}
