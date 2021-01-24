import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idyll/providers/news.dart';

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
                height: 400,
                width: double.infinity,
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ));
  }
}
