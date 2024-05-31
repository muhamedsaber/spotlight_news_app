import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/core/widgets/appbar_builder.dart';
import 'package:spotlight/features/articles_source/presentation/Logic/cubit/source_cubit.dart';
import 'package:spotlight/features/articles_source/presentation/widgets/source_bloc_listview_builder.dart';
import 'package:spotlight/features/daily_news/presentation/widgets/category_listView.dart';

class NewsSourceView extends StatefulWidget {
  const NewsSourceView({super.key});

  @override
  State<NewsSourceView> createState() => _NewsSourceViewState();
}

class _NewsSourceViewState extends State<NewsSourceView> {
  @override
  void initState() {
    getIt<SourceCubit>().getSources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarBuilder(title: "News Source", context: context),
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
              child: CustomCategoryListView(
                onCategorySelected: (index) {
                  if (index == 0) {
                    getIt<SourceCubit>().getSources();
                  } else {
                    getIt<SourceCubit>().getSources(category: categories[index]);
                  }
                },
              ),
            ),
            const SourcesBlocListViewBuilder()
          ],
        ));
  }
}
