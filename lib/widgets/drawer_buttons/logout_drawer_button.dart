import 'package:FootballApp/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutDrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 250,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: RaisedButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(LogoutAuthentication());
              },
              color: Colors.red[300],
              child: Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
