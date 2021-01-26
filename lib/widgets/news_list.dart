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
        child: categoryList.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScreenHeader(categoryTitle),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                      children: categoryList
                          .map((article) => NewsItem(article))
                          .toList()),
                  SizedBox(height: 40),
                ],
              )
            : Column(
                children: [
                  SizedBox(height: 40),
                  ScreenHeader("Nothing was added..."),
                  SizedBox(height: 20),
                  Container(
                      height: 200,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              ),
      ),
    );
  }
}
