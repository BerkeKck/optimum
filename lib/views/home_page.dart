import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:optimum/src/constant/photos.dart';

import 'package:optimum/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;

  // Fetch weather condition
  Future<Map<String, dynamic>> fetchWeatherData(String cityName) async {
    final apiKey = 'd2ec9493d97a4b615417279ade65e7d5'; // Replace with your OpenWeatherMap API key
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final weatherData = data['weather'] as List<dynamic>;
      if (weatherData.isNotEmpty) {
        final weatherCondition = weatherData[0]['main'].toString().toLowerCase();
        final temperature = data['main']['temp'].round();
        return {'weatherCondition': weatherCondition, 'temperature': temperature};
      }
    }
    throw Exception('Failed to fetch weather data');
  }

  // Update AppBar based on weather condition
  PreferredSizeWidget _buildAppBarWithWeather(String cityName) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80), // Increase the height of the AppBar
      child: FutureBuilder<Map<String, dynamic>>(
        future: fetchWeatherData(cityName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final weatherData = snapshot.data!;
            final weatherCondition = weatherData['weatherCondition'];
            final temperature = weatherData['temperature'];

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
              toolbarHeight: 80, // Set the height of the AppBar
              titleSpacing: 0, // Remove the default spacing between title and leading widget
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4), // Add left padding to the city name
                    child: Text(
                      cityName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:15.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(60),
                    child: SvgPicture.asset(
                      'assets/icons/${_getWeatherIcon(weatherCondition)}',
                      width: 60, 
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0), // Add right padding to the temperature
                    child: Text(
                      '$temperature°C',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              leading: Container(), // Remove the leading back button
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox(),
              ),
            );
          } else if (snapshot.hasError) {
            return AppBar();
          }
          return AppBar(
            backgroundColor: Colors.grey, // Set the background color to grey
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
      return 'rainy \n☂️Don\'t forget your umbrella ☂️!';
    } else if (condition.contains('clouds')) {
      return 'cloudy \nGood day to be outside ';
    } else if (condition.contains('sun') || condition.contains('clear')) {
      return 'sunny \n😎Sunglasses looks good on you 😎!';
    } else if (condition.contains('snow')) {
      return 'snowy \n❄️⛄ Scarves and boots needed ❄️⛄!';
    } else {
      return 'Can\'t get the data of your city';
    }
  }


  @override
Widget build(BuildContext context) {
  String cityName = 'Ardahan'; // Assign the desired city name here

  return Scaffold(
    appBar: _buildAppBarWithWeather(cityName),
    body: SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                FutureBuilder<Map<String, dynamic>>(
                  future: fetchWeatherData(cityName),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final weatherData = snapshot.data!;
                      final weatherCondition = weatherData['weatherCondition'];
                      final temperature = weatherData['temperature'];
                      String weatherText = _getWeatherText(weatherCondition);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '$cityName seems $weatherText',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: kDarkBrown,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  '\n Check out some outfits of other people!',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: kDarkGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                CarouselSlider(
                                  items: getWeatherImages(weatherCondition).map((imagePath) {
                                    return Image.asset(imagePath);
                                  }).toList(),
                                  options: CarouselOptions(
                                    viewportFraction: 0.30,
                                    height: 250.0,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 5),
                                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    pauseAutoPlayOnTouch: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '\n Accessories for $weatherCondition days! ',
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    color: kDarkGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                SizedBox(
                                  height: 150.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 8, // Number of accessories to display
                                    itemBuilder: (context, index) {
                                      String imagePath = 'photos/acc$weatherCondition/acc-${index + 1}.jpg';
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(imagePath),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('');
                    }
                    return Text('');
                  },
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