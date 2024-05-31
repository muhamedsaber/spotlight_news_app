import 'package:freezed_annotation/freezed_annotation.dart';
part 'source_model.g.dart';

@JsonSerializable()
class ArticlesSourceModel {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  ArticlesSourceModel(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});
  factory ArticlesSourceModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesSourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesSourceModelToJson(this);
}
@JsonSerializable()
class Sources {
  final List<ArticlesSourceModel> sources;
  Sources({required this.sources});
  factory Sources.fromJson(Map<String, dynamic> json) =>
      _$SourcesFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesToJson(this);
}
