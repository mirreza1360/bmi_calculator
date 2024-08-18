import 'dart:math';
import 'package:bmi_app/pages/calculate_page.dart';
import 'package:bmi_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import '../generated/assets.dart';
import '../utils/app_style.dart';
import '../widgets/age_weight_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int gender = 0;
  int height = 150;
  int weight = 50;
  int age = 30;
  double bmiScore = 0;
  bool isFinish = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'BMI CALCULATOR',
          style: AppStyles.xlgText.copyWith(color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              height: size.height * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 8,
                      spreadRadius: 0.7,
                      offset: const Offset(0, 3)),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: ChoiceChip3D(
                          width: size.width / 3,
                          height: size.height * 0.18,
                          onSelected: () {
                            setState(() {
                              gender = 1;
                            });
                          },
                          onUnSelected: () {},
                          selected: gender == 1,
                          style: const ChoiceChip3DStyle(
                            topColor: Colors.white,
                            backColor: Colors.white,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: gender == 1
                                  ? AppColors.secondaryColor
                                  : AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 8,
                                  spreadRadius: 0.7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Image(
                                image: AssetImage(Assets.imagesMan),
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ChoiceChip3D(
                          width: size.width / 3,
                          height: size.height * 0.18,
                          onUnSelected: () {},
                          onSelected: () {
                            setState(() {
                              gender = 2;
                            });
                          },
                          selected: gender == 2,
                          style: const ChoiceChip3DStyle(
                            topColor: Colors.white,
                            backColor: Colors.white,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: gender == 2
                                  ? AppColors.secondaryColor
                                  : AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 8,
                                  spreadRadius: 0.7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Image(
                                image: AssetImage(Assets.imagesWomen),
                                width: 135,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Divider(),
                  Text(
                    'Height',
                    style: AppStyles.xxlgText
                        .copyWith(color: Colors.grey.shade400),
                  ),
                  const Gap(20),
                  Text(
                    height.toString(),
                    style: AppStyles.xxlgText
                        .copyWith(color: Colors.grey.shade400),
                  ),
                  const Gap(10),
                  Slider(
                    label: 'CM',
                    thumbColor: AppColors.redColor,
                    activeColor: AppColors.primaryColor,
                    max: 240,
                    min: 0,
                    value: height.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        height = value.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              height: size.height * 0.2,
              child: Row(
                children: [
                  Flexible(
                    child: AgeAndWeightWidget(
                      size: size,
                      title: 'Age',
                      onChange: (value) {
                      age=value;
                      },
                      min: 0,
                      max: 100,
                      initValue: age,
                    ),
                  ),
                  const Gap(10),
                  Flexible(
                    child: AgeAndWeightWidget(
                        size: size,
                      title: 'Weight',
                      initValue: weight,
                      max: 200,
                      min: 0,
                      onChange: (value) {
                          weight = value;
                          },
                    ),
                  ),
                ],
              ),
            ),
            const Gap(30),
            SwipeableButtonView(
              isFinished: isFinish,
              onFinish: () async {
               await Navigator.push(
                  context,
                  PageTransition(
                      child: CalculatePage(bmiScore: bmiScore, age: age),
                      type: PageTransitionType.fade,
                  ),
                );
                setState(() {
                  isFinish = false;
                });
              },
              onWaitingProcess: () {
                bmiCalculate();
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    setState(() {
                      isFinish = true;
                    });
                  },
                );
              },
              activeColor: AppColors.primaryColor,
              buttonWidget: const Icon(Icons.arrow_forward_ios),
              buttonText: 'Calculate',
              buttontextstyle:
                  AppStyles.xxlgText.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  void bmiCalculate() {
    bmiScore = weight / pow(height/100 , 2);
  }
}


