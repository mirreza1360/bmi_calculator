import 'package:bmi_app/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle smText =
      TextStyle(fontSize: 12, color: AppColors.greyColor);

  static const TextStyle mdText =
      TextStyle(fontSize: 14, color: AppColors.greyColor);

  static const TextStyle lgText =
      TextStyle(fontSize: 16, color: AppColors.blackColor);

  static TextStyle xlgText = const TextStyle(
      fontSize: 18, color: AppColors.blackColor, fontWeight: FontWeight.bold);

  static TextStyle xxlgText = const TextStyle(
      fontSize: 22, color: AppColors.blackColor, fontWeight: FontWeight.bold);
}
