import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutDrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 5),
            Icon(Icons.help_outline, color: HexColor('666666')),
            SizedBox(width: 5),
            Text(
              'About application',
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
