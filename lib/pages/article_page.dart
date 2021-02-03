import 'package:FootballApp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most popular articules',
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 15),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.sms,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
            height: 205,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://news.livescore.com/newsapi/04/soccer/image/ighalo-man-utd-nigeria-anthony-joshua-boxing-7-1kwym9jvsu134192dr9y72f4cs.jpg')),
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey),
          )
        ],
      ),
    );
  }
}
