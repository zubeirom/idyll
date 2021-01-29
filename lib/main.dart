import 'package:flutter/material.dart';
import 'package:idyll/providers/favorite.dart';
import 'package:idyll/screens/favorite_screen.dart';
import 'package:idyll/screens/producthunt_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import 'providers/news.dart';
import 'providers/producthunt.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => News()),
        ChangeNotifierProvider(create: (context) => Favorite()),
        ChangeNotifierProvider(create: (context) => ProductHunt())
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
      },
    );
  }
}
