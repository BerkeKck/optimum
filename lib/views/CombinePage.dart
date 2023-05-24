import 'package:flutter/material.dart';
import 'package:optimum/widgets/navigationBar.dart';

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
      bottomNavigationBar: navigationBar(),
    );
  }
}