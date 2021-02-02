import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight weight;

  ScreenHeader(this.title, {this.size = 25, this.weight = FontWeight.w700});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
            color: Colors.black,
            fontSize: this.size,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
