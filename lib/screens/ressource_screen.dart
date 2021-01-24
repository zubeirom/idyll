import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/widgets/regular_button.dart';

class RessourceScreen extends StatelessWidget {
  static const routeName = '/ressource';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    final article = ModalRoute.of(context).settings.arguments as Article;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () => Navigator.of(context).pop(),
                  iconSize: 30,
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.bookmark_border_outlined),
                  color: Colors.white,
                  onPressed: () {},
                  iconSize: 30,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
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
        ));
  }
}
