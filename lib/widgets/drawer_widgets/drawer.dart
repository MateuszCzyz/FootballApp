import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './drawer_buttons/about_drawer_button.dart';
import './drawer_buttons/login_drawer_button.dart';
import './drawer_buttons/logout_drawer_button.dart';
import './drawer_buttons/settings_drawer_button.dart';
import 'package:FootballApp/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Drawer(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (state is SuccesAuthentication)
                        ? Container(
                            alignment: Alignment.center,
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                color: HexColor('6798B4'),
                                shape: BoxShape.circle),
                            child: Text(
                                state.user.displayName
                                    .substring(0, 1)
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)))
                        : Container(width: 0, height: 0),
                    SizedBox(height: 10),
                    (state is SuccesAuthentication)
                        ? Text(
                            'Name: ' + state.user.displayName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 15),
                          )
                        : Text(''),
                    (state is SuccesAuthentication)
                        ? Text(
                            'Email: ' + state.user.email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 15),
                          )
                        : Text('You are not logged in'),
                    SizedBox(height: 10),
                    Divider()
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Divider(),
                    ),
                    (state is SuccesAuthentication)
                        ? SettingsDrawerButton(
                            user: state.user,
                          )
                        : Container(
                            width: 0.0,
                            height: 0.0,
                          ),
                    AboutDrawerButton(),
                    (state is SuccesAuthentication)
                        ? LogoutDrawerButton()
                        : LoginDrawerButton()
                  ],
                ),
              ),
            )
          ]),
        );
      },
    );
  }
}
