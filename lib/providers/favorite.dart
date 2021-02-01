import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'news.dart';

class Favorite with ChangeNotifier {
  static const NEWS = "news";
  static const PH = "producthunt";

  Favorite() {
    getNewsArticles();
  }

  List<Article> _newsArticles = [];
  List<Article> _productHunt = [];

  List<Article> get newsArticles {
    return [..._newsArticles];
  }

  List<Article> get productHunt {
    return [..._productHunt];
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
      print(_ifExists(article));
      if (!_ifExists(article)) {
        _newsArticles.add(article);
        final prefs = await SharedPreferences.getInstance();
        var favoriteNews = [];

        if (prefs.containsKey(NEWS)) {
          favoriteNews = prefs.getStringList(NEWS);
        }

        String encoded = jsonEncode(article);

        prefs.setStringList(NEWS, [encoded, ...favoriteNews]);
      }

      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteArticle(Article art) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _newsArticles.removeWhere((article) =>
          article.publishedAt.toString() == art.publishedAt.toString());
      List<String> newList = toListString(_newsArticles);
      prefs.setStringList(NEWS, [...newList]);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  bool _ifExists(Article article) {
    bool res = false;
    for (final element in _newsArticles) {
      if (element.url == article.url) {
        res = true;
        break;
      }
    }
    return res;
  }

  List<String> toListString(List<Article> articles) {
    return articles.map((article) => jsonEncode(article)).toList();
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
