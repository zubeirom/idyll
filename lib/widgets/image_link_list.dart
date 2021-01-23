import 'package:flutter/material.dart';

class ImageLinkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://cbsnews3.cbsistatic.com/hub/i/r/2019/04/01/727e357a-a126-4138-a2c5-4d3222669d57/thumbnail/1920x1080/6cf41fcba0c5e4418c548fd8f270265d/cbsn2-logo-1920x1080.jpg",
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://images-na.ssl-images-amazon.com/images/I/21Ck2NaxHTL.png",
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://icon-locator.herokuapp.com/icon?url=http://www.bild.de&size=70..120..200",
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://icon-locator.herokuapp.com/icon?url=http://www.businessinsider.com&size=70..120..200",
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://images-na.ssl-images-amazon.com/images/I/21Ck2NaxHTL.png",
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
