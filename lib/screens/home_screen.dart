import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/widgets/app_drawer.dart';
import 'package:idyll/widgets/headline.dart';
import 'package:idyll/widgets/home_news_list.dart';
import 'package:provider/provider.dart';
import '../widgets/screen_header.dart';
import './search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;
  var _isInit = true;
  var _isLoading = false;
  var _locale;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Article> headlines;
  Map<String, List<Article>> categoryArticles = {
    'business': [],
    'scienceandtech': [],
    'health': [],
    'sports': [],
    'ussports': [],
    'world': [],
    'products': [],
    'entertainment': [],
  };

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
      });

      Locale myLocale = Localizations.localeOf(context);

      _locale = myLocale.countryCode;

      final newsProvider = Provider.of<News>(context, listen: false);

      newsProvider.getHeadlines(locale: _locale).then((_) {
        headlines = newsProvider.headlines;
        newsProvider.populateCategories().then((_) {
          categoryArticles = newsProvider.categoryArticles;
          setState(() {
            _isLoading = false;
          });
        });
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
      drawer: AppDrawer(),
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
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.sort, color: Colors.black),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: AutoSizeText(
          'Idyll',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Plaster', fontSize: 24),
        ),
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
                      ScreenHeader('Headlines'),
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: headlines
                              .map((article) => Headline(article))
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 25),
                      HomeNewsList("Business", categoryArticles["business"]),
                      HomeNewsList("Health", categoryArticles["health"]),
                      HomeNewsList("Science and Tech",
                          categoryArticles["scienceandtech"]),
                      HomeNewsList("World", categoryArticles["world"]),
                      HomeNewsList("Sports", categoryArticles["sports"]),
                      HomeNewsList(
                          "Entertainment", categoryArticles["entertainment"]),
                      HomeNewsList("Products", categoryArticles["products"]),
                      HomeNewsList("US Sports", categoryArticles["sports"]),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
