import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/extensions/theme_extension.dart';
import 'package:spotlight/features/articles_source/data/models/source_model.dart';

class SourceItem extends StatelessWidget {
  const SourceItem({super.key, required this.sourceModel});
  final ArticlesSourceModel sourceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.article,
                    color: context.theme.colorScheme.primary,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      sourceModel.name ?? "Unknown Source",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                sourceModel.description ?? "No description available.",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: context.theme.colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
