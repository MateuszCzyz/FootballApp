import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('FBFBFB'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sign up panel',
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
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(90))),
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
                        borderSide:
                            BorderSide(width: 0.5, color: HexColor('FBFBFB')))),
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
                        borderSide:
                            BorderSide(width: 0.5, color: HexColor('FBFBFB')))),
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
                    labelText: 'Repeat password',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide:
                            BorderSide(width: 0.5, color: HexColor('FBFBFB')))),
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
                  'Create an account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
