import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/extensions/media_query.dart';
import 'package:spotlight/core/extensions/theme_extension.dart';
import 'package:spotlight/core/utils/app_textstyles/font_weight_helper.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';
import 'package:spotlight/daily_news/data/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final ArticleData article;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.h),
      height: 120.h,
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: context.theme.colorScheme.surface,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 1000.h,
            width: 120.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                clipBehavior: Clip.hardEdge,
                child: FadeInImage.assetNetwork(
                  placeholder: AppConstants.fadeInImage,
                  image: handleAljazeeraImage(),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 10.w,
          ),
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
                      fontWeight: FontWeightHelper.regular,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.date_range),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(DateTime.parse(article.publishedAt ?? "")
                          .toString()
                          .substring(0, 10)),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Icon(Icons.access_time),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        DateTime.parse(article.publishedAt ?? "")
                            .toString()
                            .substring(11, 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String handleAljazeeraImage() {
    String notAvailableImage =
        "https://th.bing.com/th/id/R.dff8349980f1d590649d801f7db1f2b7?rik=hLQjPAknWZSZ9g&pid=ImgRaw&r=0";
    if (article.urlToImage == null || article.urlToImage == "") {
      return AppConstants.notFoundImage;
    } else if (article.urlToImage != null || article.urlToImage != "") {
      if (article.urlToImage!.contains("www.aljazeera.com")) {
        return notAvailableImage;
      }
    }
    return article.urlToImage ?? AppConstants.notFoundImage;
  }
}
