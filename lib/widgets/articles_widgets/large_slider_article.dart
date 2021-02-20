import 'package:FootballApp/widgets/animated_widgets/share_icon.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../animated_widgets/bookmark_icon.dart';

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
                ShareIcon(),
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
              fit: BoxFit.fitWidth, image: NetworkImage(imagePath)),
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey),
    );
  }
}
