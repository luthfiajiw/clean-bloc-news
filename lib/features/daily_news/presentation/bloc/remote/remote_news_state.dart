import 'package:clean_bloc_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteNewsState extends Equatable {
  final ArticleResponseEntity? response;
  final DioException? exception;

  const RemoteNewsState({this.response, this.exception});

  @override
  List<Object> get props => [response!, exception!];
}

class RemoteNewsLoading extends RemoteNewsState {
  const RemoteNewsLoading();
}

class RemoteNewsDone extends RemoteNewsState {
  const RemoteNewsDone(ArticleResponseEntity response) : super(response: response);
}

class RemoteNewsError extends RemoteNewsState {
  const RemoteNewsError(DioException exception) : super(exception: exception);
}