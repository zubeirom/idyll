import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'news.dart';

class Favorite with ChangeNotifier {
  static const NEWS = "news";

  Favorite() {
    getNewsArticles();
  }

  List<Article> _newsArticles = [];

  List<Article> get newsArticles {
    return [..._newsArticles];
  }

  Future<void> getNewsArticles() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final newsStringList =
          prefs.containsKey(NEWS) ? prefs.getStringList(NEWS) : [];

      _newsArticles = _mapToList(newsStringList);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addNewsArticle(Article article) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var favoriteNews = [];

      if (prefs.containsKey(NEWS)) {
        favoriteNews = prefs.getStringList(NEWS);
      }

      String encoded = jsonEncode(article);

      prefs.setStringList(NEWS, [...favoriteNews, encoded]);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  List<Article> getArticlesByType(String type) {
    switch (type) {
      case "news":
        return _newsArticles;
        break;
      default:
        return [];
    }
  }

  List<Article> _mapToList(List stringList) {
    List<Article> articlesList = [];

    stringList.forEach((article) {
      Map articleMap = jsonDecode(article);
      articlesList.add(Article.fromJson(articleMap));
    });

    return articlesList;
  }
}