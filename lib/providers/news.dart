import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Article {
  final String author;
  final String content;
  final String description;
  final DateTime publishedAt;
  final Map<String, String> source;
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

  List<Article> get _headlines {
    if (_headlines.length <= 10) {
      return _headlines.sublist(0, 10);
    }
    return _headlines;
  }

  Future<void> getHeadlines() async {
    try {
      final res = await http.get(BASE_URL + '/news');
      final extractData = json.decode(res.body) as Map<String, dynamic>;
      print(extractData);
    } catch (e) {
      print(e);
    }
  }

  // List<Article> _mapArticle() {
  //   return
  // }zz
}
