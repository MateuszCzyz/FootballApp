import 'package:FootballApp/pages/bookmark_page.dart';
import 'package:FootballApp/pages/article_page.dart';
import 'package:FootballApp/pages/videos_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/drawer_widgets/drawer.dart';

List<Widget> pages = [
  //ArticlePage(),
  VideosPage(),
  BookmarkPage(),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: HexColor('FBFBFB'),
          drawer: MyDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              title: Text(
                'FootballApp',
                style: GoogleFonts.mogra(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            ),
          ),
          body: TabBarView(
            children: pages,
          ),
          bottomNavigationBar: TabBar(
            labelColor: Colors.red,
            indicatorColor: HexColor('6798B4'),
            tabs: [
              /* 
              Tab(
                icon: Icon(
                  Icons.article,
                  color: HexColor('888686'),
                ),
              ),
              */
              Tab(
                icon: Icon(Icons.play_circle_fill_rounded,
                    color: HexColor('888686')),
              ),
              Tab(
                icon: Icon(Icons.bookmark, color: HexColor('888686')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
