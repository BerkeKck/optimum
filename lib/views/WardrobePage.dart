import 'package:flutter/material.dart';
import 'package:optimum/widgets/navigationBar.dart';

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
      bottomNavigationBar: navigationBar(),
    );
  }
}
