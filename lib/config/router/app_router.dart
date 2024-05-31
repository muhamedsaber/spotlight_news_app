import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlight/config/router/routes.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/features/articles_source/presentation/Logic/cubit/source_cubit.dart';
import 'package:spotlight/features/articles_source/presentation/views/news_source_view.dart';
import 'package:spotlight/features/daily_news/presentation/logic/articles/cubit/articles_cubit.dart';
import 'package:spotlight/features/daily_news/presentation/views/home_view.dart';
import 'package:spotlight/start_point.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.startPoint:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<ArticlesCubit>(
              create: (context) => getIt<ArticlesCubit>(),
              
            ),
            BlocProvider<SourceCubit>(
              create: (context) => getIt<SourceCubit>(),
            ),
          ],
          child: const StartPoint(),
        ),
      );
      case Routes.newsSourceView:
      return MaterialPageRoute(
        builder: (_) =>  const NewsSourceView(),
      );
    case Routes.homeView:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text("No Routes Found on this Name!"),
          ),
        ),
      );
  }
}
