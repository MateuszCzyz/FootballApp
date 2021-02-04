import 'package:FootballApp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class VideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 15),
          Text('The newest highlights',
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 15),
          SingleVideoWidget(
            imagePath: 'https://img.youtube.com/vi/sjxBxvFDT4s/hqdefault.jpg',
            side1: 'Liverpool',
            side2: 'West Ham',
            competity: 'England Premier League',
          ),
          SizedBox(height: 15),
          SingleVideoWidget(
            imagePath: 'https:\/\/www.scorebat.com\/og\/m\/og960705.jpeg',
            side1: 'Liverpool',
            side2: 'West Ham',
            competity: 'England Premier League',
          ),
          SizedBox(height: 15),
          SingleVideoWidget(
            imagePath: 'https:\/\/www.scorebat.com\/og\/m\/og1014556.jpeg',
            side1: 'Liverpool',
            side2: 'West Ham',
            competity: 'England Premier League',
          ),
          SizedBox(height: 15),
          SingleVideoWidget(
            imagePath: 'https:\/\/www.scorebat.com\/og\/m\/og984590.jpeg',
            side1: 'Liverpool',
            side2: 'West Ham',
            competity: 'England Premier League',
          ),
        ],
      ),
    );
  }
}

class SingleVideoWidget extends StatelessWidget {
  final String imagePath;
  final String side1;
  final String side2;
  final String competity;

  SingleVideoWidget({this.imagePath, this.side1, this.side2, this.competity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 35,
            ),
          ),
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(
                  fit: BoxFit.fitWidth, image: NetworkImage(imagePath))),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$side1 - $side2', style: TextStyle(fontSize: 16)),
                Text(competity)
              ],
            ),
            Icon(Icons.bookmark_outline)
          ],
        )
      ],
    );
  }
}
