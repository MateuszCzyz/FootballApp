part of 'article_detail_bloc.dart';

abstract class ArticleDetailState extends Equatable {
  const ArticleDetailState();

  @override
  List<Object> get props => [];
}

class ArticleDetailInitial extends ArticleDetailState {}

class SuccessFetchedDetail extends ArticleDetailState {
  final ArticleDetail articleDetail;
  SuccessFetchedDetail({this.articleDetail});
}

class FailureFetchedDetail extends ArticleDetailState {}

class LoadingDetail extends ArticleDetailState {}
