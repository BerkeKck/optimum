import 'package:flutter/material.dart';
import 'package:optimum/views/home_page.dart';
import 'package:optimum/views/combine_page.dart';
import 'package:optimum/views/wardrobe_page.dart';
import 'package:optimum/widgets/nav_bar.dart';

void main() => runApp(Optimum());

class Optimum extends StatefulWidget {
  @override
  _OptimumState createState() => _OptimumState();
}

class _OptimumState extends State<Optimum> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    CombinePage(weatherCondition: '',),
    const WardrobePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}