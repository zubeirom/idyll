import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idyll/providers/news.dart';
import 'package:intl/intl.dart';

import 'ressource_modal.dart';

class Headline extends StatelessWidget {
  final Article article;

  Headline(this.article);

  void showModal(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: RessourceModal(article, false),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300,
          height: 280,
          child: InkWell(
            onTap: () {
              showModal(context);
            },
            child: Card(
              elevation: 0,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      article.urlToImage,
                      height: 180,
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
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          article.title,
                          style: GoogleFonts.domine(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          minFontSize: 16,
                        ),
                        SizedBox(height: 5),
                        AutoSizeText(
                          "${article.provider}  •  ${DateFormat('MMM.dd,yyyy').format(article.publishedAt)}  •  ${DateFormat.jm().format(article.publishedAt)}",
                          style: GoogleFonts.domine(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
