import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';
import 'package:spotlight/features/daily_news/presentation/logic/articles/cubit/articles_cubit.dart';
import 'package:spotlight/features/daily_news/presentation/logic/articles/cubit/articles_state.dart';
import 'package:spotlight/features/daily_news/presentation/widgets/article_item.dart';

class DynamicArticlesContent extends StatelessWidget {
  const DynamicArticlesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        return state.when(
          initial: () =>  Padding(
            padding: EdgeInsets.only(top:200.h),
            child:const CircularProgressIndicator(),
          ),
          loading: () =>  Padding(
            padding: EdgeInsets.only(top:200.h),
            child:const CircularProgressIndicator(),
          ),
          success: (Articles articles) {
            return Expanded(
              child: ListView.builder(
                itemCount: articles.articles.length,
                itemBuilder: (context, index) {
                  ArticleData article = articles.articles[index];
                  return ArticleItem(
                    article: article,
                  );
                },
              ),
            );
          },
          error: (String message) => Center(
            child: Text(message),
          ),
        );
      },
    );
  }
}
