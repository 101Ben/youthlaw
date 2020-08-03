import 'package:flutter/material.dart';
import 'package:youthlaw/DonationPage.dart';
import 'package:youthlaw/HomePage.dart';

void main() {
//  runApp(MyApp());
  runApp(MaterialApp(
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => HomePage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/donate': (context) => DonationPage(),
    },
  ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youth and Law Forum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'HomePage'),
    );
  }
}
