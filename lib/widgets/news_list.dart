import 'package:flutter/material.dart';

import 'news_item.dart';
import 'regular_button.dart';
import 'screen_header.dart';

enum Category { BUSINESS, HEALTH, SCIENCE, SPORTS, TECHNOLOGY }

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScreenHeader("Business"),
                RegularButton(),
              ],
            ),
            SizedBox(height: 15),
            Column(
              children: [
                NewsItem(
                    "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
                    "Coronavirus updates: Larry King dies after being hospitalized with COVID-19; Capitol Police, National Guard report new cases"),
                NewsItem(
                    "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
                    "States scramble for more COVID-19 vaccines, new concern over contagious variant"),
                NewsItem(
                    "https://image.cnbcfm.com/api/v1/image/104950937-RTX4DFJL-1.jpg?v=1529452421&w=1400&h=950",
                    "Larry King, legendary talk show host, dies at 87"),
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
            ),
          ],
        ),
      ),
    );
  }
}
