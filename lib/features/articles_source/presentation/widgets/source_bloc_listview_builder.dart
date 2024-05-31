import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/extensions/media_query.dart';
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
                ? Padding(
                    padding: EdgeInsets.only(top: context.height * 0.3),
                    child: Column(
                      children: [
                        Icon(Icons.now_widgets,
                            size: 50.h, color: Colors.grey[400]
                        ),
                        SizedBox(height:10.h,),
                        Text("No Sources Found!",
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                    ),
                      ],
                    )
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
