import 'package:flutter/material.dart';
import 'package:optimum/app_styles.dart';

enum WeatherCondition {
  rainy,
  cloudy,
  snowy,
  sunny,
}

class AppTheme {
  static ThemeData getTheme(WeatherCondition weatherCondition) {
    switch (weatherCondition) {
      case WeatherCondition.rainy:
        return _buildRainyTheme();
      case WeatherCondition.cloudy:
        return _buildCloudyTheme();
      case WeatherCondition.snowy:
        return _buildSnowyTheme();
      case WeatherCondition.sunny:
        return _buildSunnyTheme();
      default:
        return _buildDefaultTheme();
    }
  }

  static ThemeData _buildDefaultTheme() {
    return ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData _buildRainyTheme() {
    return ThemeData(
      primaryColor: kBlue,
      scaffoldBackgroundColor: kBlue,
    );
  }

  static ThemeData _buildCloudyTheme() {
    return ThemeData(
      primaryColor: kGrey,
      scaffoldBackgroundColor: kGrey,
    );
  }

  static ThemeData _buildSnowyTheme() {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData _buildSunnyTheme() {
    return ThemeData(
      primaryColor: kYellow,
      scaffoldBackgroundColor: kYellow,
    );
  }
}
