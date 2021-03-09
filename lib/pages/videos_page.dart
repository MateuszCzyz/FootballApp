import 'package:FootballApp/blocs/video_bloc/video_bloc.dart';
import 'package:FootballApp/functions/calucate_article_time.dart';
import 'package:FootballApp/widgets/others/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/others/header_widget.dart';
import '../widgets/animated_widgets/bookmark_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hexcolor/hexcolor.dart';

class VideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            if (state is SuccessFetchedVideos) {
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Header(
                    label: 'The newest highlights match',
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: state.videos.length,
                    itemBuilder: (context, index) {
                      Map<String, String> videoTime = calculateTimeOfArticle(
                          date: state.videos[index].date);
                      return SingleVideo(
                        title: state.videos[index].title,
                        competition: state.videos[index].competition,
                        url: state.videos[index].url,
                        image: state.videos[index].image,
                        date: videoTime['date'],
                      );
                    },
                  )
                ],
              );
            } else if (state is FailureFetchedVideos) {
              return Text('error');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

class SingleVideo extends StatelessWidget {
  final String title;
  final String date;
  final String competition;
  final String url;
  final String image;

  SingleVideo({this.title, this.competition, this.url, this.date, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TimeWidget(
          timeSincePublished: date,
          color: '888888',
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(5),
          height: 210,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                    color: HexColor('D9D6D6'), blurRadius: 10, spreadRadius: 0)
              ],
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: CachedNetworkImageProvider(
                    image,
                  ))),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w600)),
                Text(
                  competition,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.black45, fontSize: 12),
                ),
              ],
            ),
            BookmarkIcon(
              iconColor: Colors.grey.shade600,
            )
          ],
        ),
        SizedBox(height: 10),
        Divider()
      ],
    );
  }
}
