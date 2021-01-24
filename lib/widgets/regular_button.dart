import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularButton extends StatelessWidget {
  final String title;
  final Function handler;

  RegularButton(this.title, this.handler);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 0,
      height: 30,
      child: RaisedButton(
        elevation: 0,
        child: Text(
          title,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        color: Color.fromRGBO(211, 211, 211, 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: handler,
      ),
    );
  }
}
