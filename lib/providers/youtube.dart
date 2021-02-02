import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:numeral/numeral.dart';

import 'news.dart';

class Youtube with ChangeNotifier {
  static const BASE_URL =
      "https://www.googleapis.com/youtube/v3/videos?part=statistics%2C%20snippet&chart=mostPopular&maxResults=20&key=AIzaSyA2pCWAsYrEA7hGS0Bk1CbV3KUOPiI-JTs";

  Youtube() {
    getNewsArticles();
  }

  List<Article> _newsArticles = [];

  List<Article> get newsArticles {
    return [..._newsArticles];
  }

  Future<void> getNewsArticles() async {
    try {
      final res = await http.get(BASE_URL);
      final extractData = json.decode(res.body) as Map<String, dynamic>;
      _newsArticles = _mapArticle(extractData['items']);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<Article> _mapArticle(List data) {
    final List<Article> loadedArticles = [];
    data.forEach((article) {
      loadedArticles.add(
        Article(
            provider: "Views: " +
                Numeral(int.parse(article['statistics']['viewCount'])).value(),
            description: article['snippet']['description'],
            publishedAt: DateTime.parse(article['snippet']['publishedAt']),
            title: article['snippet']['title'] +
                " - " +
                article['snippet']['channelTitle'],
            url: "https://youtube.com/watch?v=" + article['id'],
            urlToImage: article['snippet']['thumbnails']['standard'] != null
                ? article['snippet']['thumbnails']['standard']['url']
                : "https://i.imgur.com/3wz0jHy.jpg",
            category: "YouTube"),
      );
    });
    return loadedArticles;
  }
}
