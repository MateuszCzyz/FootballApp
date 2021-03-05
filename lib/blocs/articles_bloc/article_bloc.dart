import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:FootballApp/resources/repositories/article_repository.dart';
import 'package:FootballApp/models/article.dart';
part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;
  int page = 1;
  ArticleBloc({this.articleRepository}) : super(ArticleInitial());

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    if (event is FetchFirstPage) {
      yield* fetchFirstPageToState(articleRepository: articleRepository);
    } else if (event is FetchNextPage) {
      yield* fetchNextPageToState(
          articleRepository: articleRepository, page: (++page));
    } else if (event is FetchDetail) {}
  }
}

Stream<ArticleState> fetchFirstPageToState(
    {ArticleRepository articleRepository}) async* {
  try {
    List<Article> _articles = await articleRepository.fetchArticleData(page: 1);
    yield SuccessFetchedFirstPage(articles: List.from(_articles));
  } catch (e) {
    yield FailureFetchedFirstPage();
  }
}

Stream<ArticleState> fetchNextPageToState(
    {ArticleRepository articleRepository, int page}) async* {
  try {
    List<Article> _articles =
        await articleRepository.fetchArticleData(page: page);
    yield SuccessFetchedNextPage(articles: List.from(_articles));
  } catch (e) {
    yield FailureFetchedNextPage();
  }
}
