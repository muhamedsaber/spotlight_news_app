import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlight/features/daily_news/presentation/logic/trendings_animator/cubit/trending_animator_cubit.dart';
import 'package:spotlight/features/daily_news/presentation/widgets/trendings_gridview.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingAnimatorCubit, TrendingAnimatorState>(
      builder: (context, state) {
        double height = 0.0;
        if (state is TrendingAnimatorStarts) {
          height = 150.0;
        }
        return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: BlocBuilder<TrendingAnimatorCubit, TrendingAnimatorState>(
                builder: (context, s) {
              if (state is TrendingAnimatorStarts) {
                return FutureBuilder(
                    // this Future Time is because the flutter rendering
                    // engine needs some time to render the TrendingGridView
                    // so i used this Future.delayed to make the rendering
                    // to not make a cross between the rendering of the [AnimatedContainer] and the [TrendingGridView]
                    // i gave time to make a Full rendering for the [AnimatedContainer] then i rendered the [TrendingGridView]
                    // its much complex but i tried to make it simple as i can
                    future: Future.delayed(const Duration(milliseconds: 500)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return const TrendingGridView();
                      }
                    });
              } else {
                return const SizedBox.shrink();
              }
            }));
      },
    );
  }
}
