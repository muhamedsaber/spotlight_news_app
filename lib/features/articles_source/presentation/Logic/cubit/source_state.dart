import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotlight/features/articles_source/data/models/source_model.dart';
part 'source_state.freezed.dart';

@freezed
class SourceState with _$SourceState {
  const factory SourceState.initial() = _Initial;
  const factory SourceState.loading() = Loading;
  const factory SourceState.success(Sources sources) = Success;
  const factory SourceState.error(String message) = Error;
}
