import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:numeral/numeral.dart';

import 'news.dart';

class HackerNews with ChangeNotifier {
  static const BASE_URL = "https://api.hnpwa.com/v0/news/1.json";

  HackerNews() {
    getNewsArticles();
  }

  List<String> blacklist = [
    "corona",
    "coronavirus",
    "covid",
    "sarscov-2",
    "sars-cov-2",
    "sarscov",
    "sars-cov",
    "pandemic",
    "covid-19",
    "lockdown",
    "virus",
    "vaccine"
  ];

  List<Article> _newsArticles = [];

  List<Article> get newsArticles {
    return [..._newsArticles];
  }

  Future<void> getNewsArticles() async {
    try {
      final res = await http.get(BASE_URL);
      final extractData = json.decode(res.body) as List<dynamic>;
      _newsArticles = _mapArticle(extractData);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<Article> _mapArticle(List data) {
    final List<Article> loadedArticles = [];
    data.forEach((article) {
      if (Platform.isIOS) {
        String title = article['title'];
        bool res = false;

        for (var item in blacklist) {
          if (title.toLowerCase().contains(item)) {
            res = true;
          }
        }

        if (res) {
          return;
        }
      }
      loadedArticles.add(
        Article(
            provider: "Comments: " + Numeral(article['comments_count']).value(),
            description: "",
            publishedAt: DateTime.fromMicrosecondsSinceEpoch(article['time']),
            title: article['title'],
            url: article['url'],
            urlToImage: null,
            category: "Hacker News"),
      );
    });
    return loadedArticles;
  }
}
