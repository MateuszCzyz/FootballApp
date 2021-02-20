import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsDrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, color: HexColor('666666')),
            SizedBox(width: 5),
            Text(
              'Account settings',
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 15),
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
