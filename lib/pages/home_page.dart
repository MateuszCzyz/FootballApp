import 'package:FootballApp/pages/article_page.dart';
import 'package:FootballApp/pages/login_page.dart';
import 'package:FootballApp/pages/videos_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> pages = [
  ArticlePage(),
  VideosPage(),
  Container(
    color: Colors.green,
  ),
  Container(
    color: Colors.orange,
  ),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: HexColor('FBFBFB'),
          drawer: Drawer(
              child: ListView(
            children: [
              DrawerHeader(
                child: Text('fsdf'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                color: HexColor('6798B4'),
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Text(
              'FootballApp',
              style: GoogleFonts.mogra(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: TabBarView(
            children: pages,
          ),
          bottomNavigationBar: TabBar(
            labelColor: Colors.red,
            indicatorColor: HexColor('6798B4'),
            tabs: [
              Tab(
                icon: Icon(
                  Icons.article,
                  color: HexColor('888686'),
                ),
              ),
              Tab(
                icon: Icon(Icons.play_circle_fill_rounded,
                    color: HexColor('888686')),
              ),
              Tab(
                icon: Icon(Icons.bookmark, color: HexColor('888686')),
              ),
              Tab(
                icon: Icon(Icons.search, color: HexColor('888686')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
