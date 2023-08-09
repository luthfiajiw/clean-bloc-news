import 'package:clean_bloc_news/core/resources/data_state.dart';
import 'package:clean_bloc_news/core/usecases/usecase.dart';
import 'package:clean_bloc_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_bloc_news/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
  
}