import 'package:flutter/material.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/spotlight_news.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const SpotlightNews());
}
