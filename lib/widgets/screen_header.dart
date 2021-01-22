import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHeader extends StatelessWidget {
  final String title;

  ScreenHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(color: Colors.red),
      ),
    );
  }
}
