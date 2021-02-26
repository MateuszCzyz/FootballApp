import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:FootballApp/resources/repositories/article_repository.dart';
import 'package:FootballApp/models/article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;
  ArticleBloc({this.articleRepository}) : super(ArticleInitial());

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    if (event is FetchArticleData) {
      await articleRepository.fetchArticleData();
      yield SuccessFetchedArticles(articles: articleRepository.getArticles);
    }
  }
}
