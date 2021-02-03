import 'package:FootballApp/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('FBFBFB'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sign in panel',
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    SizedBox(height: 5),
                    Text(
                      'If you want get acces to commenting sport posts and exchange your insights and opinion about concerete situations you have to sign in to our app',
                      style: GoogleFonts.nunito(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                height: 150,
                decoration: BoxDecoration(
                    color: HexColor('6798B4'),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
              ),
              SizedBox(height: 50),
              Container(
                height: 43,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      labelStyle: GoogleFonts.nunito(),
                      labelText: 'Email',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(
                              width: 0.5, color: HexColor('FBFBFB')))),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 43,
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelStyle: GoogleFonts.nunito(),
                      labelText: 'Password',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(
                              width: 0.5, color: HexColor('FBFBFB')))),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 300,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  onPressed: () {},
                  color: HexColor('6798B4'),
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              FlatButton(
                height: 5,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  'Create new account',
                  style: GoogleFonts.nunito(color: HexColor('716B6B')),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    elevation: 0.5,
                    onPressed: () {},
                    color: HexColor('F0F0F0'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/google.svg',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Sign in with google',
                          style: GoogleFonts.nunito(color: Colors.black54),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
