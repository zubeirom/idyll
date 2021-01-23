import 'package:flutter/material.dart';

import 'screen_header.dart';

enum Category { BUSINESS, HEALTH, SCIENCE, SPORTS, TECHNOLOGY }

class NewsList extends StatelessWidget {
  final String categoryTitle;
  NewsList(this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        ScreenHeader(categoryTitle),
      ],
    );
  }
}
