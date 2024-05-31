import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/extensions/theme_extension.dart';

List<String> categories = [
  "General",
  "Business",
  "Entertainment",
  "Health",
  "Science",
  "Sports",
  "Technology"
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
              },
              splashColor: Colors.transparent,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInCubic,
                width: 100,
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
