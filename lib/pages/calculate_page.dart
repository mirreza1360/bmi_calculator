import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

class CalculatePage extends StatefulWidget {
  final double bmiScore;
  final int age;

  const CalculatePage({super.key, required this.bmiScore, required this.age});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  String? statusBmi;
  String? messageBmi;
  Color? colorBmi;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bmiResult();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'BMI Score',
          style: AppStyles.xlgText.copyWith(color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              width: double.infinity,
              height: size.height * 0.8,
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
                  Text(
                    'Your Bmi Score',
                    style: AppStyles.xxlgText
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  const Gap(10),
                  PrettyGauge(
                    gaugeSize: 300,
                    maxValue: 40,
                    minValue: 0,
                    segments: [
                      GaugeSegment('UnderWeight', 18.5, AppColors.redColor),
                      GaugeSegment('NormalWeight', 6.4, AppColors.greenColor),
                      GaugeSegment('OverWeight', 5, Colors.orange),
                      GaugeSegment('Obese', 10.1, Colors.pink),
                    ],
                    valueWidget: Text(
                      widget.bmiScore.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 40),
                    ),
                    currentValue: widget.bmiScore.toDouble(),
                    needleColor: AppColors.secondaryColor,
                  ),
                  const Gap(20),
                  Text(
                    statusBmi!,
                    style: TextStyle(
                        color: colorBmi,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Text(
                    messageBmi!,
                    style: TextStyle(
                      color: colorBmi,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: AppColors.primaryColor),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Calculate again',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: AppColors.primaryColor),
                          onPressed: () {
                            Share.share(
                                'Your Bmi is ${widget.bmiScore.toStringAsFixed(1)} at age ${widget.age}');
                          },
                          child: const Text(
                            'Share',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bmiResult() {
    if (widget.bmiScore > 30) {
      statusBmi = 'Obese';
      colorBmi = Colors.pink;
      messageBmi = 'Please exercise to lose weight';
    } else if (widget.bmiScore >= 25) {
      statusBmi = 'OverWeight';
      colorBmi = Colors.orange;
      messageBmi = 'Please regular exercise to lose weight';
    } else if (widget.bmiScore >= 18.5) {
      statusBmi = 'NormalWeight';
      colorBmi = Colors.green;
      messageBmi = 'Your weight is normal';
    } else if (widget.bmiScore < 18.5) {
      statusBmi = 'UnderWeight';
      colorBmi = Colors.red;
      messageBmi = 'You are too thin, eat one';
    }
  }
}
