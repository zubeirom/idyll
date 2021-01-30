import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Query with ChangeNotifier {
  static const KEY = 'queries';
  Query() {
    getQueries();
  }

  List<String> _queries = [];

  List<String> get queries {
    return [..._queries];
  }

  Future<void> getQueries() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _queries = prefs.containsKey(KEY) ? prefs.getStringList(KEY) : [];
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addQuery(String query) async {
    try {
      if (!_queries.contains(query)) {
        final prefs = await SharedPreferences.getInstance();
        var queries = [];

        if (prefs.containsKey(KEY)) {
          queries = prefs.getStringList(KEY);
        }

        prefs.setStringList(KEY, [...queries, query]).then((_) {
          notifyListeners();
        });
      }
    } catch (e) {
      throw e;
    }
  }
}
