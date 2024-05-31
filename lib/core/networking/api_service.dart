import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:spotlight/core/networking/api_constants.dart';
import 'package:spotlight/daily_news/data/models/article_model.dart';

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
}
