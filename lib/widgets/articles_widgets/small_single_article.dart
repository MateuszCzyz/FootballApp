import 'package:FootballApp/pages/article_detail_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:FootballApp/functions/calucate_article_time.dart';
import '../animated_widgets/bookmark_icon.dart';
import '../others/time_widget.dart';

class LittleArticle extends StatelessWidget {
  final String id;
  final String title;
  final String url;
  final String image;
  final String slug;
  final String date;

  LittleArticle(
      {this.id, this.title, this.image, this.slug, this.date, this.url});

  @override
  Widget build(BuildContext context) {
    Map<String, String> articleTime = calculateTime(date: date);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => ArticleDetailPage(
                  id: id,
                  url: url,
                  title: title,
                  image: image,
                  slug: slug,
                  date: date,
                )));
      },
      child: Container(
        height: 170,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: HexColor('D9D6D6'), blurRadius: 5, spreadRadius: 0)
            ]),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: CachedNetworkImageProvider(
                          image,
                        ))),
              ),
            ),
            Expanded(
                flex: 7,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TimeWidget(
                                timeSincePublished:
                                    articleTime['timeSincePublished'],
                                color: '888888',
                              ),
                              SizedBox(height: 10),
                              AutoSizeText(
                                title,
                                maxLines: 3,
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  articleTime['date'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: HexColor('373737'),
                                          fontSize: 12),
                                ),
                                BookmarkIcon(
                                  iconColor: HexColor('676767'),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
