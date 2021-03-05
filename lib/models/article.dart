import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String image;
  final String slug;
  final String date;
  final String url;

  Article({this.id, this.title, this.date, this.image, this.slug, this.url});
  @override
  List<Object> get props => [id, title, image, slug, date, url];
}
