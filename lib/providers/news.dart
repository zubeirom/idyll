import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Article {
  final String author;
  final String content;
  final String description;
  final DateTime publishedAt;
  final Map<String, dynamic> source;
  final String title;
  final String url;
  final String urlToImage;

  Article(
      {@required this.author,
      this.content,
      @required this.description,
      @required this.publishedAt,
      @required this.source,
      @required this.title,
      @required this.url,
      @required this.urlToImage});
}

class News with ChangeNotifier {
  static const BASE_URL = "https://api-idyll.now.sh";

  List<Article> _headlinesList = [];

  List<Article> get headlines {
    if (_headlinesList.length > 10) {
      return _headlinesList.sublist(0, 10);
    }
    return _headlinesList;
  }

  Future<void> getHeadlines() async {
    try {
      final res = await http.get(BASE_URL + '/news');
      final extractData = json.decode(res.body) as Map<String, dynamic>;
      _headlinesList = _mapArticle(extractData['articles']);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Article>> getByCategory(String category, bool shortList) async {
    try {
      final res = await http.get(BASE_URL + '/news?category=$category');
      final extractData = json.decode(res.body) as Map<String, dynamic>;
      final list = _mapArticle(extractData['articles']);
      if (shortList) {
        return list.sublist(0, 8);
      }
      notifyListeners();
      return list;
    } catch (e) {
      throw e;
    }
  }

  List<Article> _mapArticle(List data) {
    final List<Article> loadedArticles = [];
    data.forEach((article) {
      loadedArticles.add(
        Article(
          author: article['author'],
          description: article['description'],
          publishedAt: DateTime.now(), //DateTime.parse(article['publishedAt'])
          source: article['source'],
          title: article['title'],
          url: article['url'],
          urlToImage: article['urlToImage'],
        ),
      );
    });
    return loadedArticles;
  }
}
