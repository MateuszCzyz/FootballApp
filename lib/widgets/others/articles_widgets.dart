import 'package:FootballApp/pages/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: Container(
        height: 130,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: HexColor('DDDDDD'), blurRadius: 3, spreadRadius: 0)
            ],
            borderRadius: BorderRadius.circular(5)),
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
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            title,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: titleColor,
                          ),
                          width: 120,
                          height: 17,
                        ),
                        Text('21 October')
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(description),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person,
                                size: 20, color: HexColor('625F5F')),
                            SizedBox(width: 5),
                            Text(author)
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.messenger,
                              size: 17,
                              color: HexColor('625F5F'),
                            ),
                            SizedBox(width: 5),
                            Text('$comments',
                                style: GoogleFonts.nunito(fontSize: 12))
                          ],
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
    );
  }
}

class LargeArticle extends StatelessWidget {
  final String imagePath;
  final String description;
  final String date;
  final String period;

  LargeArticle({this.imagePath, this.description, this.date, this.period});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.sms,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 18,
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
                    child: Text(
                      period,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: HexColor('56DD8C'),
                    ),
                    width: 65,
                    height: 17,
                  ),
                  SizedBox(height: 7),
                  Text(
                    description,
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 17),
                  ),
                  SizedBox(height: 7),
                  Text(date,
                      style: GoogleFonts.roboto(color: HexColor('D7D7D7')))
                ],
              ),
            ),
          )
        ],
      ),
      height: 205,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight, image: NetworkImage(imagePath)),
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey),
    );
  }
}
