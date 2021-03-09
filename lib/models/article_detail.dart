import 'package:equatable/equatable.dart';

class ArticleDetail extends Equatable {
  final String author;
  final List<dynamic> content;

  ArticleDetail({this.author, this.content});

  @override
  List<Object> get props => [author, content];
}
