import 'package:FootballApp/models/article_detail.dart';
import 'package:dio/dio.dart';
import 'package:FootballApp/models/article.dart';
import '../api_providers/article_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleRepository {
  ArticleApiProvider _articleProvider = ArticleApiProvider();

  Future<List<Article>> fetchArticleData({int page}) async {
    List<Article> _articles = [];
    Response<Map> articleList =
        await _articleProvider.fetchArticleList(page: page);
    for (Map data in articleList.data['data']) {
      _articles.add(Article(
          id: data['id'],
          title: data['title'],
          date: data['published'],
          image: data['image'],
          slug: data['slug'],
          url: data['url']));
    }
    return _articles;
  }

  Future<ArticleDetail> fetchArticleDetail({String slug}) async {
    Response<Map> articleDetail =
        await _articleProvider.fetchArticleDetail(slug: slug);
    final data = articleDetail.data['data'];
    return ArticleDetail(
      author: data['author'],
      content: data['article'],
    );
  }

  Stream<QuerySnapshot> getCommentsSnapshot({String articleID}) {
    return FirebaseFirestore.instance
        .collection('comments')
        .where('id_article', isEqualTo: articleID)
        .snapshots();
  }
}
