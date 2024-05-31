import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/config/router/app_router.dart';
import 'package:spotlight/config/theme/theme_managers/dark_theme_manager.dart';
import 'package:spotlight/config/theme/theme_managers/light_theme_manager.dart';

class SpotlightNews extends StatelessWidget {
  const SpotlightNews({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize:const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        theme:darkThemeManager,
      ),
    );
  }
}
