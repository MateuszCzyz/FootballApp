import 'package:FootballApp/pages/video_player_page.dart';
import 'package:flutter/material.dart';

class SingleVideoWidget extends StatelessWidget {
  final String imagePath;
  final String side1;
  final String side2;
  final String competity;

  SingleVideoWidget({this.imagePath, this.side1, this.side2, this.competity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => VideoPlayer()));
      },
      child: Column(
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
      ),
    );
  }
}
