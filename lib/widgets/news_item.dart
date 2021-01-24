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
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
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
    return Column(
      children: [
        ListTile(
          onTap: () {
            // Navigator.of(context)
            //     .pushNamed(RessourceScreen.routeName, arguments: article);
            showModal(context);
          },
          contentPadding: EdgeInsets.only(right: 10),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(article.urlToImage,
                height: 50, width: 70, fit: BoxFit.cover),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                article.title,
                minFontSize: 13,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 3,
                style: GoogleFonts.domine(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
              SizedBox(height: 2),
              AutoSizeText(
                '${article.source['name']}  •  ${DateFormat('MMM.dd,yyyy').format(article.publishedAt)}  •  ${DateFormat.jm().format(article.publishedAt)}',
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
