import 'package:flutter/material.dart';
import 'package:spotlight/config/database/articles_database_impl.dart';
import 'package:spotlight/core/widgets/appbar_builder.dart';
import 'package:spotlight/core/widgets/empty_data.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';
import 'package:spotlight/features/daily_news/presentation/widgets/article_item.dart';

class SavedArticleView extends StatelessWidget {
  const SavedArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(title: "Saved ", context: context),
      body: FutureBuilder<List<ArticleData>>(
        future: ArticleDatabaseImpl().getArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return snapshot.data!.isEmpty
                ? const Center(
                    child: EmptyData(
                      message: "No saved articles",
                      icon: Icons.bookmark_border_outlined,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          direction: DismissDirection.startToEnd,
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            ArticleDatabaseImpl()
                                .deleteArticle(snapshot.data![index]);
                          },
                          child: ArticleItem(
                            article: snapshot.data![index],
                            isArticlesForHomeView: false,
                          ),
                        );
                      },
                    ),
                  );
          } else if (snapshot.hasError) {
            return Center(child: Text('An error occurred: ${snapshot.error}'));
          } else {
            return const Center(child: Text("No saved articles"));
          }
        },
      ),
    );
  }
}
