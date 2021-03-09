import 'package:dio/dio.dart';

const String videoURL = 'https://www.scorebat.com/video-api/v1/';

class VideoApiProvider {
  Future<Response<List<dynamic>>> fetchVideos() async {
    return await Dio().get(videoURL);
  }
}
