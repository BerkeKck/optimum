
import 'package:flutter/material.dart';

class CombinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Combine'),
      ),
      body: Center(
        child: Text('Combine Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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