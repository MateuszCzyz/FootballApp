import 'package:FootballApp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 15),
          Text('Most popular articules',
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 15),
          LargeArticle(
            period: 'Today',
            description:
                'Man Utds Ighalo condemns Nigeria killings as Anthony Joshua joins fight for change',
            date: '21 October 2020, 02:45',
            imagePath:
                'https://news.livescore.com/newsapi/04/soccer/image/ighalo-man-utd-nigeria-anthony-joshua-boxing-7-1kwym9jvsu134192dr9y72f4cs.jpg',
          ),
          SizedBox(height: 15),
          LittleArticle(
            titleColor: HexColor('EE9F73'),
            comments: 12,
            author: 'Mateusz Czyzewski',
            date: '21 October',
            title: 'Premier League',
            description:
                'Man Utds Ighalo condemns Nigeria killings as Anthony Joshua joins fight for change',
            imagePath:
                'https://news.livescore.com/newsapi/04/soccer/image/frank-lampard-very-happy-timo-werner-despite-back-to-back-chelsea-stalemates-7-14jv0ntwy61nk1uxehspwpjm48.jpg',
          ),
          SizedBox(height: 15),
          LittleArticle(
            titleColor: HexColor('779DFF'),
            comments: 12,
            author: 'Yuval Harrari',
            date: '21 October',
            title: 'Premier League',
            description:
                'Man Utds Ighalo condemns Nigeria killings as Anthony Joshua joins fight for change',
            imagePath:
                'https://news.livescore.com/newsapi/04/soccer/image/zinedine-zidane-unfazed-by-critics-clasico-win-7-1gyzscvwdyo5i1q7jxncosl18d.jpg',
          ),
          SizedBox(height: 15),
          LittleArticle(
            titleColor: HexColor('EE9F73'),
            comments: 12,
            author: 'Mateusz Czyzewski',
            date: '21 October',
            title: 'Premier League',
            description:
                'Man Utds Ighalo condemns Nigeria killings as Anthony Joshua joins fight for change',
            imagePath:
                'https://news.livescore.com/newsapi/04/soccer/image/diogo-jota-get-better-liverpool-jurgen-klopp-7-1bcnjpqix5rxv18caadix5p2nj.jpg',
          ),
          SizedBox(height: 15),
          LittleArticle(
            titleColor: HexColor('56DD8C'),
            comments: 12,
            author: 'Mateusz Czyzewski',
            date: '21 October',
            title: 'Premier League',
            description:
                'Man Utds Ighalo condemns Nigeria killings as Anthony Joshua joins fight for change',
            imagePath:
                'https://news.livescore.com/newsapi/04/soccer/image/mikel-arteta-questions-decision-disallow-alexandre-lacazette-goal-arsenal-defeat-leicester-city-7-o4k7lzakrv9i1on0ogh8jolap.jpg',
          ),
        ],
      ),
    );
  }
}

class LittleArticle extends StatelessWidget {
  final String imagePath;
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
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: HexColor('DDDDDD'), blurRadius: 3, spreadRadius: 0)
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
                              fontWeight: FontWeight.bold, color: Colors.white),
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
