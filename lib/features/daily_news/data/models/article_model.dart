import 'package:clean_bloc_news/core/util/constants.dart';
import 'package:clean_bloc_news/features/daily_news/domain/entities/article_entity.dart';

class ArticleResponseModel extends ArticleResponseEntity {
  const ArticleResponseModel({
    String? status,
    int? totalResults,
    List<ArticleEntity>? articles
  }) : super (
    status: status,
    totalResults: totalResults,
    articles: articles
  );

  factory ArticleResponseModel.fromJson(Map<String, dynamic> json) {
    return ArticleResponseModel(
      status: json["status"] ?? "",
      totalResults: json["totalResults"] ?? 0,
      articles: (json["articles"] as List<dynamic>?)
          ?.map((e) => ArticleModel.fromJson(e))
          .toList(),
    );
  }
}

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? desc,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content
  }) : super (
    id: id,
    author: author,
    title: title,
    desc: desc,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      desc: json['desc'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] != null && json['urlToImage'] != "" ? json['urlToImage'] : kDefaultImage,
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      desc: entity.desc,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content
    );
  }
}