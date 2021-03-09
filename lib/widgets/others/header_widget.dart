import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String label;

  Header({this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: Text(label,
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 22)),
    );
  }
}
