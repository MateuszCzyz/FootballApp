part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class FetchFirstPage extends ArticleEvent {}

class FetchNextPage extends ArticleEvent {}

class FetchDetail extends ArticleEvent {}
