import 'package:flutter/material.dart';
import 'package:idyll/providers/news.dart';
import 'package:idyll/widgets/news_item.dart';
import 'package:idyll/widgets/screen_header.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'search_screen.dart';

class QueryScreen extends StatefulWidget {
  static const routeName = "/search-result";
  @override
  _QueryScreenState createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  bool _isLoading = false;
  bool _isInit = true;
  List<Article> searchResults = [];
  String query;
  String _locale = "";

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Locale myLocale = Localizations.localeOf(context);

      SharedPreferences.getInstance().then((prefs) {
        _locale = prefs.getString("preferred_locale") ??
            myLocale.languageCode + "-" + myLocale.countryCode;
        print(_locale);

        query = ModalRoute.of(context).settings.arguments as String;
        Provider.of<News>(context, listen: false)
            .getFromQuery(query, _locale)
            .then((res) {
          setState(() {
            _isLoading = false;
            searchResults = res;
          });
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                  Navigator.of(context).popAndPushNamed(SearchScreen.routeName),
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
        title: ScreenHeader('Search'),
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
                      child: ScreenHeader("'$query'"),
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: searchResults
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
