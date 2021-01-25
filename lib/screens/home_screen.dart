import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/widgets/app_drawer.dart';
import 'package:idyll/widgets/headline.dart';
import 'package:idyll/widgets/image_link_list.dart';
import 'package:idyll/widgets/regular_button.dart';
import 'package:provider/provider.dart';
import '../util.dart';
import '../widgets/news_list.dart';
import '../widgets/screen_header.dart';

class HomeScreen extends StatefulWidget {
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
              onPressed: () => {},
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
                      NewsList("Business", categoryArticles["business"]),
                      SizedBox(height: 25),
                      NewsList("Health", categoryArticles["health"]),
                      SizedBox(height: 25),
                      NewsList("Science and Tech",
                          categoryArticles["scienceandtech"]),
                      SizedBox(height: 25),
                      NewsList("World", categoryArticles["world"]),
                      SizedBox(height: 25),
                      NewsList("Sports", categoryArticles["sports"]),
                      SizedBox(height: 25),
                      NewsList(
                          "Entertainment", categoryArticles["entertainment"]),
                      SizedBox(height: 25),
                      NewsList("Products", categoryArticles["products"]),
                      SizedBox(height: 25),
                      NewsList("US Sports", categoryArticles["sports"]),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
