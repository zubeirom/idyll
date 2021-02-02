import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idyll/screens/countries_screen.dart';
import 'package:idyll/screens/favorite_screen.dart';
import 'package:idyll/screens/hackernews_screen.dart';
import 'package:idyll/screens/home_screen.dart';
import 'package:idyll/screens/producthunt_screen.dart';
import 'package:idyll/screens/reddit_screen.dart';
import 'package:idyll/screens/youtube_screen.dart';
import 'package:idyll/widgets/screen_header.dart';
import 'package:idyll/screens/privacy_policy_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScreenHeader('Favorites'),
                      FaIcon(
                        FontAwesomeIcons.bookmark,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(FavoriteScreen.routeName);
                  },
                ),
                SizedBox(height: 25),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScreenHeader('Countries'),
                      Icon(
                        Icons.public,
                        size: 26,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(CountriesScreen.routeName);
                  },
                ),
                SizedBox(height: 25),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScreenHeader('News'),
                      FaIcon(
                        FontAwesomeIcons.newspaper,
                        size: 23,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  },
                ),
                SizedBox(height: 25),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScreenHeader('Product Hunt'),
                      FaIcon(FontAwesomeIcons.productHunt),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(ProductHuntScreen.routeName);
                  },
                ),
                SizedBox(height: 25),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScreenHeader('Reddit'),
                      FaIcon(FontAwesomeIcons.reddit),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(RedditScreen.routeName);
                  },
                ),
                SizedBox(height: 25),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScreenHeader('Youtube'),
                      FaIcon(FontAwesomeIcons.youtube, size: 23),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(YoutubeScreen.routeName);
                  },
                ),
                SizedBox(height: 25),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScreenHeader('Hacker News'),
                      FaIcon(FontAwesomeIcons.hackerNewsSquare),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(HackerNewsScreen.routeName);
                  },
                ),
                SizedBox(height: 25),
                FlatButton(
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(PrivacyPolicyScreen.routeName);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
