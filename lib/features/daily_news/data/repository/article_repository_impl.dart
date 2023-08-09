import 'dart:io';

import 'package:clean_bloc_news/core/resources/data_state.dart';
import 'package:clean_bloc_news/core/util/constants.dart';
import 'package:clean_bloc_news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_bloc_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_bloc_news/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: "id",
        category: 'general'
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
          )
        );
      }
    } on DioException catch(e) {
      return DataFailed(e);
    }
  }
}