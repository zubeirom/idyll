import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idyll/providers/favorite.dart';
import 'package:idyll/providers/news.dart';
import 'package:provider/provider.dart';
import '../widgets/news_list.dart';
import '../widgets/screen_header.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = "/favorites";
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  var _isInit = true;
  var _isLoading = false;

  List<Article> favoriteNews;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
        Provider.of<Favorite>(context).getNewsArticles().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
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
        title: ScreenHeader('Favorites'),
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
                      child: TabBar(
                        tabs: [
                          Container(
                            child: FaIcon(FontAwesomeIcons.newspaper),
                          ),
                          Container(
                            child: FaIcon(FontAwesomeIcons.productHunt),
                          ),
                          Container(
                            child: FaIcon(FontAwesomeIcons.youtube),
                          ),
                          Container(
                            child: FaIcon(FontAwesomeIcons.hackerNewsSquare),
                          ),
                          Container(
                            child: FaIcon(FontAwesomeIcons.github),
                          )
                        ],
                        unselectedLabelColor: const Color(0xffacb3bf),
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        isScrollable: false,
                        controller: _tabController,
                      ),
                    ),
                    Container(
                      height: 700,
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          NewsList("News", "news", true),
                          Text('c'),
                          Text('c'),
                          Text('c'),
                          Text('c'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
