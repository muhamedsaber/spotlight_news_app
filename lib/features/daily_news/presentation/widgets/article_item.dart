import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spotlight/core/utils/constants/app_constants.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';
import 'package:spotlight/features/daily_news/presentation/widgets/article_full_view.dart';


class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article,required this.isArticlesForHomeView});
  final ArticleData article;
  final bool isArticlesForHomeView;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return ArticleFullView(article: article,isArticlesForHomeView: isArticlesForHomeView,);
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(10.h),
        height: 120.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 1000.h,
              width: 120.w,
              child: Hero(
                tag: article.urlToImage ?? " ",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  clipBehavior: Clip.hardEdge,
                  child: FadeInImage.assetNetwork(
                    placeholder: AppConstants.fadeInImage,
                    image: handleImage(),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppConstants.errorImage,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      article.title ?? " ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                 const Spacer(),
                  buildDateTimeInfo(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }
 Widget buildDateTimeInfo(BuildContext context) {
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.date_range),
          SizedBox(width: 5.w),
          Text(DateTime.parse(article.publishedAt ?? "").toString().substring(0, 10)),
          SizedBox(width: 5.w),
          const Icon(Icons.access_time),
          SizedBox(width: 5.w),
          Text(DateTime.parse(article.publishedAt ?? "").toString().substring(11, 16)),
        ],
      ),
    );
  }
 

  String handleImage() {
    if (article.urlToImage == null || article.urlToImage!.isEmpty) {
      return AppConstants.errorImage;
    } else if (article.urlToImage!.contains("www.aljazeera.com")) {
      return AppConstants.errorImage;
    }
    return article.urlToImage!;
  }
}