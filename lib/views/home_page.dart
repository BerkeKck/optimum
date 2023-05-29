import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:optimum/size_config.dart';
import '../app_styles.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;

  // Fetch weather condition
  Future<String> fetchWeatherCondition(String cityName) async {
    final apiKey = 'd2ec9493d97a4b615417279ade65e7d5'; // Replace with your OpenWeatherMap API key
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final weatherData = data['weather'] as List<dynamic>;
      if (weatherData.isNotEmpty) {
        final weatherCondition = weatherData[0]['main'].toString().toLowerCase();
        return weatherCondition;
      }
    }
    throw Exception('Failed to fetch weather data');
  }

  // Update AppBar based on weather condition
  PreferredSizeWidget _buildAppBarWithWeather(String cityName) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: FutureBuilder<String>(
        future: fetchWeatherCondition(cityName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final weatherCondition = snapshot.data!;
            String weatherText = '';

            if (weatherCondition.contains('rain')) {
              weatherText = 'rainy';
            } else if (weatherCondition.contains('clear')) {
              weatherText = 'sunny';
            } else if (weatherCondition.contains('snow')) {
              weatherText = 'snowy';
            } else if (weatherCondition.contains('cloud')) {
              weatherText = 'cloudy';
            }

            return AppBar(
              backgroundColor: Colors.grey, // Set the background color to grey
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      'assets/icons/${_getWeatherIcon(weatherCondition)}',
                      width: 32,
                      height: 32,
                    ),
                  ),
                  Text(
                    cityName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              leading: Container(), // Remove the leading back button
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox(),
              ),
            );
          } else if (snapshot.hasError) {
            return AppBar(
              backgroundColor: Colors.grey, // Set the background color to grey
              title: Text(
                cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              centerTitle: true,
              leading: Container(), // Remove the leading back button
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox(),
              ),
            );
          }
          return AppBar(
            backgroundColor: Colors.grey, // Set the background color to grey
            title: Text(
              cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            centerTitle: true,
            leading: Container(), // Remove the leading back button
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: SizedBox(),
            ),
          );
        },
      ),
    );
  }

  String _getWeatherIcon(String condition) {
    if (condition.contains('rain')) {
      return 'rainy.svg';
    } else if (condition.contains('cloud')) {
      return 'cloudy.svg';
    } else if (condition.contains('sun') || condition.contains('clear')) {
      return 'sunny.svg';
    } else if (condition.contains('snow')) {
      return 'snowy.svg';
    } else {
      return 'default.svg';
    }
  }

  String _getWeatherText(String condition) {
    if (condition.contains('rain')) {
      return 'rainy. ☂️ Don\'t forget your umbrella ☂️!';
    } else if (condition.contains('cloud')) {
      return 'cloudy. Good day to be outside ';
    } else if (condition.contains('sun') || condition.contains('clear')) {
      return 'sunny. 😎 Sunglasses looks good on you 😎!';
    } else if (condition.contains('snow')) {
      return 'snowy. ❄️⛄ Scarves and boots needed ❄️⛄!';
    } else {
      return 'Can\'t get the data of your city';
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String cityName = 'Paris'; // Assign the desired city name here

    return Scaffold(
      appBar: _buildAppBarWithWeather(cityName),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder<String>(
                        future: fetchWeatherCondition(cityName),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final weatherCondition = snapshot.data!;
                            String weatherText = _getWeatherText(weatherCondition);

                            return Text(
                              '$cityName seems $weatherText',
                              style: kEncodeSansBold.copyWith(
                                color: kDarkBrown,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              '',
                              style: kEncodeSansBold.copyWith(
                                color: kDarkBrown,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              ),
                            );
                          }
                          return Text(
                            '',
                            style: kEncodeSansBold.copyWith(
                              color: kDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Check out some fits of other people!',
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          color: kDarkGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: kEncodeSansRegularBold.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: kEncodeSansRegularBold.copyWith(
                          color: kLightGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: kDarkGrey,
                          size: SizeConfig.blockSizeHorizontal! * 5.0,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeHorizontal! * 2.5,
                          horizontal: SizeConfig.blockSizeHorizontal! * 5.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: kLightGrey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: kLightGrey,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      // Perform search action
                    },
                    child: Container(
                      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2.0),
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: SizeConfig.blockSizeHorizontal! * 5.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}