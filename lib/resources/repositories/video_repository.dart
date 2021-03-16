import '../api_providers/video_provider.dart';
import '../../models/video.dart';
import 'package:dio/dio.dart';

const List<String> leagues = [
  'SPAIN',
  'ENGLAND',
  'ITALY',
  'GERMANY',
  'POLAND',
  'FRANCE',
  'NETHERLANDS',
  'PORTUGAL',
  'CHAMPIONS LEAGUE'
];

class VideoRepository {
  VideoApiProvider _videoApiProvider = VideoApiProvider();

  Future<List<Video>> fetchVideos() async {
    List<Video> videosList = [];
    Response<List<dynamic>> videos = await _videoApiProvider.fetchVideos();
    for (dynamic video in videos.data) {
      bool isCorrectLeague =
          leagues.contains(video['competition']['name'].split(':')[0]);
      if (isCorrectLeague) {
        videosList.add(Video(
            title: video['title'],
            date: video['date'],
            competition: video['competition']['name'],
            image: video['thumbnail'],
            url: 'gfdgfdgfdg'));
      }
    }
    return videosList;
  }
}
