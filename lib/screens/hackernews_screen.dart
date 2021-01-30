import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idyll/providers/hackernews.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/widgets/news_item.dart';
import 'package:idyll/widgets/screen_header.dart';
import 'package:provider/provider.dart';

class HackerNewsScreen extends StatefulWidget {
  static const routeName = "/hackernews";
  @override
  _HackerNewsScreenState createState() => _HackerNewsScreenState();
}

class _HackerNewsScreenState extends State<HackerNewsScreen> {
  var _isLoading = false;
  var _isInit = true;
  List<Article> articles;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final hackernews = Provider.of<HackerNews>(context);
      hackernews.getNewsArticles().then((_) {
        setState(() {
          _isLoading = false;
        });
        articles = hackernews.newsArticles;
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () => {},
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: true,
        title: ScreenHeader('Hacker News'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Container(
                      child: ScreenHeader("Trending"),
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: articles
                          .map((article) => NewsItem(article, false))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
