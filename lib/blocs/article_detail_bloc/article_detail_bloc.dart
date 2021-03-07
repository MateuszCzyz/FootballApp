import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../resources/repositories/article_repository.dart';
import '../../models/article_detail.dart';

part 'article_detail_event.dart';
part 'article_detail_state.dart';

class ArticleDetailBloc extends Bloc<ArticleDetailEvent, ArticleDetailState> {
  final ArticleRepository articleRepository;
  ArticleDetailBloc({this.articleRepository}) : super(ArticleDetailInitial());

  @override
  Stream<ArticleDetailState> mapEventToState(
    ArticleDetailEvent event,
  ) async* {
    if (event is FetchDetail) {
      yield LoadingDetail();
      yield* fetchDetailToState(
          articleRepository: articleRepository, slug: event.slug);
    }
  }
}

Stream<ArticleDetailState> fetchDetailToState(
    {ArticleRepository articleRepository, String slug}) async* {
  try {
    ArticleDetail articleDetail =
        await articleRepository.fetchArticleDetail(slug: slug);
    yield SuccessFetchedDetail(articleDetail: articleDetail);
  } catch (e) {
    yield FailureFetchedDetail();
  }
}
