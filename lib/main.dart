import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';
import 'package:spotlight/spotlight_news.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstants.themBox);
  await setup();
  runApp(const SpotlightNews());
}
