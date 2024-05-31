import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotlight/daily_news/data/models/article_model.dart';
part 'articles_state.freezed.dart';

@freezed
abstract class ArticlesState<T> with _$ArticlesState {
  const factory ArticlesState.initial() = _Initial;
  const factory ArticlesState.loading() = Loading;
  const factory ArticlesState.success(Articles articles) = Success;
  const factory ArticlesState.error(String message) = Error;
}
