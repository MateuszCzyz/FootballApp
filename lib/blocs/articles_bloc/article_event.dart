part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class FetchArticleData extends ArticleEvent {}

class FetchArticleDetail extends ArticleEvent {}
