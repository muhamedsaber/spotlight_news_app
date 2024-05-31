import 'package:spotlight/core/networking/api_constants.dart';
import 'package:spotlight/core/networking/api_error_handler.dart';
import 'package:spotlight/core/networking/api_result.dart';
import 'package:spotlight/core/networking/api_service.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';

class ArticlesBySearchNameRepository {
  final ApiService apiService;

  ArticlesBySearchNameRepository(this.apiService);

  Future<ApiResult<Articles>> getArticlesBySearchName(String searchName) async {
    try {
      Articles articles = await apiService.getTrendingNews(
          apiKey: ApiConstants.apiKey, q: searchName);
      return ApiResult.success(articles);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
