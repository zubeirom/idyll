import 'package:flutter/material.dart';
import 'package:idyll/providers/favorite.dart';
import 'package:provider/provider.dart';
import 'news_item.dart';
import 'screen_header.dart';

class FavoriteNewsList extends StatelessWidget {
  final String categoryTitle;
  final String categoryType;
  final bool isFavorite;

  FavoriteNewsList(this.categoryTitle, this.categoryType, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final favoritesState = Provider.of<Favorite>(context);
    final articles = favoritesState.newsArticles;

    return Container(
      child: SingleChildScrollView(
        child: articles.isNotEmpty
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
                      children: articles
                          .map((article) => NewsItem(article, isFavorite))
                          .toList()),
                  SizedBox(height: 40),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  ScreenHeader("Nothing was added..."),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        height: 200,
                        child: Image.asset('assets/images/waiting.png',
                            fit: BoxFit.cover)),
                  ])
                ],
              ),
      ),
    );
  }
}
