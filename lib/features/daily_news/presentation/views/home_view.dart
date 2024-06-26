import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';
import 'package:spotlight/core/widgets/appbar_builder.dart';
import 'package:spotlight/features/daily_news/presentation/logic/articles/cubit/articles_cubit.dart';
import 'package:spotlight/features/daily_news/presentation/logic/trendings_animator/cubit/trending_animator_cubit.dart';
import 'package:spotlight/features/daily_news/presentation/widgets/category_listView.dart';
import 'package:spotlight/features/daily_news/presentation/widgets/custom_textfield.dart';
import 'package:spotlight/features/daily_news/presentation/widgets/dynamic_articles_content.dart';
import 'package:spotlight/features/daily_news/presentation/widgets/trending_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<ArticlesCubit>().getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrendingAnimatorCubit(),
        child: Scaffold(
          appBar:
              appbarBuilder(title: AppConstants.spotlight, context: context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                CustomTextfield(
                  hintText: "Search for news",
                  onSubmitted: (input) {
                    context
                        .read<ArticlesCubit>()
                        .getArticlesBySearchName(searchName: input);
                  },
                ),
                const TrendingCard(),
                SizedBox(
                  height: 10.h,
                ),
                 CustomCategoryListView(
                  onCategorySelected: (index){
                    if (index == 0) {
                  getIt<ArticlesCubit>().getArticles();
                } else {
                  getIt<ArticlesCubit>()
                      .getArticlesByCategory(categoryName: categories[index]);
                }
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                const DynamicArticlesContent(),
              ],
            ),
          ),
        ));
  }
}
