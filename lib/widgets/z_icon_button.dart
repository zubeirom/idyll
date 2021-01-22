import 'package:flutter/material.dart';

class ZIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: Color.fromRGBO(211, 211, 211, 100),
      textColor: Colors.black,
      child: Icon(Icons.menu),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
