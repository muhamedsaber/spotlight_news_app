import 'package:hive/hive.dart';
import 'package:spotlight/features/daily_news/data/models/article_model.dart';

class ArticleAdapter extends TypeAdapter<ArticleData> {
  @override
  ArticleData read(BinaryReader reader) {
    return ArticleData(
      title: reader.read(),
      description: reader.read(),
      url: reader.read(),
      urlToImage: reader.read(),
      publishedAt: reader.read(),
      content: reader.read(),
      author: reader.read(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, ArticleData obj) {
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.url);
    writer.write(obj.urlToImage);
    writer.write(obj.publishedAt);
    writer.write(obj.content);
    writer.write(obj.author);
  }
}
