// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesSourceModel _$ArticlesSourceModelFromJson(Map<String, dynamic> json) =>
    ArticlesSourceModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      category: json['category'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$ArticlesSourceModelToJson(
        ArticlesSourceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };

Sources _$SourcesFromJson(Map<String, dynamic> json) => Sources(
      sources: (json['sources'] as List<dynamic>)
          .map((e) => ArticlesSourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'sources': instance.sources,
    };
