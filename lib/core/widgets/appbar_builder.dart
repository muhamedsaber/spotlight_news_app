import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/extensions/theme_extension.dart';
import 'package:spotlight/core/utils/app_textstyles/app_text_styles.dart';

AppBar appbarBuilder({required String title, required BuildContext context}) {
  return AppBar(
    toolbarHeight: 60.h,
    elevation: 0,
    forceMaterialTransparency: true,
    title: Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Text(
        title,
        style: AppTextStyles.insanibc40bold
            .copyWith(color: context.theme.primaryColor),
      ),
    ),
  );
}