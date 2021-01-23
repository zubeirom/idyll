import 'package:flutter/material.dart';
import 'package:idyll/providers/news.dart';
import 'package:provider/provider.dart';
import 'news_item.dart';
import 'regular_button.dart';
import 'screen_header.dart';

enum Category { BUSINESS, HEALTH, SCIENCE, SPORTS, TECHNOLOGY }

class NewsList extends StatefulWidget {
  final String categoryType;
  final String categoryTitle;

  NewsList(this.categoryTitle, this.categoryType);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<Article> articlesList;
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<News>(context)
          .getByCategory(widget.categoryType, true)
          .then((res) {
        articlesList = res;
        setState(() {
          _isLoading = false;
        });
        print(articlesList);
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScreenHeader(widget.categoryTitle),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: RegularButton(),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: articlesList
                        .map((article) => NewsItem(article))
                        .toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
