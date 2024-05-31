import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spotlight/core/utils/constants/app_constants.dart';
import 'package:spotlight/core/widgets/appbar_builder.dart';
import 'package:spotlight/core/widgets/custom_navbar.dart';
import 'package:spotlight/daily_news/presentation/logic/articles/cubit/articles_cubit.dart';
import 'package:spotlight/daily_news/presentation/logic/trendings_animator/cubit/trending_animator_cubit.dart';
import 'package:spotlight/daily_news/presentation/widgets/category_listView.dart';
import 'package:spotlight/daily_news/presentation/widgets/custom_textfield.dart';
import 'package:spotlight/daily_news/presentation/widgets/dynamic_articles_content.dart';
import 'package:spotlight/daily_news/presentation/widgets/trending_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key}); // Corrected here

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
                  controller: TextEditingController(),
                ),
                const TrendingCard(),
                SizedBox(
                  height: 10.h,
                ),
                const CustomCategoryListView(),
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
