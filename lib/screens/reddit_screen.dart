import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/providers/reddit.dart';
import 'package:idyll/widgets/product_hunt/image_article_item.dart';
import 'package:idyll/widgets/screen_header.dart';
import 'package:provider/provider.dart';

import 'search_screen.dart';

class RedditScreen extends StatefulWidget {
  static const routeName = "/reddit";
  @override
  _RedditScreenState createState() => _RedditScreenState();
}

class _RedditScreenState extends State<RedditScreen> {
  var _isLoading = false;
  var _isInit = true;
  List<Article> articles;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final reddit = Provider.of<Reddit>(context, listen: false);
      reddit.getNewsArticles().then((_) {
        setState(() {
          _isLoading = false;
        });
        articles = reddit.newsArticles;
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshPage(BuildContext context) async {
    setState(() {
      _isInit = true;
    });
    didChangeDependencies();
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
              onPressed: () =>
                  Navigator.of(context).pushNamed(SearchScreen.routeName),
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
        title: ScreenHeader('Reddit'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshPage(context),
        child: _isLoading
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
                        child: ScreenHeader("Hottest subreddits"),
                      ),
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: articles
                            .map((article) => ImageArticleItem(article))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
