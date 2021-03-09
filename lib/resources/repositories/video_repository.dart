import '../api_providers/video_provider.dart';
import '../../models/video.dart';
import 'package:dio/dio.dart';

class VideoRepository {
  VideoApiProvider _videoApiProvider = VideoApiProvider();

  Future<List<Video>> fetchVideos() async {
    List<Video> videosList = [];
    Response<List<dynamic>> videos = await _videoApiProvider.fetchVideos();
    videos.data.forEach((video) {
      videosList.add(Video(
          title: video['title'],
          date: video['date'],
          competition: video['competition']['name'],
          image: video['thumbnail'],
          url: 'gfdgfdgfdg'));
    });
    return videosList;
  }
}
