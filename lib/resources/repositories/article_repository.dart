import 'package:FootballApp/models/article_detail.dart';
import 'package:dio/dio.dart';
import 'package:FootballApp/models/article.dart';
import '../api_providers/article_provider.dart';

class ArticleRepository {
  ArticleApiProvider _articleProvider = ArticleApiProvider();
  List<Article> _articles = [];
  int _page = 0;

  Future<void> fetchArticleData() async {
    Response<Map> articleList =
        await _articleProvider.fetchArticleList(page: _page++);
    for (Map data in articleList.data['data']) {
      _articles.add(Article(
          id: data['id'],
          title: data['title'],
          date: data['published'],
          image: data['image'],
          slug: data['slug'],
          url: data['url']));
    }
  }

  Future<ArticleDetail> fetchArticleDetail({String slug}) async {
    Response<Map> articleDetail =
        await _articleProvider.fetchArticleDetail(slug: slug);
    final data = articleDetail.data['data'];
    return ArticleDetail(
        id: data['id'],
        title: data['title'],
        date: data['published'],
        image: data['image']['url'],
        author: data['author'],
        content: data['article'],
        url: data['url']);
  }

  List<Article> get getArticles => _articles;
}
