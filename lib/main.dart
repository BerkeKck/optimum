import 'package:flutter/material.dart';
import 'package:optimum/views/HomePage.dart';
import 'package:optimum/views/wardrobePage.dart';
import 'package:optimum/views/combinePage.dart';
void main() => runApp(Optimum());
  
class Optimum extends StatelessWidget {
  const Optimum({super.key});

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
