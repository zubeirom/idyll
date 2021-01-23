import 'package:flutter/material.dart';

import 'news_item.dart';

enum Category { BUSINESS, HEALTH, SCIENCE, SPORTS, TECHNOLOGY }

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NewsItem(
            "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
            "Egypt Is on Edge as Security Tightens Over Protest"),
        NewsItem(
            "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
            "Egypt Is on Edge as Security Tightens Over Protest"),
        NewsItem(
            "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
            "Egypt Is on Edge as Security Tightens Over Protest"),
        NewsItem(
            "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
            "Egypt Is on Edge as Security Tightens Over Protest"),
        NewsItem(
            "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
            "Egypt Is on Edge as Security Tightens Over Protest"),
        NewsItem(
            "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
            "Egypt Is on Edge as Security Tightens Over Protest"),
        NewsItem(
            "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
            "Egypt Is on Edge as Security Tightens Over Protest"),
        NewsItem(
            "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
            "Egypt Is on Edge as Security Tightens Over Protest"),
      ],
    );
  }
}
