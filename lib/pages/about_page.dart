import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String aboutContent =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa vitae tortor condimentum lacinia quis vel eros donec ac odio tempor orci dapibus ultrices in iaculis nunc sed augue lacus, viverra vitae congue eu, consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus';
const String firstLink =
    'https://www.youtube.com/watch?v=ORLd6mYy4EE&ab_channel=Kana%C5%82Sportowy';
const String secondLink =
    'https://www.youtube.com/watch?v=ORLd6mYy4EE&ab_channel=Kana%C5%82Sportowy';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              title: Text(
                'FootballApp',
                style: GoogleFonts.mogra(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            ),
            body: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account settings',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    SizedBox(height: 10),
                    Text(
                      aboutContent,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 20),
                    Text(
                      firstLink,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 20),
                    Text(
                      secondLink,
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ))));
  }
}
