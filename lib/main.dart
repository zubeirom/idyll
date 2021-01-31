import 'package:flutter/material.dart';
import 'package:idyll/providers/favorite.dart';
import 'package:idyll/providers/hackernews.dart';
import 'package:idyll/providers/reddit.dart';
import 'package:idyll/providers/youtube.dart';
import 'package:idyll/screens/favorite_screen.dart';
import 'package:idyll/screens/hackernews_screen.dart';
import 'package:idyll/screens/producthunt_screen.dart';
import 'package:idyll/screens/reddit_screen.dart';
import 'package:idyll/screens/youtube_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import 'providers/news.dart';
import 'providers/producthunt.dart';
import 'screens/search_screen.dart';
import 'screens/query_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'providers/query.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => News()),
        ChangeNotifierProvider(create: (context) => Favorite()),
        ChangeNotifierProvider(create: (context) => ProductHunt()),
        ChangeNotifierProvider(create: (context) => Youtube()),
        ChangeNotifierProvider(create: (context) => Reddit()),
        ChangeNotifierProvider(create: (context) => HackerNews()),
        ChangeNotifierProvider(create: (context) => Query()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Idyll',
      theme: ThemeData(
        accentColor: Colors.black,
      ),
      home: HomeScreen(),
      routes: {
        FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ProductHuntScreen.routeName: (ctx) => ProductHuntScreen(),
        YoutubeScreen.routeName: (ctx) => YoutubeScreen(),
        RedditScreen.routeName: (ctx) => RedditScreen(),
        HackerNewsScreen.routeName: (ctx) => HackerNewsScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
        QueryScreen.routeName: (ctx) => QueryScreen(),
        PrivacyPolicyScreen.routeName: (ctx) => PrivacyPolicyScreen()
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('de', 'DK'),
        const Locale('de', 'AT'),
        const Locale('nl', 'BE'),
        const Locale('de', 'CH'),
        const Locale('de', 'DE'),
        const Locale('en', 'AU'),
        const Locale('en', 'CA'),
        const Locale('en', 'GB'),
        const Locale('en', 'ID'),
        const Locale('en', 'IE'),
        const Locale('en', 'IN'),
        const Locale('en', 'MY'),
        const Locale('en', 'NZ'),
        const Locale('en', 'PH'),
        const Locale('en', 'SG'),
        const Locale('en', 'US'),
        const Locale('en', 'WW'),
        const Locale('en', 'XA'),
        const Locale('en', 'ZA'),
        const Locale('es', 'AR'),
        const Locale('es', 'CL'),
        const Locale('es', 'ES'),
        const Locale('es', 'MX'),
        const Locale('es', 'US'),
        const Locale('es', 'XL'),
        const Locale('fi', 'FI'),
        const Locale('fr', 'BE'),
        const Locale('fr', 'CA'),
        const Locale('fr', 'CH'),
        const Locale('fr', 'FR'),
        const Locale('it', 'IT'),
        const Locale('zh', 'HK'),
        const Locale('zh', 'TW'),
        const Locale('ja', 'JP'),
        const Locale('ko', 'KR'),
        const Locale('nl', 'NL'),
        const Locale('zh', 'CN'),
        const Locale('pl', 'PL'),
        const Locale('pt', 'BR'),
        const Locale('ru', 'RU'),
        const Locale('sv', 'SE'),
        const Locale('tr', 'TR'),
      ],
    );
  }
}
