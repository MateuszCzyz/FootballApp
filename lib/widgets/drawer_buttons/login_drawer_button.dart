import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../pages/login_page.dart';

class LoginDrawerButton extends StatelessWidget {
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              color: HexColor('6798B4'),
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
