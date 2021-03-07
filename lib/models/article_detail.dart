import 'package:equatable/equatable.dart';

class ArticleDetail extends Equatable {
  final String id;
  final String title;
  final String image;
  final String author;
  final String date;
  final String url;
  final List<dynamic> content;

  ArticleDetail(
      {this.id,
      this.title,
      this.date,
      this.image,
      this.author,
      this.content,
      this.url});

  @override
  List<Object> get props => [id, title, image, author, date, url];
}
