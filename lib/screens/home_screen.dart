import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              Text(
                'Idyll',
                style: TextStyle(color: Colors.black, fontFamily: 'Plaster'),
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
        body: Center(
          child: Text('Home'),
        ));
  }
}
