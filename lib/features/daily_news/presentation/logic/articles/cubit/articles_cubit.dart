import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/core/networking/api_error_handler.dart';
import 'package:spotlight/core/networking/api_result.dart';
import 'package:spotlight/core/utils/country_util.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';
import 'package:spotlight/features/daily_news/data/repository/articles_by_category_repository.dart';
import 'package:spotlight/features/daily_news/data/repository/articles_by_search_name.dart';
import 'package:spotlight/features/daily_news/data/repository/articles_repository.dart';
import 'package:spotlight/features/daily_news/presentation/logic/articles/cubit/articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(this.articleRepository, this.articlesByCategoryRepository,
      this.articlesBySearchNameRepository)
      : super(const ArticlesState.initial());
  ArticleRepository articleRepository;
  ArticlesByCategoryRepository articlesByCategoryRepository;
  ArticlesBySearchNameRepository articlesBySearchNameRepository;

  // get the country name from the cache where the user saved it if the user
  //did not save it then the default country name is us
  Future<String> _getCountryNameFromDataBase() async {
    String name = await getIt<CountryUtil>().getCountryNameFromDataBase();
    return name;
  }

  getArticles() async {
    emit(const ArticlesState.loading());
    String countryName = await _getCountryNameFromDataBase();
    ApiResult<Articles> result =
        await articleRepository.fetchArticles(country: countryName);
    result.when(success: (Articles articles) {
      log("success");
      emit(ArticlesState.success(articles));
    }, failure: (ErrorHandler errorHandler) {
      emit(ArticlesState.error(
          errorHandler.apiErrorModel.message ?? "Error Occurred"));
    });
  }

  getArticlesByCategory({required String categoryName}) async {
    emit(const ArticlesState.loading());
    String countryName = await _getCountryNameFromDataBase();

    ApiResult<Articles> result = await articlesByCategoryRepository
        .getArticlesByCategory(country: countryName, category: categoryName);
    result.when(success: (Articles articles) {
      log("success for $categoryName");
      emit(ArticlesState.success(articles));
    }, failure: (ErrorHandler errorHandler) {
      emit(ArticlesState.error(
          errorHandler.apiErrorModel.message ?? "Error Occurred"));
    });
  }

  // get news by Search name
  getArticlesBySearchName({required String searchName}) async {
    emit(const ArticlesState.loading());
    ApiResult<Articles> result = await articlesBySearchNameRepository
        .getArticlesBySearchName(searchName);
    result.when(success: (Articles articles) {
      log("success $searchName");
      emit(ArticlesState.success(articles));
    }, failure: (ErrorHandler errorHandler) {
      emit(ArticlesState.error(
          errorHandler.apiErrorModel.message ?? "Error Occurred"));
    });
  }
}
