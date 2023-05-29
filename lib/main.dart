import 'package:flutter/material.dart';
import 'package:optimum/views/home_page.dart';
import 'package:optimum/views/combine_page.dart';
import 'package:optimum/views/wardrobe_page.dart';

void main() => runApp(Optimum());

class Optimum extends StatefulWidget {
  @override
  _OptimumState createState() => _OptimumState();
}

class _OptimumState extends State<Optimum> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    CombinePage(),
    WardrobePage(),
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
            items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/home.png', width: 24, height: 24),
          label:'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/combine.png', width: 24, height: 24),
          label:'Combine',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/wardrobe.png', width: 24, height: 24),
          label:'Wardrobe',
        ),
          ],
        ),
      ),
    );
  }
}
