part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class SuccessFetchedNextPage extends ArticleState {
  final List<Article> articles;

  SuccessFetchedNextPage({this.articles});
  @override
  List<Object> get props => [articles];
}

class SuccessFetchedFirstPage extends ArticleState {
  final List<Article> articles;

  SuccessFetchedFirstPage({this.articles});
  @override
  List<Object> get props => [articles];
}

class FailureFetchedNextPage extends ArticleState {}

class FailureFetchedFirstPage extends ArticleState {}
