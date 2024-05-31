import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotlight/core/networking/api_service.dart';
import 'package:spotlight/core/networking/dio_factory.dart';
import 'package:spotlight/daily_news/data/repository/articles_repository.dart';
import 'package:spotlight/daily_news/presentation/logic/articles/cubit/articles_cubit.dart';

final getIt = GetIt.instance;

setup() async {
  //daily news
  Dio dio = DioFactory.getDio();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  getIt.registerSingleton<ArticleRepository>(ArticleRepository(getIt()));

  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);

  getIt.registerSingleton<ArticlesCubit>(ArticlesCubit(getIt()));

}
