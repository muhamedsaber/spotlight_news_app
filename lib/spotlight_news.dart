import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spotlight/config/router/app_router.dart';
import 'package:spotlight/config/theme/theme_managers/dark_theme_manager.dart';
import 'package:spotlight/config/theme/theme_managers/light_theme_manager.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';

class SpotlightNews extends StatelessWidget {
  const SpotlightNews({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box(AppConstants.themBox).listenable(),
          builder: (context, box, child) {
            var darkMode = box.get(AppConstants.isDarkMode, defaultValue: true);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: onGenerateRoute,
              theme: darkMode ? lightThemeManager : darkThemeManager,
            );
          },
        ));
  }
}
