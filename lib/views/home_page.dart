import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:optimum/size_config.dart';
import '../app_styles.dart';
import '../widgets/navigation_bar.dart' as optNavigation;
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState () => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Weather API 
Future<String> _fetchWeatherCondition(String cityName) async {
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


//weather icons
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


  List<String> categories = [
    "All Items",
    "Dress",
    "Pants",
    "Tshirts",
    "Skirts",
    "Shoes",
  ];
  List<String> icons = [
    'all_items_icon.png',
    'dress_icon.png',
    'pants_icon.png',
    'tshirt_icon.png',
    'skirt_icon',
    'shoes_icon',
  ];
  List<String> images = [
    'image-01',
    'image-02',
    'image-03',
    'image-04',
    'image-05',
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
  // AppBar
  AppBar _buildAppBar(String weatherCondition, String cityName) {
  final weatherIcon = _getWeatherIcon(weatherCondition);

  return AppBar(
    backgroundColor: Colors.grey, // Set the background color to grey
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/$weatherIcon',
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 4),
        Text(
          cityName,
          style: kEncodeSansBold.copyWith(
            color: kDarkBrown,
            fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
          ),
        ),
      ],
    ),
    centerTitle: true,
    leading: Container(), // Remove the leading back button
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: SizedBox(),
    ),
  );
}


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
          return _buildAppBar(weatherCondition, cityName);
        } else if (snapshot.hasError) {
          return _buildAppBar('default', cityName);
        }
        return _buildAppBar('', cityName);
      },
    ),
  );
}

  SizeConfig().init(context);

  return Scaffold(
    bottomNavigationBar: optNavigation.NavigationBar(),
    appBar: _buildAppBarWithWeather('Istanbul'), // Şehir İsmi
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
                    Text(
                      'Welcome To Optimum',
                      style: kEncodeSansBold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
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
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: const IconTheme(
                        data: IconThemeData(
                          color: kDarkGrey,
                        ),
                        child: Icon(Icons.search),
                      ),
                      hintText: 'Search',
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      hintStyle: kEncodeSansRegularBold.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
  }
}