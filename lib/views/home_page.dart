import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:optimum/size_config.dart';
import '../app_styles.dart';
import '../widgets/navigation_bar.dart' as optNavigation;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState () => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    SizeConfig().init(context);

    return Scaffold(
    bottomNavigationBar: optNavigation.NavigationBar(),
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
                        style: kEncodeSansRegularBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: kGrey,
                    backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
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
                      decoration: BoxDecoration(
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
