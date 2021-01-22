import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/screen_header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 100),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon: Icon(Icons.sort),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
            AutoSizeText(
              'Idyll',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Plaster', fontSize: 24),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 100),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 15),
            ScreenHeader('Headlines'),
          ],
        ),
      ),
    );
  }
}
