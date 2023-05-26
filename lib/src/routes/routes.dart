
import 'package:optimum/views/combine_page.dart';
import 'package:optimum/views/home_page.dart';
import 'package:optimum/views/wardrobe_page.dart';

import 'package:flutter/material.dart';



class AppRoutes {
  static const String home = '/home';
  static const String combine = '/combine';
  static const String wardrobe = '/wardrobe';

  

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case combine:
        return MaterialPageRoute(builder: (_) => CombinePage());
      case wardrobe:
        return MaterialPageRoute(builder: (_) => WardrobePage());
      default:HomePage; 
        return null;
    }
  }
}