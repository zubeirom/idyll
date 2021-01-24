import 'package:flutter/material.dart';
import 'package:idyll/widgets/ressource_modal.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import 'providers/news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: News(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Idyll',
        theme: ThemeData(
          accentColor: Colors.black,
        ),
        home: HomeScreen(),
        routes: {},
      ),
    );
  }
}
