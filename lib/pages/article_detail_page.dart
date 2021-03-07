import 'package:FootballApp/resources/repositories/article_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../widgets/animated_widgets/bookmark_icon.dart';
import '../widgets//animated_widgets/share_icon.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_html/flutter_html.dart';
import '../blocs/article_detail_bloc/article_detail_bloc.dart';

class ArticleDetailPage extends StatelessWidget {
  final String id;
  final String shareURL;
  final String title;
  final String imagePath;

  ArticleDetailPage({this.imagePath, this.id, this.shareURL, this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => ArticleDetailBloc(
          articleRepository: RepositoryProvider.of<ArticleRepository>(context)),
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                        shareURL: shareURL,
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
                          imagePath,
                        ))),
              ),
            ),
          ),
          BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
            builder: (context, state) {
              if (state is SuccessFetchedDetail) {
                return SliverList(
                  delegate: SliverChildListDelegate(state.articleDetail.content
                      .map((el) => Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Html(
                              padding: EdgeInsets.zero,
                              data: el['p'],
                            ),
                          ))
                      .toList()),
                );
              } else if (state is FailureFetchedDetail) {
                return SliverToBoxAdapter(
                  child: Text('failure'),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          )
        ],
      )),
    ));
  }
}
