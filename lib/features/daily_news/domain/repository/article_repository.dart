import 'package:clean_bloc_news/core/resources/data_state.dart';
import 'package:clean_bloc_news/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}