import 'package:dio/dio.dart';

const String apiKey = 'fbd40d9f61mshfe81c3866b99126p10515cjsnbb42f39f1510';
const String host = 'livescore-football.p.rapidapi.com';
const String listURL =
    'https://livescore-football.p.rapidapi.com/soccer/news-list';
const String detailURL =
    'https://livescore-football.p.rapidapi.com/soccer/news-detail';

class ArticleApiProvider {
  Future<Response<Map>> fetchArticleList({int page}) async {
    return await Dio(BaseOptions(
            headers: {'x-rapidapi-key': apiKey, 'x-rapidapi-host': host}))
        .get(listURL + '?page=$page');
  }

  Future<Response<Map>> fetchArticleDetail({String slug}) async {
    return await Dio(BaseOptions(
            headers: {'x-rapidapi-key': apiKey, 'x-rapidapi-host': host}))
        .get(detailURL + '?slug=$slug');
  }
}
