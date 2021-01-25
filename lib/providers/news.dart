import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Article {
  final String provider;
  final String description;
  final DateTime publishedAt;
  final String title;
  final String url;
  final String urlToImage;

  Article(
      {@required this.description,
      @required this.publishedAt,
      @required this.provider,
      @required this.title,
      @required this.url,
      @required this.urlToImage});
}

class News with ChangeNotifier {
  static const BASE_URL = "https://api-idyll.now.sh";

  List<Article> _headlinesList = [];
  Map<String, List<Article>> _categoryArticles = {
    'business': [],
    'science': [],
    'health': [],
    'technology': [],
    'sport': []
  };

  List<Article> get headlines {
    return [..._headlinesList];
  }

  Map<String, List<Article>> get categoryArticles {
    return {..._categoryArticles};
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

  Future<List<Article>> getByCategory(String category) async {
    try {
      final res = await http.get(BASE_URL + '/news?category=$category');
      final extractData = json.decode(res.body) as Map<String, dynamic>;
      final list = _mapArticle(extractData['articles']);
      notifyListeners();
      return list;
    } catch (e) {
      throw e;
    }
  }

  Future<void> populateCategories() async {
    try {
      Map<String, List<Article>> data = {};
      data['business'] = await getByCategory('business');
      data['science'] = await getByCategory('science');
      data['technology'] = await getByCategory('technology');
      data['health'] = await getByCategory('health');
      data['sport'] = await getByCategory('sport');
      _categoryArticles = data;
    } catch (e) {
      throw e;
    }
  }

  List<Article> _mapArticle(List data) {
    final List<Article> loadedArticles = [];
    data.forEach((article) {
      loadedArticles.add(
        Article(
          provider: article['source']['name'],
          description: article['description'],
          publishedAt: DateTime.parse(article['publishedAt']),
          title: article['title'],
          url: article['url'],
          urlToImage: article['urlToImage'],
        ),
      );
    });
    return loadedArticles;
  }
}
