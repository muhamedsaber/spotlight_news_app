import 'package:spotlight/core/networking/api_constants.dart';
import 'package:spotlight/core/networking/api_error_handler.dart';
import 'package:spotlight/core/networking/api_result.dart';
import 'package:spotlight/core/networking/api_service.dart';
import 'package:spotlight/daily_news/data/models/article_model.dart';

class ArticlesByCategoryRepository {
  final ApiService service;
  ArticlesByCategoryRepository(this.service);
  getArticlesByCategory(
      {required String country, required String category}) async {
    try {
      Articles articles = await service.getTopHeadlinesForCategory(
          country: "us", category:category, apiKey: ApiConstants.apiKey);
      return ApiResult.success(articles);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
