import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optimum/app_styles.dart';


class CombinePage extends StatefulWidget {
  final String weatherCondition;

  CombinePage({required this.weatherCondition});

  @override
  _CombinePageState createState() => _CombinePageState();
}

class _CombinePageState extends State<CombinePage> {
  List<String> topsCategories = ['hoodie', 'top', 'coat', 'dress', 'tshirt'];
  List<String> bottomsCategories = ['pants', 'skirt'];
  List<String> shoesCategories = ['boot', 'heel', 'casual'];
  List<String> accessoriesCategories = ['handbags'];

  List<String> topsPaths = [];
  List<String> bottomsPaths = [];
  List<String> shoesPaths = [];
  List<String> accessoriesPaths = [];

  String? selectedTop;
  String? selectedBottom;
  String? selectedShoe;
  String? selectedAccessory;

  @override
  void initState() {
    super.initState();
    loadPhotos();
  }

  Future<void> loadPhotos() async {
    final List<Future<void>> futures = [];

    // Load Tops Photos
    for (var category in topsCategories) {
      List<String> categoryPaths = generatePaths(category);
      topsPaths.addAll(categoryPaths);
      futures.addAll(categoryPaths.map(rootBundle.load));
    }

    // Load Bottoms Photos
    for (var category in bottomsCategories) {
      List<String> categoryPaths = generatePaths(category);
      bottomsPaths.addAll(categoryPaths);
      futures.addAll(categoryPaths.map(rootBundle.load));
    }

    // Load Shoes Photos
    for (var category in shoesCategories) {
      List<String> categoryPaths = generatePaths(category);
      shoesPaths.addAll(categoryPaths);
      futures.addAll(categoryPaths.map(rootBundle.load));
    }

    // Load Accessories Photos
    for (var category in accessoriesCategories) {
      List<String> categoryPaths = generatePaths(category);
      accessoriesPaths.addAll(categoryPaths);
      futures.addAll(categoryPaths.map(rootBundle.load));
    }

    await Future.wait<void>(futures);

    if (mounted) {
      setState(() {});
    }
  }

  List<String> generatePaths(String category) {
    List<String> assetPaths = [];
    String folderName = category.toLowerCase();
    int count = 1;
    int maxCount = 3; // You can adjust the maxCount value here

    while (count <= maxCount) {
      String assetPath = 'photos/$folderName/$category-$count.jpg';
      try {
        rootBundle.load(assetPath);
        assetPaths.add(assetPath);
        count++;
      } catch (e) {
        break;
      }
    }

    return assetPaths;
  }

  void generateCombination() {
    final random = Random();

    selectedTop = topsPaths.isNotEmpty ? topsPaths[random.nextInt(topsPaths.length)] : null;
    selectedBottom = bottomsPaths.isNotEmpty ? bottomsPaths[random.nextInt(bottomsPaths.length)] : null;
    selectedShoe = shoesPaths.isNotEmpty ? shoesPaths[random.nextInt(shoesPaths.length)] : null;
    selectedAccessory = accessoriesPaths.isNotEmpty ? accessoriesPaths[random.nextInt(accessoriesPaths.length)] : null;

    setState(() {});
  }

 @override
Widget build(BuildContext context) {
  const Color fieldColor = Color(0xFF4a707a);

  return Scaffold(
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Frame(
          decoration: BoxDecoration(
            border: Border.all(
              color: fieldColor,
              width: 10.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(),
                          child: selectedTop != null ? Image.asset(selectedTop!) : Container(),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 150,
                          height: 150,
                          child: selectedBottom != null ? Image.asset(selectedBottom!) : Container(),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(),
                          child: selectedShoe != null ? Image.asset(selectedShoe!) : Container(),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 100,
                      height: 100,
                      child: selectedAccessory != null ? Image.asset(selectedAccessory!) : Container(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your outfit is ready!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(
      onPressed: generateCombination,
      child: Icon(Icons.refresh),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: fieldColor,
    ),
  );
}
}

class Frame extends StatelessWidget {
  final Widget child;
  final BoxDecoration decoration;

  Frame({required this.child, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: child,
    );
  }
}
