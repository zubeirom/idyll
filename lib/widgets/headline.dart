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
    return Row(
      children: [
        Container(
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
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black45,
                  ),
                  width: 300,
                  child: AutoSizeText(
                      "Hotel quarantine for UK arrivals to be discussed",
                      style: GoogleFonts.domine(
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade),
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
