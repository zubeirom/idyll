import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/widgets/ressource_modal.dart';
import 'package:intl/intl.dart';

class NewsItem extends StatelessWidget {
  final Article article;

  NewsItem(this.article);

  void showModal(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: RessourceModal(article),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModal(context),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 10),
        AutoSizeText(
          article.title,
          style: GoogleFonts.domine(
            textStyle: TextStyle(color: Colors.black, fontSize: 16),
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
            textStyle: TextStyle(color: Colors.black, fontSize: 12),
          ),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          minFontSize: 12,
        ),
        SizedBox(
          height: 10,
        ),
        Divider(color: Colors.black)
      ]),
    );
  }
}
