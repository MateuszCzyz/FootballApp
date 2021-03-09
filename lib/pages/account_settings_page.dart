import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/others/header_widget.dart';

class AccountSettingsPage extends StatelessWidget {
  final User user;

  AccountSettingsPage({this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              centerTitle: true,
              title: Text(
                'FootballApp',
                style: GoogleFonts.mogra(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            ),
          ),
          body: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Header(label: 'Account settings'),
                  SingleSetting(
                    icon: Icons.person,
                    label: 'Change account nickname',
                  ),
                  SingleSetting(
                    icon: Icons.email,
                    label: 'Change account email',
                  ),
                  SingleSetting(
                    icon: Icons.lock,
                    label: 'Set new password',
                  ),
                  SingleSetting(
                    icon: Icons.image,
                    label: 'Set account image',
                  ),
                ],
              ))),
    );
  }
}

enum SettingType { nickname, email, password, image }

class SingleSetting extends StatelessWidget {
  final IconData icon;
  final String label;
  final SettingType settingType;

  SingleSetting({this.icon, this.label, this.settingType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6, bottom: 6),
      height: 50,
      child: RaisedButton(
        highlightElevation: 0.5,
        elevation: 0.2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: HexColor('EFEFEF'),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 10),
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 16))
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
