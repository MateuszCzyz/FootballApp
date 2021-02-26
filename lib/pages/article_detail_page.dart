import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ArticleDetailPage extends StatelessWidget {
  final String imagePath;
  final String heroTag;

  ArticleDetailPage({this.imagePath, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [],
    )));
  }
}
