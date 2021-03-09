import 'package:FootballApp/functions/calucate_article_time.dart';
import 'package:FootballApp/widgets/animated_widgets/share_icon.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../animated_widgets/bookmark_icon.dart';
import '../../pages/article_detail_page.dart';

class LargeArticle extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final String slug;
  final String date;
  final String url;

  LargeArticle(
      {this.id, this.title, this.image, this.slug, this.date, this.url});

  @override
  Widget build(BuildContext context) {
    Map<String, String> articleTime = calculateTimeOfArticle(date: date);
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
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ShareIcon(
                      shareTitle: title,
                      shareURL: url,
                      iconColor: Colors.white,
                    ),
                    SizedBox(width: 5),
                    BookmarkIcon(
                      iconColor: Colors.white,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          articleTime['timeSincePublished'],
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: HexColor('56DD8C'),
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        title,
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(height: 7),
                      Text(articleTime['date'],
                          style: GoogleFonts.roboto(color: HexColor('D7D7D7')))
                    ],
                  ),
                ),
              )
            ],
          ),
          height: 205,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: HexColor('C8C5C5'), blurRadius: 5, spreadRadius: 0)
              ],
              image: DecorationImage(
                  fit: BoxFit.fitWidth, image: NetworkImage(image)),
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey),
        ),
      ),
    );
  }
}
