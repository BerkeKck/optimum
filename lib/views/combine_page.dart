import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart' as optNavigation;

class CombinePage extends StatelessWidget {
  const CombinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: optNavigation.NavigationBar(),
      body: Center(
        child: Text('Combine Page'),
      ),
    );
  }
}
