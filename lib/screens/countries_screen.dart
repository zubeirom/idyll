import 'package:auto_size_text/auto_size_text.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idyll/widgets/regular_button.dart';
import 'package:idyll/widgets/screen_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'search_screen.dart';

class CountriesScreen extends StatefulWidget {
  static const routeName = "/countries";

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  String groupLocale = "";

  void handleSelectedLocale(String locale) {
    setState(() {
      groupLocale = locale;
    });
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("preferred_locale", locale);
      Flushbar(
        animationDuration: Duration(milliseconds: 500),
        borderRadius: 8,
        messageText: AutoSizeText(
          'Location is set! Please reload the news page',
          style: GoogleFonts.domine(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 2),
      )..show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () =>
                  Navigator.of(context).pushNamed(SearchScreen.routeName),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: true,
        title: ScreenHeader('Countries'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  child: ScreenHeader(
                    "Select preferred location",
                    size: 16,
                  ),
                ),
                RegularButton("Reset", () {
                  Locale myLocale = Localizations.localeOf(context);

                  setState(() {
                    groupLocale = "";
                  });
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setString("preferred_locale",
                        myLocale.languageCode + "-" + myLocale.countryCode);
                    Flushbar(
                      animationDuration: Duration(milliseconds: 500),
                      borderRadius: 8,
                      messageText: AutoSizeText(
                        'Location is reset',
                        style: GoogleFonts.domine(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      duration: Duration(seconds: 2),
                    )..show(context);
                  });
                })
              ]),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Denmark"),
                        Radio(
                          value: "da-dk",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Austria"),
                        Radio(
                          value: "de-at",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Belgium"),
                        Radio(
                          value: "nl-be",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Switzerland"),
                        Radio(
                          value: "de-ch",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Germany"),
                        Radio(
                          value: "de-de",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Australia"),
                        Radio(
                          value: "en-au",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Canada"),
                        Radio(
                          value: "en-ca",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("United Kingdom"),
                        Radio(
                          value: "en-gb",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Indonesia"),
                        Radio(
                          value: "en-id",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ireland"),
                        Radio(
                          value: "en-ie",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("India"),
                        Radio(
                          value: "en-in",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Malaysia"),
                        Radio(
                          value: "en-my",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("New Zealand"),
                        Radio(
                          value: "en-nz",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Republic of the Philippines"),
                        Radio(
                          value: "en-ph",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Singapore"),
                        Radio(
                          value: "en-sg",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("United States"),
                        Radio(
                          value: "en-us",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("South Africa"),
                        Radio(
                          value: "en-za",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Argentina"),
                        Radio(
                          value: "es-ar",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Chile"),
                        Radio(
                          value: "es-cl",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Spain"),
                        Radio(
                          value: "es-es",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mexico"),
                        Radio(
                          value: "es-mx",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("United States in Spanish"),
                        Radio(
                          value: "es-us",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Finland"),
                        Radio(
                          value: "fi-fl",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Belgium in french"),
                        Radio(
                          value: "fr-be",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("French Canadian"),
                        Radio(
                          value: "fr-ca",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Switzerland in french"),
                        Radio(
                          value: "fr-ch",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("France"),
                        Radio(
                          value: "fr-fr",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Italy"),
                        Radio(
                          value: "it-it",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Hong Kong SAR"),
                        Radio(
                          value: "zh-hk",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Taiwan"),
                        Radio(
                          value: "zh-tw",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Japan"),
                        Radio(
                          value: "ja-jp",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Korea"),
                        Radio(
                          value: "ko-kr",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Netherlands"),
                        Radio(
                          value: "nl-nl",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("China"),
                        Radio(
                          value: "zh-cn",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Poland"),
                        Radio(
                          value: "pl-pl",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Brazil"),
                        Radio(
                          value: "pt-br",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Russia"),
                        Radio(
                          value: "ru-ru",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sweden"),
                        Radio(
                          value: "sv-se",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Turkey"),
                        Radio(
                          value: "tr-tr",
                          groupValue: groupLocale,
                          onChanged: handleSelectedLocale,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
