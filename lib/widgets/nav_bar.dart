import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:optimum/views/home_page.dart';
import 'package:optimum/views/combine_page.dart';
import 'package:optimum/views/wardrobe_page.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  CustomNavigationBar({
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: currentIndex,
      onItemSelected: onTabTapped,
      items: [
        FlashyTabBarItem(
          icon: IconTheme(
            data: IconThemeData(color: currentIndex == 0 ? Colors.black : Colors.grey),
            child: Image.asset('assets/images/home.png', width: 24, height: 24),
          ),
          title: Text('Home'),
        ),
        FlashyTabBarItem(
          icon: IconTheme(
            data: IconThemeData(color: currentIndex == 1 ? Colors.black : Colors.grey),
            child: Image.asset('assets/images/combine.png', width: 24, height: 24),
          ),
          title: Text('Combine'),
        ),
        FlashyTabBarItem(
          icon: IconTheme(
            data: IconThemeData(color: currentIndex == 2 ? Colors.black : Colors.grey),
            child: Image.asset('assets/images/wardrobe.png', width: 24, height: 24),
          ),
          title: Text('Wardrobe'),
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 212, 212, 212), // Customize the background color
      animationCurve: Curves.easeInOut, // Customize the animation curve
      animationDuration: const Duration(milliseconds: 200), // Customize the animation duration
    );
  }
}
