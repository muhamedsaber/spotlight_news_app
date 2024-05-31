import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotlight/core/extensions/theme_extension.dart';
import 'package:spotlight/features/daily_news/presentation/logic/trendings_animator/cubit/trending_animator_cubit.dart';

// i couldn't refactor this Two widgets any more but i tryied too hard to
// make them simple and well implemented as i can

class CustomTextfield extends StatefulWidget {
  final String hintText;
  final Function(String)? onSubmitted;

  const CustomTextfield(
      {super.key, required this.hintText, required this.onSubmitted});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    // i used  with changable radius here so i can animate the container after
    // presseng on the bottom the container will animate to the top and it will face a
    // ui problem because the idea here to make the textfield and the trending container
    // look like as a single widget they should complete each other so i made a radius change
    /// based on the [TrendingAnimatorState]
    return BlocBuilder<TrendingAnimatorCubit, TrendingAnimatorState>(
        builder: (context, state) {
      if (state is TrendingAnimatorStarts) {
        return Container(
          height: 60,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: TextFieldContent(
            onSubmitted: widget.onSubmitted,
            hintText: widget.hintText,
            onPressed: () {
              context.read<TrendingAnimatorCubit>().toggleAnimation();
            },
          ),
        );
      } else {
        return Container(
          height: 60,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextFieldContent(
            hintText: widget.hintText,
            onSubmitted: widget.onSubmitted,
            onPressed: () {
              context.read<TrendingAnimatorCubit>().toggleAnimation();
            },
          ),
        );
      }
    });
  }
}

class TextFieldContent extends StatelessWidget {
  const TextFieldContent({
    super.key,
    required this.hintText,
    required this.onSubmitted,
    required this.onPressed,
  });

  final String hintText;
  final Function(String)? onSubmitted;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      onSubmitted: onSubmitted,
      style: TextStyle(
        color: context.theme.colorScheme.onSurface,
        fontSize: 18.sp,
        decorationThickness: 0,
      ),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        hintText: hintText,
        hintStyle: TextStyle(
          color: context.theme.colorScheme.onSurface,
          fontSize: 18.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: context.theme.colorScheme.surface,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: context.theme.colorScheme.surface,
          ),
        ),
        prefixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: context.theme.colorScheme.onSurface,
          size: 18.h,
        ),
        suffixIcon: IconButton(
          onPressed: onPressed,
          style: ButtonStyle(
            splashFactory: InkSplash.splashFactory,
            backgroundColor: WidgetStateColor.resolveWith(
              (states) => context.theme.colorScheme.onSurface,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          /// here we transform the main icon of the buttom based on the state of the bloc
          /// if the [state]
          icon: BlocBuilder<TrendingAnimatorCubit, TrendingAnimatorState>(
            builder: (context, state) {
              /// if the [state] is [TrendingAnimatorStarts] we rotate the icon
              /// to the top
              /// else we rotate the icon to the bottom
              /// this is done by using the [TweenAnimationBuilder] widget
              if (state is TrendingAnimatorStarts) {
                return TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  tween: Tween<double>(begin: 0.0, end: pi),
                  builder: (context, value, child) {
                    return Transform.rotate(
                      angle: value,
                      child: child,
                    );
                  },
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: context.theme.primaryColor,
                    size: 25.h,
                  ),
                );
              } else {
                return TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  tween: Tween(begin: 3.14, end: pi),
                  builder: (context, value, child) {
                    return Transform.rotate(
                      angle: value,
                      child: child,
                    );
                  },
                  child: Icon(
                    Icons.arrow_drop_up,
                    color: context.theme.primaryColor,
                    size: 25.h,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
