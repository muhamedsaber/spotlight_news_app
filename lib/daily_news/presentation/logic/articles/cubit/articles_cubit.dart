import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/core/networking/api_error_handler.dart';
import 'package:spotlight/core/networking/api_result.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';
import 'package:spotlight/daily_news/data/models/article_model.dart';
import 'package:spotlight/daily_news/data/repository/articles_repository.dart';
import 'package:spotlight/daily_news/presentation/logic/articles/cubit/articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(this.articleRepository) : super(const ArticlesState.initial());
  ArticleRepository articleRepository;
  Future<String> _getCountryNameFromDataBase() async {
    String name =
        getIt<SharedPreferences>().getString(AppConstants.country) ?? "us";
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
}
