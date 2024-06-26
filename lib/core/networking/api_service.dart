import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:spotlight/features/articles_source/data/models/source_model.dart';
import 'package:spotlight/core/networking/api_constants.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/top-headlines")
  Future<Articles> getArticles({
    @Query("country") String? country,
    @Query("apiKey") String? apiKey,
  });

  // get Tp Headlines For Specific Category
  @GET("/top-headlines")
  Future<Articles> getTopHeadlinesForCategory({
    @Query("country") String? country,
    @Query("category") String? category,
    @Query("apiKey") String? apiKey,
  });

  // Get Trending News
  @GET("/everything")
  Future<Articles> getTrendingNews({
    @Query("apiKey") String? apiKey,
    @Query("q") String? q,
  });

  @GET("/top-headlines/sources")
  Future<Sources> getSources({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
