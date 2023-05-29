import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isHomePage = currentRoute == '/home';
    final isCombinePage = currentRoute == '/combine';
    final isWardrobePage = currentRoute == '/wardrobe';

    return BottomNavigationBar(
      key: key,
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/combine');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/wardrobe');
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/home.png', width: 24, height: 24),
          label: isHomePage ? '' : 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/combine.png', width: 24, height: 24),
          label: isCombinePage ? '' : 'Combine',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/wardrobe.png', width: 24, height: 24),
          label: isWardrobePage ? '' : 'Wardrobe',
        ),
      ],
    );
  }
}
