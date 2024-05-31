
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trending_animator_state.dart';

class TrendingAnimatorCubit extends Cubit<TrendingAnimatorState> {
  TrendingAnimatorCubit() : super(TrendingAnimatorInitial());
    bool isTrendingsOpen = false;

 void toggleAnimation() {
    isTrendingsOpen = !isTrendingsOpen;
    if (isTrendingsOpen) {
      emit(TrendingAnimatorStarts());
    } else {
      emit(TrendingAnimatorEnds());
    }
  }
}
