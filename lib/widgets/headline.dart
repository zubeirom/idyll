import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idyll/providers/news.dart';

class Headline extends StatelessWidget {
  final Article article;

  Headline(this.article);

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
                child: Image.network(
                  article.urlToImage,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        article.title,
                        style: GoogleFonts.domine(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        minFontSize: 16,
                      ),
                      SizedBox(height: 2),
                      AutoSizeText(
                        "Author: ${article.source['name']}",
                        style: GoogleFonts.domine(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 12,
                      ),
                    ],
                  ),
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
