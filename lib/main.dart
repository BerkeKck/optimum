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
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Customize the selected item color
          unselectedItemColor: Colors.grey, // Customize the unselected item color
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Customize the selected label style
          showSelectedLabels: true, // Show labels for selected items only
          showUnselectedLabels: false, // Hide labels for unselected items
        ),
      ),
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/home.png', width: 24, height: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/combine.png', width: 24, height: 24),
              label: 'Combine',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/wardrobe.png', width: 24, height: 24),
              label: 'Wardrobe',
            ),
          ],
        ),
      ),
    );
  }
}