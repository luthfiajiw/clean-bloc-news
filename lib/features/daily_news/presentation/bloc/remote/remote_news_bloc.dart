import 'package:clean_bloc_news/core/resources/data_state.dart';
import 'package:clean_bloc_news/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_bloc_news/features/daily_news/presentation/bloc/remote/remote_news_event.dart';
import 'package:clean_bloc_news/features/daily_news/presentation/bloc/remote/remote_news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteNewsBloc extends Bloc<RemoteNewsEvent, RemoteNewsState> {
  final GetArticleUseCase _getArticleUseCase;

  // Initital state
  RemoteNewsBloc(this._getArticleUseCase) : super(const RemoteNewsLoading()) {
    on<RemoteGetNews>(onGetNews);
  }

  Future<void> onGetNews(RemoteGetNews event, Emitter<RemoteNewsState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data != null) {
      emit(
        RemoteNewsDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
        RemoteNewsError(dataState.exception!)
      );
    }
  }
}