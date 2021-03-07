part of 'article_detail_bloc.dart';

abstract class ArticleDetailEvent extends Equatable {
  const ArticleDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchDetail extends ArticleDetailEvent {
  final String slug;
  FetchDetail({this.slug});
}
