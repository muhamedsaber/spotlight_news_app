import 'package:spotlight/features/daily_news/data/models/article_model.dart';

abstract class ArticlesDatabase {
  Future<void> saveArticle(ArticleData article);
  Future<List<ArticleData>> getArticles();
  Future<void> deleteArticle(ArticleData article);
  Future<void> deleteAllArticles();
}
