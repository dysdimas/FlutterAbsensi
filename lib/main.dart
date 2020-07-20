import 'package:byb_absensi/home.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => AuthPage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => HomePage(),
    },
  ));
}
