import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/config/database/article_saver.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';

class ArticleFullView extends StatefulWidget {
  const ArticleFullView(
      {super.key, required this.article, required this.isArticlesForHomeView});
  final ArticleData article;
  final bool isArticlesForHomeView;
  @override
  State<ArticleFullView> createState() => _ArticleFullViewState();
}

class _ArticleFullViewState extends State<ArticleFullView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 5.h),
          buildDragIndicator(context),
          SizedBox(height: 10.h),
          buildImage(context),
          SizedBox(height: 10.h),
          buildArticleContent(context),
        ],
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
          Text(DateTime.parse(widget.article.publishedAt ?? "")
              .toString()
              .substring(0, 10)),
          SizedBox(width: 5.w),
          const Icon(Icons.access_time),
          SizedBox(width: 5.w),
          Text(DateTime.parse(widget.article.publishedAt ?? "")
              .toString()
              .substring(11, 16)),
        ],
      ),
    );
  }

  Widget buildDragIndicator(BuildContext context) {
    return Container(
      height: 5.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(10000.r),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.surface.withOpacity(0.1),
                Theme.of(context).colorScheme.surface.withOpacity(0.5),
                Theme.of(context).colorScheme.surface.withOpacity(0.9),
              ],
            ),
          ),
          child: Hero(
            tag: widget.article.urlToImage ?? " ",
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
        Positioned(
          bottom: 10.h,
          right: 25.w,
          child: buildDateTimeInfo(context),
        ),
        widget.isArticlesForHomeView
            ? Positioned(
                top: 10.h,
                left: 20.w,
                child: IconButton(
                  onPressed: () {
                    ArticleSaver().saveArticle(context, widget.article);
                  },
                  icon: Icon(
                    Icons.bookmark,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30.h,
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.surface,
                      ),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ))),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }

  Widget buildArticleContent(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          buildArticleText(
              context, widget.article.title, FontWeight.bold, 16.sp),
          buildSpacer(10.h),
          buildArticleText(
              context, widget.article.description, FontWeight.w400, 14.sp),
          buildSpacer(10.h),
          buildArticleText(
              context, widget.article.content, FontWeight.w400, 14.sp),
          buildSpacer(20.h),
          buildAuthorInfo(context),
          buildSpacer(10.h),
          buildSpacer(50.h),
        ],
      ),
    );
  }

  Widget buildArticleText(BuildContext context, String? text,
      FontWeight fontWeight, double fontSize) {
    return Text(
      text ?? " ",
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }

  Widget buildSpacer(double height) {
    return SizedBox(height: height);
  }

  Widget buildAuthorInfo(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.person_pin_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Text(
            widget.article.author ?? " ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  String handleImage() {
    if (widget.article.urlToImage == null ||
        widget.article.urlToImage!.isEmpty) {
      return AppConstants.errorImage;
    } else if (widget.article.urlToImage!.contains("www.aljazeera.com")) {
      return AppConstants.errorImage;
    }
    return widget.article.urlToImage!;
  }
}
