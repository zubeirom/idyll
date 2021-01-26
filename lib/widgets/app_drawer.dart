import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idyll/screens/favorite_screen.dart';
import 'package:idyll/screens/home_screen.dart';
import 'package:idyll/widgets/screen_header.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
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
                    .pushReplacementNamed(FavoriteScreen.routeName);
              },
            ),
            SizedBox(height: 30),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenHeader('News'),
                  FaIcon(FontAwesomeIcons.newspaper),
                ],
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
            ),
            SizedBox(height: 30),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenHeader('Product Hunt'),
                  FaIcon(FontAwesomeIcons.productHunt),
                ],
              ),
              onTap: () {},
            ),
            SizedBox(height: 30),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenHeader('Youtube'),
                  FaIcon(FontAwesomeIcons.youtube),
                ],
              ),
              onTap: () {},
            ),
            SizedBox(height: 30),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenHeader('Hacker News'),
                  FaIcon(FontAwesomeIcons.hackerNewsSquare),
                ],
              ),
              onTap: () {},
            ),
            SizedBox(height: 30),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenHeader('GitHub'),
                  FaIcon(FontAwesomeIcons.github),
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    ));
  }
}
