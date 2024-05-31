import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spotlight/config/database/article_adapter.dart';
import 'package:spotlight/config/database/articles_database_impl.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';
import 'package:spotlight/spotlight_news.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(ArticleAdapter());

  // Open boxes
  await Hive.openBox(AppConstants.themBox);
  await Hive.openBox<ArticleData>(articleBox);

  await setup();

  runApp(const SpotlightNews());
}
