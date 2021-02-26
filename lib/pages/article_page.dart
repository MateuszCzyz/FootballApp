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

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is SuccessFetchedArticles) {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 15),
                Text('Most popular articles',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold, fontSize: 22)),
                const SizedBox(height: 15),
                Slider(
                  articles: state.articles.getRange(0, 5).toList(),
                ),
                SizedBox(height: 15),
                Text('The newest articles',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(height: 5),
                AnotherArticles(
                  articles: state.articles
                      .getRange(6, state.articles.length - 1)
                      .toList(),
                ),
              ],
            ),
          );
        } else if (state is FailureFetchedArticles) {
          return Text('error');
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class AnotherArticles extends StatefulWidget {
  final List<Article> articles;

  AnotherArticles({this.articles});

  @override
  _AnotherArticlesState createState() => _AnotherArticlesState();
}

class _AnotherArticlesState extends State<AnotherArticles> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.articles.map((article) {
      return LittleArticle(
        id: article.id,
        title: article.title,
        image: article.image,
        slug: article.image,
        date: article.date,
      );
    }).toList());
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
      children: [
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
            })
      ],
    );
  }
}
