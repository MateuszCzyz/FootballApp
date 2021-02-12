import 'package:FootballApp/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FootballApp/pages/article_page.dart';
import 'package:FootballApp/pages/login_page.dart';
import 'package:FootballApp/pages/videos_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/drawer_buttons/login_drawer_button.dart';
import '../widgets/drawer_buttons/logout_drawer_button.dart';

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
              child: Column(
            children: [
              DrawerHeader(
                  child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is SuccesAuthentication) {
                    return Text('Jest zalogowany');
                  } else if (state is FailureAuthentication) {
                    return Text('Nie jest zalogowany');
                  } else {
                    return Text('Ładowanie');
                  }
                },
              )),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is SuccesAuthentication) {
                      return LogoutDrawerButton();
                    } else if (state is FailureAuthentication) {
                      return LoginDrawerButton();
                    } else {
                      return Container(
                        width: 0.0,
                        height: 0.0,
                      );
                    }
                  },
                ),
              ))
            ],
          )),
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
