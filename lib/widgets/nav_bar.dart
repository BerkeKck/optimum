import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:optimum/app_styles.dart';


class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const CustomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: currentIndex,
      onItemSelected: onTabTapped,
      items: [
        FlashyTabBarItem(
          icon: Image.asset('assets/images/home.png', width: 24, height: 24),
          title: Text(
            'HOME',
            style: TextStyle(
              color: currentIndex == 0 ? lightfieldColor : Colors.grey,
            ),
          ),
        ),
        FlashyTabBarItem(
          icon: Image.asset('assets/images/combine.png', width: 24, height: 24),
          title: Text(
            'COMBINE',
            style: TextStyle(
              color: currentIndex == 1 ? lightfieldColor : Colors.grey,
            ),
          ),
        ),
        FlashyTabBarItem(
          icon: Image.asset('assets/images/wardrobe.png', width: 24, height: 24),
          title: Text(
            'WARDROBE', 
            style: TextStyle(
              color: currentIndex == 2 ? lightfieldColor : Colors.grey,
            ),
          ),
        ),
      ],
      backgroundColor: fieldColor , // Customize the background color
      animationCurve: Curves.easeIn, // Customize the animation curve
      animationDuration: const Duration(milliseconds: 200), // Customize the animation duration
    );
  }
}
