import 'dart:async';

import 'package:FootballApp/resources/repositories/video_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:FootballApp/models/video.dart';
import 'package:equatable/equatable.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository _videoRepository;
  VideoBloc({VideoRepository videoRepository})
      : _videoRepository = videoRepository,
        super(VideoInitial());

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if (event is FetchVideos) {
      try {
        yield VideoLoading();
        List<Video> videos = await _videoRepository.fetchVideos();
        yield SuccessFetchedVideos(videos: videos);
      } catch (e) {
        yield FailureFetchedVideos();
      }
    }
  }
}
