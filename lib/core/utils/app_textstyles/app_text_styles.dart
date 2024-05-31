import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/utils/app_textstyles/font_weight_helper.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';

class AppTextStyles {
  static TextStyle insanibc40bold = TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: AppConstants.insanibcfontName,
      letterSpacing: 3.sp);
}
