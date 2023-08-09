import 'package:clean_bloc_news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_bloc_news/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_bloc_news/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_bloc_news/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_bloc_news/features/daily_news/presentation/bloc/remote/remote_news_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  locator.registerSingleton<Dio>(Dio());

  // Dependencies
  locator.registerSingleton<NewsApiService>(NewsApiService(locator()));
  locator.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(locator())
  );

  // UseCases
  locator.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(locator())
  );

  // Blocs
  locator.registerFactory<RemoteNewsBloc>(() {
    return RemoteNewsBloc(locator());
  });
}