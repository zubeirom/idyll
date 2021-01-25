import 'package:flutter/material.dart';
import 'package:idyll/providers/news.dart';

import 'news_item.dart';

class Headline extends StatelessWidget {
  final Article article;

  Headline(this.article);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300,
          height: 280,
          child: NewsItem(article),
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
