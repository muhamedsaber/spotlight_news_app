import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spotlight/config/database/articles_database_impl.dart';
import 'package:spotlight/core/alearts/flutter_toast.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';

class ArticleSaver {
  final Box<ArticleData> _articleBox = Hive.box<ArticleData>(articleBox);

  Future<void> saveArticle(BuildContext context, ArticleData article) async {
    if (!_articleBox.containsKey(article.url)) {
      await _articleBox.put(article.url, article);

      showCustomToast(context, "Article saved", Colors.green);
    } else {
      showCustomToast(context, "Article already saved", Colors.red);
    }
  }
}
