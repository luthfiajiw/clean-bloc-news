import 'package:clean_bloc_news/core/util/constants.dart';
import 'package:clean_bloc_news/features/daily_news/data/models/article_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category
  });
}