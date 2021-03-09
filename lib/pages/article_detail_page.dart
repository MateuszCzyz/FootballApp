import 'package:FootballApp/functions/calucate_article_time.dart';
import 'package:FootballApp/resources/repositories/article_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../widgets/animated_widgets/bookmark_icon.dart';
import '../widgets//animated_widgets/share_icon.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_html/flutter_html.dart';
import '../blocs/article_detail_bloc/article_detail_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleDetailPage extends StatelessWidget {
  final String id;
  final String title;
  final String url;
  final String image;
  final String slug;
  final String date;

  ArticleDetailPage(
      {this.id, this.title, this.url, this.image, this.slug, this.date});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocProvider<ArticleDetailBloc>(
      create: (context) => ArticleDetailBloc(
        articleRepository: RepositoryProvider.of<ArticleRepository>(context),
      )..add(FetchDetail(slug: slug, articleID: id)),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 3,
            backgroundColor: HexColor('FBFBFB'),
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShareIcon(
                        iconColor: Colors.white,
                        shareTitle: title,
                        shareURL: url,
                      ),
                      SizedBox(width: 3),
                      BookmarkIcon(
                        iconColor: Colors.white,
                      ),
                      SizedBox(
                        width: 3,
                      )
                    ],
                  )),
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: CachedNetworkImageProvider(
                          image,
                        ))),
              ),
            ),
          ),
          Detail()
        ],
      ),
    )));
  }
}

class Detail extends StatelessWidget {
  final String date;
  final String title;

  Detail({this.date, this.title});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
      builder: (context, state) {
        if (state is SuccessFetchedDetail) {
          Map<String, String> articleTime = calculateTimeOfArticle(date: date);
          return SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 5),
                Text(title,
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                ...state.articleDetail.content
                    .map((el) => Html(
                          padding: EdgeInsets.zero,
                          data: el['p'],
                          defaultTextStyle:
                              Theme.of(context).textTheme.bodyText1,
                        ))
                    .toList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.articleDetail.author,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      articleTime['date'],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                CommentsStream(
                  commentsStream: state.commentsSnapshot,
                )
              ]),
            ),
          );
        } else if (state is FailureFetchedDetail) {
          return SliverFillRemaining(
            child: Text('failure'),
          );
        } else {
          return SliverFillRemaining(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}

class CommentsStream extends StatelessWidget {
  final Stream<QuerySnapshot> commentsStream;

  CommentsStream({this.commentsStream});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        StreamBuilder(
          stream: commentsStream,
          builder: (context, snap) {
            return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Text('ff');
            }, childCount: 10));
          },
        )
      ],
    );
  }
}
