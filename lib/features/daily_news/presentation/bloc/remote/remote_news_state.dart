import 'package:clean_bloc_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteNewsState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exception;

  const RemoteNewsState({this.articles, this.exception});

  @override
  List<Object> get props => [articles!, exception!];
}

class RemoteNewsLoading extends RemoteNewsState {
  const RemoteNewsLoading();
}

class RemoteNewsDone extends RemoteNewsState {
  const RemoteNewsDone(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteNewsError extends RemoteNewsState {
  const RemoteNewsError(DioException exception) : super(exception: exception);
}