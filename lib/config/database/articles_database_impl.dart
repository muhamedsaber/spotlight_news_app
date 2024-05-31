import 'package:hive/hive.dart';
import 'package:spotlight/config/database/articles_database.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';

class ArticleDatabaseImpl implements ArticlesDatabase {
  @override
  Future<void> deleteAllArticles() async {
    await Hive.box<ArticleData>(articleBox).clear();
  }

  @override
  Future<void> deleteArticle(ArticleData article) async {
    await Hive.box<ArticleData>(articleBox).delete(article);
  }

  @override
  Future<List<ArticleData>> getArticles() async {
    return Hive.box<ArticleData>(articleBox).values.toList();
  }

  @override
  Future<void> saveArticle(ArticleData article) {
    return Hive.box<ArticleData>(articleBox).add(article);
  }
}

const String articleBox = 'articles';
