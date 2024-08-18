import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

class AgeAndWeightWidget extends StatefulWidget {
  final String title;
  final Function onChange;
  final int min;
  final int max;
  final int initValue;
  const AgeAndWeightWidget({
    super.key,
    required this.size,
    required this.title,
    required this.onChange,
    required this.min,
    required this.max,
    required this.initValue,
  });
  final Size size;

  @override
  State<AgeAndWeightWidget> createState() => _AgeAndWeightWidgetState();
}

class _AgeAndWeightWidgetState extends State<AgeAndWeightWidget> {
  int counter = 0;
  @override
  void initState() {
    counter = widget.initValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width / 2,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 8,
            spreadRadius: 0.7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteColor,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: AppStyles.xxlgText
                  .copyWith(color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(counter <widget.max){
                        counter++;
                      }
                    });
                    widget.onChange(counter);
                  },

                  icon: const Icon(
                    Icons.add_circle_outlined,
                    size: 40,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  counter.toString(),
                  style: AppStyles.xxlgText,
                ),
                IconButton(
                  onPressed:() {
                    setState(() {
                      if(counter > widget.min){
                        counter--;
                      }
                    });
                    widget.onChange(counter);
                  },
                  icon: const Icon(
                    Icons.remove_circle_rounded,
                    size: 40,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
