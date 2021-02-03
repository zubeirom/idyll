import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idyll/providers/favorite.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/widgets/regular_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class RessourceModal extends StatelessWidget {
  final Article article;
  final bool isFavorite;
  final MethodChannel _channel = const MethodChannel('social_share');

  RessourceModal(this.article, this.isFavorite);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<String> shareOnTwitter(String captionText,
      {List<String> hashtags, String url, String trailingText}) async {
    try {
      Map<String, dynamic> args;
      String modifiedUrl;
      if (Platform.isAndroid) {
        modifiedUrl = Uri.parse(url).toString().replaceAll('#', "%23");
      } else {
        modifiedUrl = Uri.parse(url).toString();
      }
      if (hashtags != null && hashtags.isNotEmpty) {
        String tags = "";
        hashtags.forEach((f) {
          tags += ("%23" + f.toString() + " ").toString();
        });
        args = <String, dynamic>{
          "captionText": captionText + "\n" + tags.toString(),
          "url": modifiedUrl,
          "trailingText": Uri.parse(trailingText).toString()
        };
      } else {
        args = <String, dynamic>{
          "captionText": Uri.parse(captionText + " ").toString(),
          "url": modifiedUrl,
          "trailingText": Uri.parse(trailingText).toString()
        };
      }
      print('hello');
      final String version = await _channel.invokeMethod('shareTwitter', args);
      return version;
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          article.urlToImage != null
              ? Container(
                  height: 280,
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
                )
              : SizedBox(height: 1),
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
                        icon: FaIcon(FontAwesomeIcons.twitter),
                        onPressed: () {
                          shareOnTwitter(article.title,
                              url: article.url,
                              hashtags: ["found", "on", "idyll"],
                              trailingText: "").then((res) {
                                if(Platform.isIOS && res == "cannot find Twitter app") {
                                  launch(Uri.encodeFull("https://twitter.com/intent/tweet?text=${article.title}&url=${article.url}"), forceSafariVC: true);
                                }
                              });
                        },
                        color: Colors.black,
                        iconSize: 16,
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(211, 211, 211, 100),
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.share),
                        onPressed: () {
                          Share.share(article.title + " " + article.url,
                              subject: "Hey look what I've found on Idyll!");
                        },
                        color: Colors.black,
                        iconSize: 16,
                      ),
                    ),
                    SizedBox(width: 10),
                    isFavorite
                        ? CircleAvatar(
                            backgroundColor: Color.fromRGBO(211, 211, 211, 100),
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: Text(
                                      'Are you sure?',
                                      style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    content: Text(
                                      'Do you want to remove the article from your favorites?',
                                      style: GoogleFonts.openSans(),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text(
                                          'No',
                                          style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(ctx).pop(false);
                                        },
                                      ),
                                      FlatButton(
                                        child: Text(
                                          'Yes',
                                          style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(ctx).pop(true);
                                        },
                                      ),
                                    ],
                                  ),
                                ).then((val) {
                                  if (val) {
                                    Provider.of<Favorite>(context,
                                            listen: false)
                                        .deleteArticle(article);
                                    Navigator.of(context).pop();
                                  }
                                });
                              },
                              color: Colors.black,
                              iconSize: 16,
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Color.fromRGBO(211, 211, 211, 100),
                            child: IconButton(
                              icon: Icon(Icons.bookmark),
                              onPressed: () {
                                Provider.of<Favorite>(context, listen: false)
                                    .addNewsArticle(article);

                                Flushbar(
                                  animationDuration:
                                      Duration(milliseconds: 500),
                                  borderRadius: 8,
                                  messageText: AutoSizeText(
                                    'Added article to favorites!',
                                    style: GoogleFonts.domine(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  mainButton: FlatButton(
                                    child: AutoSizeText(
                                      'Undo',
                                      style: GoogleFonts.domine(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Provider.of<Favorite>(context,
                                              listen: false)
                                          .deleteArticle(article);
                                    },
                                  ),
                                  duration: Duration(seconds: 2),
                                )..show(context);
                              },
                              color: Colors.black,
                              iconSize: 16,
                            ),
                          )
                  ],
                ),
                RegularButton(
                    article.category == "YouTube"
                        ? "View video"
                        : "Read article", () {
                  _launchURL(article.url);
                })
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: AutoSizeText(
              "${article.provider}  •  ${DateFormat('MMM.dd,yyyy').format(article.publishedAt)}  •  ${DateFormat.jm().format(article.publishedAt)}  •  ${article.category}",
              style: GoogleFonts.domine(
                textStyle: TextStyle(color: Colors.black, fontSize: 12),
              ),
              softWrap: true,
              minFontSize: 12,
            ),
          ),
          SizedBox(height: 15),
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
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(article.description),
          )
        ],
      ),
    );
  }
}
