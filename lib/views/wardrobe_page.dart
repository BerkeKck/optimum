import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart' as optNavigation;

class WardrobePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    bottomNavigationBar: optNavigation.NavigationBar(),
      body: Center(
        child: Text('Wardrobe Page'),
      ),
    );
  }
}
