part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class SuccessFetchedArticles extends ArticleState {
  final List<Article> articles;

  SuccessFetchedArticles({this.articles});
  @override
  List<Object> get props => [articles];
}

class FailureFetchedArticles extends ArticleState {}
