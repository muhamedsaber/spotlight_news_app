import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlight/core/widgets/custom_navbar.dart';
import 'package:spotlight/features/articles_source/presentation/Logic/cubit/source_cubit.dart';
import 'package:spotlight/features/articles_source/presentation/views/news_source_view.dart';
import 'package:spotlight/features/daily_news/presentation/logic/articles/cubit/articles_cubit.dart';
import 'package:spotlight/features/daily_news/presentation/views/home_view.dart';
import 'package:spotlight/features/settings/presentation/views/settings_view.dart';

class StartPoint extends StatefulWidget {
  const StartPoint({super.key});

  @override
  State<StartPoint> createState() => _StartPointState();
}

class _StartPointState extends State<StartPoint> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: const [
            HomeView(),
           
           NewsSourceView(),
            Scaffold(
              body: Center(
                child: Text("No Routes Found on this Name!"),
              ),
            ),
            SettingsView()
          ]),
      bottomNavigationBar: CustomBottomNavBar(
        onTabChange: (index) {
          if (index == 0) {
            context.read<ArticlesCubit>().getArticles();
            controller.jumpToPage(0);
          } else if (index == 1) {
            context.read<SourceCubit>().getSources();
            controller.jumpToPage(1);
          } else if (index == 2) {
            controller.jumpToPage(2);
          }else if(index==3){
            controller.jumpToPage(3);
          }
        },
      ),
    );
  }
}
