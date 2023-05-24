import 'package:flutter/material.dart';

class navigationBar extends StatelessWidget {
  const navigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/combine');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/wardrobe');
        }
      },
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
    );
  }
}
