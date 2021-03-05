import 'dart:async';
import 'package:FootballApp/blocs/articles_bloc/article_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/articles_widgets/large_slider_article.dart';
import '../widgets/articles_widgets/small_single_article.dart';
import 'package:FootballApp/models/article.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage>
    with AutomaticKeepAliveClientMixin<ArticlePage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          BlocProvider.of<ArticleBloc>(context).add(FetchNextPage());
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      buildWhen: (previousState, state) {
        if (state is SuccessFetchedFirstPage ||
            state is FailureFetchedFirstPage) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is SuccessFetchedFirstPage) {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              children: [
                Slider(
                  articles: state.articles.getRange(0, 5).toList(),
                ),
                AnotherArticles(
                  initialArticles: state.articles
                      .getRange(6, state.articles.length - 1)
                      .toList(),
                ),
              ],
            ),
          );
        } else if (state is FailureFetchedFirstPage) {
          return Text('error');
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class AnotherArticles extends StatefulWidget {
  final List<Article> initialArticles;

  AnotherArticles({this.initialArticles});
  @override
  _AnotherArticlesState createState() => _AnotherArticlesState();
}

class _AnotherArticlesState extends State<AnotherArticles> {
  List<Article> _articles;

  @override
  void initState() {
    super.initState();
    _articles = List.from(widget.initialArticles);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleBloc, ArticleState>(
      listener: (context, state) {
        if (state is SuccessFetchedNextPage) {
          _articles.addAll(state.articles);
        }
      },
      builder: (context, state) {
        return ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              if (index <= _articles.length) {
                if (index == _articles.length) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  Article article = _articles[index];
                  return LittleArticle(
                    id: article.id,
                    title: article.title,
                    image: article.image,
                    slug: article.image,
                    date: article.date,
                  );
                }
              }
            });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Slider extends StatefulWidget {
  final List<Article> articles;

  Slider({this.articles});
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  StreamController _streamController;
  List<Widget> currentSliderPositions =
      List.generate(5, (index) => Container(width: 10, height: 10));

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text('Most popular articles',
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 22)),
        SizedBox(height: 15),
        CarouselSlider(
            items: widget.articles.map((article) {
              return LargeArticle(
                id: article.id,
                title: article.title,
                image: article.image,
                slug: article.slug,
                date: article.date,
                url: article.url,
              );
            }).toList(),
            options: CarouselOptions(
                onPageChanged:
                    (int index, CarouselPageChangedReason changeReason) {
                  _streamController.sink.add(index);
                },
                viewportFraction: 1.0,
                enlargeCenterPage: true)),
        SizedBox(
          height: 5,
        ),
        StreamBuilder(
            initialData: 0,
            stream: _streamController.stream,
            builder: (context, stream) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(5, (index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: stream.data == index
                              ? HexColor('6798B4')
                              : HexColor('C4C4C4'),
                          shape: BoxShape.circle),
                      margin: EdgeInsets.only(top: 10, left: 2.5, right: 2.5),
                      width: 8,
                      height: 8,
                    );
                  }));
            }),
        SizedBox(height: 15),
        Text('The newest articles',
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 22)),
        SizedBox(height: 5),
      ],
    );
  }
}
