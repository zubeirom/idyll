import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headline extends StatelessWidget {
  final String imageUrl;
  // final String title;
  // final String author;

  Headline(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 220,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(imageUrl,
                height: 250, width: double.infinity, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              width: 250,
              child: AutoSizeText(
                  "White House Tried to 'Lock Down' Ukraine Call Records, Whistle-Blower Says",
                  style: GoogleFonts.prata(
                    textStyle: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade),
            ),
          )
        ],
      ),
    );
  }
}
