import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlight/core/extensions/media_query.dart';
import 'package:spotlight/core/widgets/empty_data.dart';
import 'package:spotlight/features/articles_source/presentation/Logic/cubit/source_cubit.dart';
import 'package:spotlight/features/articles_source/presentation/Logic/cubit/source_state.dart';
import 'package:spotlight/features/articles_source/presentation/widgets/source_item.dart';

class SourcesBlocListViewBuilder extends StatelessWidget {
  const SourcesBlocListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceCubit, SourceState>(
      builder: (context, state) {
        return state.when(
          initial: () => Padding(
            padding: EdgeInsets.only(top: context.height * 0.4),
            child: const CircularProgressIndicator(),
          ),
          loading: () => Padding(
            padding: EdgeInsets.only(top: context.height * 0.4),
            child: const CircularProgressIndicator(),
          ),
          success: (sources) {
            return sources.sources.isEmpty
                ? const EmptyData(
                    message: "No Sources Found",
                   icon: Icons.now_widgets,
                )
                : Expanded(
                    child: ListView.builder(
                      itemCount: sources.sources.length,
                      itemBuilder: (context, index) {
                        return SourceItem(
                          sourceModel: sources.sources[index],
                        );
                      },
                    ),
                  );
          },
          error: (String message) => Center(
            child: Text(message),
          ),
        );
      },
    );
  }
}
