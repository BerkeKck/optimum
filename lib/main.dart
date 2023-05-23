import 'package:flutter/material.dart';
import 'views/CombinePage.dart';
import 'views/HomePage.dart';
import 'views/WardrobePage.dart';

void main() {
  runApp(NavigationBarApp());
}

class NavigationBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Bar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/combine': (context) => CombinePage(),
        '/wardrobe': (context) => WardrobePage(),
      },
    );
  }
}
