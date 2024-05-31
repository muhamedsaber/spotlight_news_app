import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/extensions/theme_extension.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/daily_news/presentation/logic/articles/cubit/articles_cubit.dart';

List<String> categories = [
  "Top Articles",
  "general",
  "business",
  "entertainment",
  "health",
  "science",
  "sports",
  "technology"
];

class CustomCategoryListView extends StatefulWidget {
  const CustomCategoryListView({super.key});

  @override
  State<CustomCategoryListView> createState() => _CustomCategoryListView();
}

class _CustomCategoryListView extends State<CustomCategoryListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
                if (index == 0) {
                  getIt<ArticlesCubit>().getArticles();
                } else {
                  getIt<ArticlesCubit>()
                      .getArticlesByCategory(categoryName: categories[index]);
                }
              },
              splashColor: Colors.transparent,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInCubic,
                width: 120.w,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? context.theme.colorScheme.primary
                      : context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: currentIndex == index
                          ? context.theme.colorScheme.onSurface
                          : context.theme.colorScheme.primary,
                      fontSize: currentIndex == index ? 16.sp : 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
