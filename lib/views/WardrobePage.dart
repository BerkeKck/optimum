import 'package:flutter/material.dart';

class WardrobePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wardrobe'),
      ),
      body: Center(
        child: Text('Wardrobe Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Combine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gif_box_rounded),
            label: 'Wardrobe',
          ),
        ],
      ),
    );
  }
}