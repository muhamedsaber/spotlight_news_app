import 'package:freezed_annotation/freezed_annotation.dart';
part 'articles_state.freezed.dart';

@freezed
abstract class ArticlesState<T> with _$ArticlesState {
  const factory ArticlesState.initial() = _Initial;
  const factory ArticlesState.loading() = Loading;
  const factory ArticlesState.success(T data) = Success;
  const factory ArticlesState.error(String message) = Error;
}
