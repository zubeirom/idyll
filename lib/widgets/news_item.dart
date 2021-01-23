import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  NewsItem(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageUrl),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                title,
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
                'CBS News  •  ${DateFormat('MMM.dd,yyyy').format(DateTime.now())}  •  ${DateFormat.jm().format(DateTime.now())}',
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
