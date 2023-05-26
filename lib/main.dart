// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:optimum/views/home_page.dart';
import 'package:optimum/views/combine_page.dart';
import 'package:optimum/views/wardrobe_page.dart';



void main() => runApp(Optimum());
  
class Optimum extends StatelessWidget {
  const Optimum({super.key});
  @override
Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
      routes: {
        '/home': (context) => HomePage(),
        '/combine': (context) => CombinePage(),
        '/wardrobe': (context) => WardrobePage(),
      },
    );
  }
}
