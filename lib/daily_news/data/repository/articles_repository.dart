import 'package:spotlight/core/networking/api_constants.dart';
import 'package:spotlight/core/networking/api_error_handler.dart';
import 'package:spotlight/core/networking/api_result.dart';
import 'package:spotlight/core/networking/api_service.dart';
import 'package:spotlight/daily_news/data/models/article_model.dart';

class ArticleRepository {
  final ApiService apiService;
  ArticleRepository(this.apiService);
  Future<ApiResult<Articles>> fetchArticles(
      {required String country}) async {
    try {
      Articles articles = await apiService.getArticles(
          apiKey: ApiConstants.apiKey, country: country);
      return ApiResult.success(articles);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
