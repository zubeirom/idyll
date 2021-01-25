import 'package:flutter/material.dart';
import 'package:idyll/providers/news.dart';
import 'news_item.dart';
import 'regular_button.dart';
import 'screen_header.dart';

enum Category { BUSINESS, HEALTH, SCIENCE, SPORTS, TECHNOLOGY }

class NewsList extends StatelessWidget {
  final String categoryTitle;
  final List<Article> categoryList;

  NewsList(this.categoryTitle, this.categoryList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScreenHeader(categoryTitle),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: RegularButton('Show all', () {}),
                ),
              ],
            ),
            SizedBox(height: 15),
            Column(
                children:
                    categoryList.map((article) => NewsItem(article)).toList()),
          ],
        ),
      ),
    );
  }
}
