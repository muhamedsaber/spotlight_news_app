import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleData {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  ArticleData({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleData.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDataToJson(this);
}

@JsonSerializable()
class Articles {
  final List<ArticleData> articles;

  Articles({required this.articles});
  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}
