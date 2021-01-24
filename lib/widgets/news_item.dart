import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/widgets/regular_button.dart';
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.network(
                        article.urlToImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.bookmark_border_outlined),
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ]),
                  )
                ]),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(211, 211, 211, 100),
                            child: IconButton(
                              icon: FaIcon(FontAwesomeIcons.facebookF),
                              onPressed: () {},
                              color: Colors.black,
                              iconSize: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(211, 211, 211, 100),
                            child: IconButton(
                              icon: FaIcon(FontAwesomeIcons.twitter),
                              onPressed: () {},
                              color: Colors.black,
                              iconSize: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(211, 211, 211, 100),
                            child: IconButton(
                              icon: FaIcon(FontAwesomeIcons.share),
                              onPressed: () {},
                              color: Colors.black,
                              iconSize: 16,
                            ),
                          )
                        ],
                      ),
                      RegularButton("Read article", () {})
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    article.title,
                    style: GoogleFonts.domine(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
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
