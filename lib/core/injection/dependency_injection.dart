import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotlight/core/networking/api_service.dart';
import 'package:spotlight/core/networking/dio_factory.dart';
import 'package:spotlight/core/utils/country_util.dart';
import 'package:spotlight/features/articles_source/data/repository/source_repository.dart';
import 'package:spotlight/features/articles_source/presentation/Logic/cubit/source_cubit.dart';
import 'package:spotlight/features/daily_news/data/repository/articles_by_category_repository.dart';
import 'package:spotlight/features/daily_news/data/repository/articles_by_search_name.dart';
import 'package:spotlight/features/daily_news/data/repository/articles_repository.dart';
import 'package:spotlight/features/daily_news/presentation/logic/articles/cubit/articles_cubit.dart';

final getIt = GetIt.instance;

setup() async {
  //daily news
  Dio dio = DioFactory.getDio();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  getIt.registerSingleton<ArticleRepository>(ArticleRepository(getIt()));

  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);
  getIt.registerSingleton<ArticlesByCategoryRepository>(ArticlesByCategoryRepository(getIt()));
  getIt.registerSingleton<ArticlesBySearchNameRepository>(ArticlesBySearchNameRepository(getIt()));
  getIt.registerSingleton<ArticlesCubit>(ArticlesCubit(getIt(),getIt(),getIt()));
  

  //articles sources
  getIt.registerSingleton<SourceRepository>(SourceRepository(getIt()));
  getIt.registerSingleton<SourceCubit>(SourceCubit(getIt()));

  // country util to manage the user country
  getIt.registerSingleton<CountryUtil>(CountryUtil());
}
