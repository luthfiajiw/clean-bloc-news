import 'package:equatable/equatable.dart';

class ArticleResponseEntity extends Equatable {
  final String? status;
  final int? totalResults;
  final List<ArticleEntity>? articles;

  const ArticleResponseEntity({
    this.status,
    this.totalResults,
    this.articles
  });
  
  @override
  List<Object?> get props => [
    status,
    totalResults,
    articles
  ];
}

class ArticleEntity extends Equatable{
  final int? id;
  final String? author;
  final String? title;
  final String? desc;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    this.id,
    this.author,
    this.title,
    this.desc,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content
  });
  
  @override
  List<Object?> get props => [
    id,
    author,
    title,
    desc,
    url,
    urlToImage,
    publishedAt,
    content
  ];
}