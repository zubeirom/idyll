import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/widgets/headline.dart';
import 'package:idyll/widgets/image_link_list.dart';
import 'package:idyll/widgets/regular_button.dart';
import 'package:provider/provider.dart';
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
  List<Article> headlines;
  Map<String, List<Article>> categoryArticles = {
    'business': [],
    'science': [],
    'technology': [],
    'health': [],
    'sport': []
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

      final newsProvider = Provider.of<News>(context, listen: false);

      newsProvider.getHeadlines().then((_) {
        headlines = newsProvider.headlines;
        setState(() {
          _isLoading = false;
        });
      });

      newsProvider.getByCategory('business', true).then((res) {
        categoryArticles['business'] = res;
      });

      newsProvider.getByCategory('science', true).then((res) {
        categoryArticles['science'] = res;
      });

      newsProvider.getByCategory('health', true).then((res) {
        categoryArticles['health'] = res;
      });

      newsProvider.getByCategory('sport', true).then((res) {
        categoryArticles['sport'] = res;
      });

      newsProvider.getByCategory('technology', true).then((res) {
        categoryArticles['technology'] = res;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshPage(BuildContext context) async {
    await Provider.of<News>(context, listen: false).getHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));

    Provider.of<News>(context).getHeadlines();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 100),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon: Icon(Icons.sort),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
            AutoSizeText(
              'Idyll',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Plaster', fontSize: 24),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 100),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ],
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
                      SizedBox(height: 40),
                      Container(
                        child: TabBar(
                          tabs: [
                            Container(
                              child: Icon(Icons.business_center_outlined),
                            ),
                            Container(
                              child: Icon(Icons.wb_incandescent_outlined),
                            ),
                            Container(
                              child: Icon(Icons.favorite_border_outlined),
                            ),
                            Container(
                              child: Icon(Icons.sports_basketball_outlined),
                            ),
                            Container(
                              child: Icon(Icons.devices_other_outlined),
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
                            NewsList("Business", categoryArticles["business"]),
                            NewsList("Science", categoryArticles["science"]),
                            NewsList("Health", categoryArticles["health"]),
                            NewsList("Sport", categoryArticles["sport"]),
                            NewsList(
                                "Technology", categoryArticles["technology"]),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ScreenHeader('News Sources'),
                          RegularButton(),
                        ],
                      ),
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ImageLinkList(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ScreenHeader('Countries'),
                          RegularButton(),
                        ],
                      ),
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ImageLinkList(),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
