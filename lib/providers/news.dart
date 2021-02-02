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
  bool isFavorite;
  final String category;

  Article(
      {@required this.description,
      @required this.publishedAt,
      @required this.provider,
      @required this.title,
      @required this.url,
      @required this.urlToImage,
      @required this.category});

  Map<String, dynamic> toJson() {
    return {
      'provider': provider,
      'description': description,
      'publishedAt': publishedAt.toIso8601String(),
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
      'category': category
    };
  }

  Article.fromJson(Map<String, dynamic> json)
      : provider = json['provider'],
        description = json['description'],
        title = json['title'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = DateTime.parse(json['publishedAt']),
        category = json['category'];
}

class News with ChangeNotifier {
  static const BASE_URL = "https://api-idyll.now.sh";

  List<Article> _headlinesList = [];
  Map<String, List<Article>> _categoryArticles = {};

  List<Article> _searchResults = [];

  List<Article> get searchResults {
    return [..._searchResults];
  }

  List<Article> get headlines {
    return [..._headlinesList];
  }

  Map<String, List<Article>> get categoryArticles {
    return {..._categoryArticles};
  }

  Future<void> getHeadlines({String locale = "en-us"}) async {
    try {
      final res = await http.get(BASE_URL + '/news?locale=$locale');
      final extractData = json.decode(res.body) as Map<String, dynamic>;

      _headlinesList = _mapArticle(extractData['value']);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Article>> getByCategory(String category, String locale) async {
    try {
      final res =
          await http.get(BASE_URL + '/category?value=$category&locale=$locale');
      final extractData = json.decode(res.body) as Map<String, dynamic>;
      final list = _mapBing(extractData['value']);
      notifyListeners();
      return list;
    } catch (e) {
      throw e;
    }
  }

  Future<void> populateCategories(String locale) async {
    try {
      Map<String, List<Article>> data = {};
      data['business'] = await getByCategory('business', locale);
      data['scienceandtech'] =
          await getByCategory('ScienceAndTechnology', locale);
      data['sports'] = await getByCategory('sports', locale);
      data["world"] = await getByCategory("world", "en-us");
      data["politics"] = await getByCategory("politics", "en-us");
      data["products"] = await getByCategory("products", "en-us");
      data['health'] = await getByCategory('health', "en-us");
      data["entertainment"] = await getByCategory("entertainment", locale);

      _categoryArticles = data;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Article>> getFromQuery(String query, String locale) async {
    try {
      final res = await http.get(BASE_URL + '/search?q=$query&locale=$locale');
      final extractData = json.decode(res.body) as Map<String, dynamic>;
      return _mapBing(extractData['value']);
    } catch (e) {
      throw e;
    }
  }

  List<Article> _mapBing(List data) {
    final List<Article> loadedArticles = [];
    data.forEach((article) {
      loadedArticles.add(
        Article(
            provider: article['provider'][0]['name'],
            description: article['description'],
            publishedAt: DateTime.parse(article['datePublished']),
            title: article['name'],
            url: article['url'],
            urlToImage: null,
            category: "News"),
      );
    });
    return loadedArticles;
  }

  List<Article> _mapArticle(List data) {
    final List<Article> loadedArticles = [];
    data.forEach((article) {
      if (article['image'] != null) {
        loadedArticles.add(
          Article(
              provider: article['provider'][0]['name'],
              description: article['description'],
              publishedAt: DateTime.parse(article['datePublished']),
              title: article['name'],
              url: article['url'],
              urlToImage: article['image']['contentUrl'],
              category: "News"),
        );
      }
    });
    return loadedArticles;
  }
}
