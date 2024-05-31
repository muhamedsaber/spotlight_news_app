import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/extensions/theme_extension.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/daily_news/data/repository/articles_by_search_name.dart';
import 'package:spotlight/daily_news/presentation/logic/articles/cubit/articles_cubit.dart';
import 'package:spotlight/daily_news/presentation/logic/trendings_animator/cubit/trending_animator_cubit.dart';

class TrendingGridView extends StatelessWidget {
  const TrendingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: 8.w, top: 1.h, left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Trendings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2.2,
                ),
                itemCount: trendingsKeywords.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.read<TrendingAnimatorCubit>().toggleAnimation();
                      getIt<ArticlesCubit>().getArticlesBySearchName(
                          searchName: trendingsKeywords[index]);
                    },
                    // make a splash effect when the user press on the button

                    splashColor: context.theme.colorScheme.secondary,

                    child: TweenAnimationBuilder(
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 150),
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(1000.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              trendingsKeywords[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: context.theme.colorScheme.onSecondary
                                    .withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

// this is a list of trending keywords
// it supposed to be fetched from the server
// but for the sake of the example i will use a static list
// i didn't find a proper api to fetch trending keywords
// so i will use a static list
List<String> trendingsKeywords = [
  "bitcoin",
  "apple",
  "earthquake",
  "animal",
  "trump",
  "covid",
  "crypto",
  "space",
  "technology",
  "fashion",
  "health",
  "food",
  "travel",
];
