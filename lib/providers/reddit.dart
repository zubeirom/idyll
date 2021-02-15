import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:numeral/numeral.dart';

import 'news.dart';

class Reddit with ChangeNotifier {
  static const BASE_URL = "https://www.reddit.com/r/popular/hot.json?limit=25";

  Reddit() {
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
      final extractData = json.decode(res.body) as Map<String, dynamic>;
      _newsArticles = _mapArticle(extractData['data']['children']);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<Article> _mapArticle(List data) {
    final List<Article> loadedArticles = [];
    data.forEach((article) {
      if (Platform.isIOS) {
        String title = article['data']['title'];
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
            provider: "Ups: " + Numeral(article['data']['ups']).value(),
            description: article['data']['selftext'],
            publishedAt: DateTime.fromMicrosecondsSinceEpoch(
                article['data']['created'].toInt()),
            title: article['data']['title'] +
                " - " +
                article['data']['subreddit_name_prefixed'],
            url: "https://www.reddit.com" + article['data']['permalink'],
            urlToImage: checkIfImageExists(article['data'])
                ? article['data']['url_overridden_by_dest']
                : "https://i.imgur.com/3eY3trj.jpg",
            category: "Reddit"),
      );
    });
    return loadedArticles;
  }

  bool checkIfImageExists(Map data) {
    String thumbnail = data['thumbnail'];
    String ov = data['url_overridden_by_dest'];
    if (thumbnail.contains('http') && ov != null) {
      if (ov.contains('.jpg') || ov.contains('.png')) {
        return true;
      }
    }
    return false;
  }
}
