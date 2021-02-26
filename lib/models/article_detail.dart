class ArticleDetail {
  String id;
  String title;
  String image;
  String author;
  String date;
  String url;
  List<String> content;

  ArticleDetail(
      {this.id,
      this.title,
      this.date,
      this.image,
      this.author,
      this.content,
      this.url});
}
