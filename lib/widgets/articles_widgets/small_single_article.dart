import 'package:FootballApp/pages/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../animated_widgets/bookmark_icon.dart';

class LittleArticle extends StatelessWidget {
  final String imagePath;
  final String heroTag;
  final String description;
  final String date;
  final String author;
  final String title;
  final int comments;
  final Color titleColor;

  LittleArticle(
      {this.imagePath,
      this.description,
      this.date,
      this.author,
      this.comments,
      this.title,
      this.titleColor,
      this.heroTag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleDetailPage(imagePath: imagePath)));
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          height: 170,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: HexColor('D9D6D6'), blurRadius: 5, spreadRadius: 0)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                width: 110,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                          imagePath,
                        )),
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            title,
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: HexColor('888888'),
                        ),
                        width: 120,
                        height: 25,
                      ),
                      SizedBox(height: 10),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 0.2,
                        color: HexColor('C4C4C4'),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(author,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: HexColor('373737'),
                                          fontSize: 14)),
                              Text(
                                date,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: HexColor('373737'),
                                        fontSize: 12),
                              )
                            ],
                          ),
                          BookmarkIcon(
                            iconColor: HexColor('676767'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
